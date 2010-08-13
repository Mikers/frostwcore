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

//Need change rune of blood system
//Correct spell id and timers
//Need implantet energy

#include "ScriptPCH.h"
#include "icecrown_citadel.h"

#define SAY_AGGRO          -1665973
#define SAY_FALLENCHAMPION -1665974
#define SAY_BLOODBEASTS    -1665975
#define SAY_KILL          RAND(-1665976,-1665977)
#define SAY_BERSERK        -1665978
#define SAY_DEATH          -1665979
#define SAY_INTRO_1_A      -1665960
#define SAY_INTRO_2_A      -1665961
#define SAY_INTRO_3_A      -1665962
#define SAY_INTRO_4_A      -1665963
#define SAY_INTRO_1_H      -1665964
#define SAY_INTRO_2_H      -1665965
#define SAY_INTRO_3_H      -1665966
#define SAY_INTRO_4_H      -1665967
#define SAY_INTRO_5_H      -1665968
#define SAY_INTRO_6_H      -1665969
#define SAY_INTRO_7_H      -1665970
#define SAY_INTRO_8_H      -1665972

#define SPELL_BLOOD_LINK           72178
#define SPELL_BLOOD_POWER          72371
#define SPELL_SUMMON_BLOOD_BEAST_1 72172
#define SPELL_SUMMON_BLOOD_BEAST_2 72173
#define SPELL_SUMMON_BLOOD_BEAST_3 72356
#define SPELL_SUMMON_BLOOD_BEAST_4 72357
#define SPELL_SUMMON_BLOOD_BEAST_5 72358
#define SPELL_FRENZY               72737
#define SPELL_TASTE_OF_BLOOD       69634
#define SPELL_CLEAVE               15284
#define SPELL_RENDING_THROW        70309
#define SPELL_FALLEN_CHAMPION      72293
#define SPELL_FALLEN_CHAMPION_AURA 72260
#define SPELL_BOILING_BLOOD        RAID_MODE(72385,72441,72443,72443)
#define SPELL_BLOOD_NOVA           RAID_MODE(72378,73058,72378,73058)
#define SPELL_RUNE_OF_BLOOD        RAID_MODE(72409,72447,72448,72449)
#define SPELL_RUNE_OF_BLOOD_AURA   72408
#define SPELL_BLOOD_LINK_BEAST     72176
#define SPELL_RESISTAN_SKIN        72723
#define SPELL_SCENT_OF_BLOOD       72769
#define SPELL_BERSERK              26662
#define SPELL_AGONY                70572
#define SPELL_ZERO_POWER           72242
#define SPELL_POWER                72195

#define ACHIEV_MESS RAID_MODE(4537,4613)

class boss_saurfang : public CreatureScript
{
public:
    boss_saurfang() : CreatureScript("boss_saurfang") { }

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new boss_saurfangAI(pCreature);
    }
struct boss_saurfangAI : public BossAI
{
    boss_saurfangAI(Creature* pCreature) : BossAI(pCreature, DATA_SAURFANG_EVENT), summons(me),vehicle(pCreature->GetVehicleKit())
    {
        pInstance = me->GetInstanceScript();
		assert(vehicle);
    }

    InstanceScript* pInstance;

	Vehicle* vehicle;

    uint32 m_uiBoilingBloodTimer;
    uint32 m_uiBloodNovaTimer;
    uint32 m_uiRuneOfBloodTimer;
    uint32 m_uiSummonBloodBeastTimer;
    uint32 m_uiBerserkTimer;
	uint32 m_uiResetTimer;
	uint8 MessCount;
	uint8 AchievementCount;

	SummonList summons;

    void Reset()
    {
        m_uiBoilingBloodTimer = 25000;
        m_uiBloodNovaTimer = 30000;
        m_uiRuneOfBloodTimer = 20000;
        m_uiSummonBloodBeastTimer = 40000;
        m_uiBerserkTimer = 480000;
		MessCount = 0;
		AchievementCount = RAID_MODE(3,5,3,5);

        assert(vehicle);
        me->GetVehicleKit();

		if(summons.empty())
            return;

		summons.DespawnAll();

        if (pInstance)
		    if(me->isAlive())
                pInstance->SetData(DATA_SAURFANG_EVENT, NOT_STARTED);
				pInstance->DoRemoveAurasDueToSpellOnPlayers(SPELL_FALLEN_CHAMPION);

        me->SetPower(me->getPowerType(), 0);
		me->AddAura(SPELL_ZERO_POWER, me);
        me->RemoveAurasDueToSpell(SPELL_BLOOD_LINK);
		me->RemoveAurasDueToSpell(SPELL_BLOOD_POWER);
    }

    void EnterCombat(Unit* pWho)
    {
        DoScriptText(SAY_AGGRO, me);

        DoCast(me, SPELL_BLOOD_LINK);
        DoCast(me, SPELL_BLOOD_POWER);

        if (pInstance)
            pInstance->SetData(DATA_SAURFANG_EVENT, IN_PROGRESS);
    }

	void DealDamage(Unit* pVictim)
	{
		if(pVictim && pVictim->HasAura(SPELL_RUNE_OF_BLOOD_AURA))
		{
			DoCast(me,SPELL_RUNE_OF_BLOOD);
		}
	}

    void JustDied(Unit* pKiller)
    {
        if (pInstance)
		{
            pInstance->SetData(DATA_SAURFANG_EVENT, DONE);
			pInstance->DoRemoveAurasDueToSpellOnPlayers(SPELL_FALLEN_CHAMPION);
		}

			summons.DespawnAll();

			if(MessCount < AchievementCount)
			   pInstance->DoCompleteAchievement(ACHIEV_MESS);

        DoScriptText(SAY_DEATH, me);
    }

    void JustReachedHome()
    {
	    summons.DespawnAll();

		pInstance->DoRemoveAurasDueToSpellOnPlayers(SPELL_FALLEN_CHAMPION);

        if (pInstance)
		{
		    pInstance->DoRemoveAurasDueToSpellOnPlayers(SPELL_FALLEN_CHAMPION);
            pInstance->SetData(DATA_SAURFANG_EVENT, FAIL);
		}
    }

    void KilledUnit(Unit* pVictim)
    {
        DoScriptText(SAY_KILL, me);

        if (pVictim && pVictim->HasAura(72293))
        {
            DoCast(me, SPELL_FALLEN_CHAMPION_AURA);
        }
    }

	void JustSummoned(Creature* summons)
	{
		float x,y,z;
		if(Unit* target = SelectUnit(SELECT_TARGET_FARTHEST, 0))
		{
			target->GetPosition(x,y,z);
			summons->AddThreat(target, 50000.0f);
			summons->GetMotionMaster()->MovePoint(0,x,y,z);
		}
	}

    void UpdateAI(const uint32 uiDiff)
    {
        if(!UpdateVictim())
            return;

        if (m_uiResetTimer <= uiDiff)
        {
            if (me->GetDistance2d(me->GetHomePosition().GetPositionX(), me->GetHomePosition().GetPositionY()) > 50)
                EnterEvadeMode();
            m_uiResetTimer = 5000;
        } else m_uiResetTimer -= uiDiff;

        if (m_uiBoilingBloodTimer < uiDiff)
        {
            if (Unit* target = SelectUnit(SELECT_TARGET_RANDOM, 1))
                DoCast(target, SPELL_BOILING_BLOOD);
            m_uiBoilingBloodTimer = 25000;
        } else m_uiBoilingBloodTimer -= uiDiff;

        if (m_uiBloodNovaTimer < uiDiff)
        {
            uint32 count = RAID_MODE(1,3,1,3);
            for (uint8 i = 1; i <= count; i++)
            {
                if(Unit* target = SelectUnit(SELECT_TARGET_RANDOM, 1))
                DoCast(target, SPELL_BLOOD_NOVA);
                m_uiBloodNovaTimer = 30000;
            }
        } else m_uiBloodNovaTimer -= uiDiff;

        if (m_uiSummonBloodBeastTimer <= uiDiff)
        {
            DoCast(me, SPELL_SUMMON_BLOOD_BEAST_1);
            DoCast(me, SPELL_SUMMON_BLOOD_BEAST_2);
            if (getDifficulty() == RAID_DIFFICULTY_25MAN_NORMAL || getDifficulty() == RAID_DIFFICULTY_25MAN_HEROIC)
            {
                DoCast(me, SPELL_SUMMON_BLOOD_BEAST_3);
                DoCast(me, SPELL_SUMMON_BLOOD_BEAST_4);
                DoCast(me, SPELL_SUMMON_BLOOD_BEAST_5);
            }
            DoScriptText(SAY_BLOODBEASTS, me);
            m_uiSummonBloodBeastTimer = 40000;
        } else m_uiSummonBloodBeastTimer -= uiDiff;

        if (me->GetPower(POWER_ENERGY) == 100)
        {
            if(Unit* target = SelectUnit(SELECT_TARGET_RANDOM, 1))
            DoCast(target, SPELL_FALLEN_CHAMPION);
            DoScriptText(SAY_FALLENCHAMPION, me);
			++MessCount;
            me->SetPower(me->getPowerType(), 0);
        }

        if (m_uiRuneOfBloodTimer < uiDiff)
        {
            DoCast(me->getVictim(), SPELL_RUNE_OF_BLOOD_AURA);
            m_uiRuneOfBloodTimer = 20000;
        } else m_uiRuneOfBloodTimer -= uiDiff;

        if(me->GetHealth()*100 / me->GetMaxHealth() < 30)
        {
            if (!me->HasAura(SPELL_FRENZY))
            {
                DoCast(me, SPELL_FRENZY);
            }
        }

        if (m_uiBerserkTimer < uiDiff)
        {
            DoCast(SPELL_BERSERK);
			DoScriptText(SAY_BERSERK, me);
            m_uiBerserkTimer = 480000;
        } else m_uiBerserkTimer -= uiDiff;

        DoMeleeAttackIfReady();
    }
	};
};

class npc_bloodbeast : public CreatureScript
{
public:
    npc_bloodbeast() : CreatureScript("npc_bloodbeast") { }

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new npc_bloodbeastAI(pCreature);
    }
struct npc_bloodbeastAI : public ScriptedAI
{
    npc_bloodbeastAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        pInstance = pCreature->GetInstanceScript();
    }

    InstanceScript* pInstance;

    bool ScentOfBlood;

    uint32 m_uiScentOfBloodTimer;

    void Reset()
    {
        DoCast(me, SPELL_BLOOD_LINK_BEAST);
        DoCast(me, SPELL_RESISTAN_SKIN);

        ScentOfBlood = false;

        m_uiScentOfBloodTimer = 5000;
    }

    void EnterCombat(Unit* pWho)
    {
    }

    void KilledUnit(Unit* pVictim)
    {
		Creature* Saurfang = me->GetCreature(*me, pInstance->GetData64(DATA_SAURFANG));
        if (Saurfang && Saurfang->isAlive())
        {
            Saurfang->ModifyHealth(Saurfang->GetMaxHealth() * 0.05);
        }
    }

	void DealDamage(Unit* pVictim)
	{
		Creature* Saurfang = me->GetCreature(*me, pInstance->GetData64(DATA_SAURFANG));
        if (Saurfang && Saurfang->isAlive())
        {
            Saurfang->CastSpell(Saurfang,SPELL_POWER,true);
        }
	}

    void UpdateAI(const uint32 uiDiff)
    {
        if(!UpdateVictim())
            return;

		if(!me->HasAura(SPELL_BLOOD_LINK_BEAST))
            DoCast(me, SPELL_BLOOD_LINK_BEAST);

		if(!me->HasAura(SPELL_RESISTAN_SKIN))
            DoCast(me, SPELL_RESISTAN_SKIN);

     if (getDifficulty() == RAID_DIFFICULTY_10MAN_HEROIC || getDifficulty() == RAID_DIFFICULTY_25MAN_HEROIC)
     {
        if (m_uiScentOfBloodTimer < uiDiff)
        {
            if (!ScentOfBlood && (me->GetHealth()*100) / me->GetMaxHealth() < 20)
            {
                if (urand(0,1))
                DoCast(me, SPELL_SCENT_OF_BLOOD);
                ScentOfBlood = true;
                m_uiScentOfBloodTimer = 5000;
            }
        } else m_uiScentOfBloodTimer -= uiDiff;
	 }
     DoMeleeAttackIfReady();
    }
};
};

void AddSC_boss_saurfang()
{
    new boss_saurfang;
    new npc_bloodbeast;
}