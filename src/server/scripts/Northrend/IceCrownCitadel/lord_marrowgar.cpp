/*
* Copyright (C) 2009 - 2010 TrinityCore <http://www.trinitycore.org/>
*
* This program is free software; you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation; either version 2 of the License, or
* (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program; if not, write to the Free Software
* Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
*/

#include "ScriptPCH.h"
#include "icecrown_citadel.h"

#define SAY_INTRO   -1665892
#define SAY_AGGRO   -1665893
#define SAY_STORM   -1665894
#define SAY_SPIKE   RAND(-1665895,-1665896,-1665897)
#define SAY_KILL    RAND(-1665898,-1665899)
#define SAY_DEATH   -1665900
#define SAY_BERSERK -1665901

#define SPELL_BONE_STORM       RAID_MODE(69075,70834,70834,70835)
#define SPELL_SABER_SLASH      RAID_MODE(69055,70814,70814,69055)
#define SPELL_COLD_FLAME       RAID_MODE(69146,70823,70824,70825)
#define SPELL_BONE_SPIKE       RAID_MODE(73142,73143,73144,73145)
#define SPELL_SPIKE_IMPALING   69065
#define SPELL_STORM_CHANNEL    69076
#define SPELL_COLD_FLAME_SPAWN 69138
#define SPELL_BERSERK          26662

#define CREATURE_BONE_SPIKE 38711
#define CREATURE_COLD_FLAME 36672

class npc_bone_spike : public CreatureScript
{
public:
    npc_bone_spike() : CreatureScript("npc_bone_spike") { }

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new npc_bone_spikeAI(pCreature);
    }
struct npc_bone_spikeAI : public Scripted_NoMovementAI
{
    npc_bone_spikeAI(Creature* pCreature) : Scripted_NoMovementAI(pCreature)
    {
		pInstance = pCreature->GetInstanceScript();
        BoneSpikeGUID = 0;
    }

	InstanceScript* pInstance;
    uint64 BoneSpikeGUID;

    void SetPrisoner(Unit* uPrisoner)
    {
        BoneSpikeGUID = uPrisoner->GetGUID();
    }

    void Reset()
    {
        BoneSpikeGUID = 0;
    }

    void JustDied(Unit *killer)
    {
        if (killer->GetGUID() != me->GetGUID())

            if (BoneSpikeGUID)
            {
                Unit* Bone = Unit::GetUnit((*me), BoneSpikeGUID);
                if (Bone)
                    Bone->RemoveAurasDueToSpell(SPELL_SPIKE_IMPALING);
            }
    }

    void KilledUnit(Unit *pVictim)
    {
        if (pVictim->GetGUID() != me->GetGUID())

            if (BoneSpikeGUID)
            {
                Unit* Bone = Unit::GetUnit((*me), BoneSpikeGUID);
                if (Bone)
                    Bone->RemoveAurasDueToSpell(SPELL_SPIKE_IMPALING);
            }
    }

    void UpdateAI(const uint32 diff)
    {
        Unit* temp = Unit::GetUnit((*me),BoneSpikeGUID);
        if ((temp && temp->isAlive() && !temp->HasAura(SPELL_SPIKE_IMPALING)) || !temp)
		{
            me->DealDamage(me, me->GetHealth(), NULL, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, NULL, false);
		}
    }
};
};

class boss_lord_marrowgar : public CreatureScript
{
public:
    boss_lord_marrowgar() : CreatureScript("boss_lord_marrowgar") { }

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new boss_lord_marrowgarAI(pCreature);
    }
struct boss_lord_marrowgarAI : public BossAI
{
    boss_lord_marrowgarAI(Creature* pCreature) : BossAI(pCreature, DATA_MARROWGAR_EVENT), summons(me)
    {
        pInstance = me->GetInstanceScript();
    }

    InstanceScript* pInstance;

    uint32 m_uiSaberSlashTimer;
    uint32 m_uiBoneSpikeGraveyardTimer;
    uint32 m_uiBoneStormChanelTimer;
    uint32 m_uiBoneStormTimer;
    uint32 m_uiBoneStormRemoveTimer;
    uint32 m_uiColdFlameTimer;
    uint32 m_uiBerserkTimer;
    uint32 m_uiResetTimer;

    bool Intro;

	SummonList summons;

    void Reset()
    {
        m_uiSaberSlashTimer = 6000;
        m_uiBoneSpikeGraveyardTimer  = 15000;
        m_uiColdFlameTimer  = 15000;
        m_uiBoneStormChanelTimer = 45000;
        m_uiBoneStormTimer = 1500;
        m_uiBoneStormRemoveTimer = 20000;
        m_uiBerserkTimer = 600000;

		Intro = false;

        me->SetSpeed(MOVE_RUN, 2.5f, true);
        me->SetSpeed(MOVE_WALK, 1.8f, true);

        if (pInstance)
		    if(me->isAlive())
			{
                pInstance->SetData(DATA_MARROWGAR_EVENT, NOT_STARTED);
				pInstance->DoRemoveAurasDueToSpellOnPlayers(SPELL_SPIKE_IMPALING);
			}
    }

    void EnterCombat(Unit* who)
    {
        DoScriptText(SAY_AGGRO, me);

        if (pInstance)
            pInstance->SetData(DATA_MARROWGAR_EVENT, IN_PROGRESS);
    }

    void JustDied(Unit* pKiller)
    {
        DoScriptText(SAY_DEATH, me);

		summons.DespawnAll();

        if (pInstance)
		{
		    pInstance->DoRemoveAurasDueToSpellOnPlayers(SPELL_SPIKE_IMPALING);
            pInstance->SetData(DATA_MARROWGAR_EVENT, DONE);
		}
    }

    void JustReachedHome()
    {
        if(pInstance)
		{
		    pInstance->DoRemoveAurasDueToSpellOnPlayers(SPELL_SPIKE_IMPALING);
            pInstance->SetData(DATA_MARROWGAR_EVENT, FAIL);
		}
    }

    void KilledUnit(Unit *victim)
    {
        DoScriptText(SAY_KILL, me);
    }

    void MoveInLineOfSight(Unit *who)
    {
        if (!Intro && me->IsWithinDistInMap(who,60.0f))
        {
            DoScriptText(SAY_INTRO, me);
            Intro = true;
        }

        ScriptedAI::MoveInLineOfSight(who);
    }

	void BoneSpike()
	{
		DoScriptText(SAY_SPIKE, me);
		uint32 count = RAID_MODE(1,3,1,3);
		for (uint8 i = 1; i <= count; i++)
		{
			if(Unit* target = SelectUnit(SELECT_TARGET_RANDOM, 1))
			if (target && target->GetTypeId() == TYPEID_PLAYER && target->isAlive() && !target->HasAura(SPELL_SPIKE_IMPALING))
			{
				Creature* Bone = me->SummonCreature(CREATURE_BONE_SPIKE, target->GetPositionX(), target->GetPositionY(), target->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 999999);
				/*CAST_AI(npc_bone_spikeAI, Bone->AI())->SetPrisoner(target);*/
				Bone->CastSpell(target, SPELL_SPIKE_IMPALING, true);
			}
		}
	}

    void UpdateAI(const uint32 uiDiff)
    {
        if (!UpdateVictim())
            return;

        if (m_uiBerserkTimer <= uiDiff)
        {
            DoScriptText(SAY_BERSERK, me);
            DoCast(SPELL_BERSERK);
            m_uiBerserkTimer = 600000;
        } else m_uiBerserkTimer -= uiDiff;

        if (m_uiResetTimer <= uiDiff)
        {
            if (me->GetDistance2d(me->GetHomePosition().GetPositionX(), me->GetHomePosition().GetPositionY()) > 60)
                EnterEvadeMode();
            m_uiResetTimer = 5000;
        } else m_uiResetTimer -= uiDiff;

        if (Difficulty() == RAID_DIFFICULTY_10MAN_NORMAL || Difficulty() == RAID_DIFFICULTY_25MAN_NORMAL)
        {
            if (!me->HasAura(SPELL_STORM_CHANNEL))
            {
                if (m_uiBoneSpikeGraveyardTimer < uiDiff)
                {
					BoneSpike();
                    m_uiBoneSpikeGraveyardTimer = 15000;
                } else m_uiBoneSpikeGraveyardTimer -= uiDiff;

                if (m_uiColdFlameTimer <= uiDiff)
                {
                    me->SummonCreature(CREATURE_COLD_FLAME, me->GetPositionX()+20, me->GetPositionY()+20, me->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN, 8000);
                    me->SummonCreature(CREATURE_COLD_FLAME, me->GetPositionX()-20, me->GetPositionY()-20, me->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN, 8000);
                    me->SummonCreature(CREATURE_COLD_FLAME, me->GetPositionX()+20, me->GetPositionY()-20, me->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN, 8000);
                    me->SummonCreature(CREATURE_COLD_FLAME, me->GetPositionX()-20, me->GetPositionY()+20, me->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN, 8000);
                    m_uiColdFlameTimer = 15000;
                } else m_uiColdFlameTimer -= uiDiff;
            }
        }

        if (Difficulty() == RAID_DIFFICULTY_10MAN_HEROIC || Difficulty() == RAID_DIFFICULTY_25MAN_HEROIC)
        {
            if (m_uiBoneSpikeGraveyardTimer < uiDiff)
            {
				BoneSpike();
                m_uiBoneSpikeGraveyardTimer = 15000;
            } else m_uiBoneSpikeGraveyardTimer -= uiDiff;
        }

        if (!me->HasAura(SPELL_STORM_CHANNEL))
        {
            if (m_uiBoneStormChanelTimer <= uiDiff)
            {
                DoCast(SPELL_STORM_CHANNEL);
                DoScriptText(SAY_STORM, me);
                m_uiBoneStormChanelTimer = 45000;
            } else m_uiBoneStormChanelTimer -= uiDiff;

            if (m_uiSaberSlashTimer <= uiDiff)
            {
                DoCast(me->getVictim(), SPELL_SABER_SLASH);
                m_uiSaberSlashTimer = 6000;
            } else m_uiSaberSlashTimer -= uiDiff;
        }

        if (me->HasAura(SPELL_STORM_CHANNEL))
        {
            if (m_uiBoneStormTimer <= uiDiff)
            {
                DoCastAOE(SPELL_BONE_STORM);
                m_uiBoneStormTimer = 1500;
            } else m_uiBoneStormTimer -= uiDiff;

            if (m_uiBoneStormRemoveTimer <= uiDiff)
            {
                me->RemoveAurasDueToSpell(SPELL_STORM_CHANNEL);
                m_uiBoneStormRemoveTimer = 20000;
            } else m_uiBoneStormRemoveTimer -= uiDiff;
        }

        DoMeleeAttackIfReady();
    }
	};
};

class npc_cold_flame : public CreatureScript
{
public:
    npc_cold_flame() : CreatureScript("npc_cold_flame") { }

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new npc_cold_flameAI(pCreature);
    }
struct npc_cold_flameAI : public ScriptedAI
{
    npc_cold_flameAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        pInstance = pCreature->GetInstanceScript();
    }
    InstanceScript* pInstance;

    uint32 m_uiColdFlameTimer;

    void Reset()
    {
        float x, y, z;
        me->GetNearPoint(me, x, y, z, 1, 50, M_PI*2*rand_norm());
        me->GetMotionMaster()->MovePoint(0, x, y, z);
        me->SetVisibility(VISIBILITY_OFF);
        DoCast(me, SPELL_COLD_FLAME);
        me->SetReactState(REACT_PASSIVE);
		me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
        me->SetSpeed(MOVE_WALK, 1.5f, true);
		me->AddThreat(me, -50000.0f);

        m_uiColdFlameTimer = 1000;
    }
    void UpdateAI(const uint32 uiDiff)
    {
        if(m_uiColdFlameTimer <= uiDiff)
        {
            DoCast(me, SPELL_COLD_FLAME);
            m_uiColdFlameTimer = 1000;
        } else m_uiColdFlameTimer -= uiDiff;

    }
};
};

void AddSC_boss_marrowgar()
{
    new boss_lord_marrowgar;
    new npc_cold_flame;
    new npc_bone_spike;
}
