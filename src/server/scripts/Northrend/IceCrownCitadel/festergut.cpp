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

#define SAY_STINKY           -1666004
#define SAY_AGGRO            -1666005
#define SAY_GASEOUS          -1666006
#define SAY_GAS_SPORES       -1666007
#define SAY_PUNGENT_BLIGHT   RAND(-1666008,-1666009)
#define SAY_KILL             RAND(-1666010,-1666011)
#define SAY_BERSERK          -1666012
#define SAY_DEATH_1          -1666013
#define SAY_DEATH_2          -1666014

#define SPELL_PUNGENT_BLIGHT    69195 //тучка наносит урон
#define SPELL_GASTRIC_EXPLOSION RAID_MODE(72227,72228,72229,72230)
#define SPELL_INHALE_BLIGHT     69165 //поглощает тучку
#define SPELL_INHALE_BLIGHT_1   69166 //эфект поглощения бафф
#define SPELL_VILE_GAS          72272
#define SPELL_GASTRIC_BLOAT     72219
//#define SPELL_GAS_VISUAL_SMAL   69154 //графический эфект тучки
//#define SPELL_GAS_VISUAL_MIDDEL 69152 //графический эфект тучки
//#define SPELL_GAS_VISUAL_BIG    69126 //графический эфект тучки
#define SPELL_GAS_SPORES        69278
#define SPELL_SPORE_AURA        69290
#define SPELL_BERSERK           47008
#define SPELL_UNOCULATED        72103
#define SPELL_SUMMON_STALKER    72287
#define SPELL_GASEOUS_BLIGHT    69162
#define SPELL_INHALED_BLIGHT    69166

class boss_festergut : public CreatureScript
{
public:
    boss_festergut() : CreatureScript("boss_festergut") { }

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new boss_festergutAI(pCreature);
    }
struct boss_festergutAI : public BossAI
{
    boss_festergutAI(Creature* pCreature) : BossAI(pCreature, DATA_ROTFACE_EVENT)
    {
        pInstance = me->GetInstanceScript();
    }

    InstanceScript* pInstance;

    uint32 m_uiPungentBlightTimer;
    uint32 m_uiGastricExplosionTimer;
    uint32 m_uiInhaleBlightTimer;
    uint32 m_uiGasSporesTimer;
    uint32 m_uiVileGasTimer;
    uint32 m_uiGastricBloatTimer;
    uint32 m_uiBerserkTimer;
	uint32 m_uiResetTimer;
	uint32 m_uiGaseousTimer;
	uint32 m_uiUnoculatedTimer;

	uint8 stage;

	Unit* spored[6];

	bool add_stinky;

    void Reset()
    {
        m_uiPungentBlightTimer = 20000;
        m_uiInhaleBlightTimer  = 8000;
        m_uiVileGasTimer = 20000;
        m_uiGasSporesTimer = 20000;
        m_uiGastricBloatTimer = 12000;
        m_uiBerserkTimer = 300000;
		m_uiGaseousTimer = 1000;
		m_uiUnoculatedTimer = 20000;

		stage = 0;

		memset(&spored, 0, sizeof(spored));

		add_stinky = false;

        if (pInstance)
		{
		    if(me->isAlive())
			{
                pInstance->SetData(DATA_FESTERGURT_EVENT, NOT_STARTED);
		        pInstance->DoRemoveAurasDueToSpellOnPlayers(SPELL_GASTRIC_BLOAT);
		        pInstance->DoRemoveAurasDueToSpellOnPlayers(SPELL_VILE_GAS);
            }
        }
    }

    void EnterCombat(Unit* who)
    {
        DoScriptText(SAY_AGGRO, me);

		m_uiGaseousTimer = 22000;

		if(add_stinky == false)
        {
			Creature* stinky = Unit::GetCreature(*me, pInstance->GetData64(DATA_STINKY));

			if (stinky && stinky->isDead())
			{
			    DoScriptText(SAY_STINKY, me);
			    add_stinky = true;
            }
		}

        if (pInstance)
            pInstance->SetData(DATA_FESTERGURT_EVENT, IN_PROGRESS);
    }

    void JustDied(Unit* pKiller)
    {
		Creature* professor = Unit::GetCreature(*me, pInstance->GetData64(DATA_PROFESSOR_PUTRICIDE));

        DoScriptText(SAY_DEATH_1, me);
		DoScriptText(SAY_DEATH_2, professor);

        if (pInstance)
		{
		    pInstance->DoRemoveAurasDueToSpellOnPlayers(SPELL_GASTRIC_BLOAT);
		    pInstance->DoRemoveAurasDueToSpellOnPlayers(SPELL_VILE_GAS);
            pInstance->SetData(DATA_FESTERGURT_EVENT, DONE);
		}
    }

    void JustReachedHome()
    {
        if(pInstance)
		{
		    pInstance->DoRemoveAurasDueToSpellOnPlayers(SPELL_GASTRIC_BLOAT);
		    pInstance->DoRemoveAurasDueToSpellOnPlayers(SPELL_VILE_GAS);
            pInstance->SetData(DATA_FESTERGURT_EVENT, FAIL);
		}
    }

    void KilledUnit(Unit *victim)
    {
        DoScriptText(SAY_KILL, me);
    }

    void Unoculated()
    {
         for(uint8 i = 0; i < 6; ++i)
		 {
            if (spored[i])
			{
                if (!spored[i]->HasAura(SPELL_SPORE_AURA))
                {
                   DoCast(spored[i], SPELL_UNOCULATED);
				   spored[i] = NULL;
                }
			}
		}
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!UpdateVictim())
            return;

		if (m_uiGaseousTimer < uiDiff)
		{
			switch(stage)
			{
			case 0: 
				DoCast(me,SPELL_GASEOUS_BLIGHT);
				DoScriptText(SAY_GASEOUS, me);
				m_uiGaseousTimer = 15000;
				break;
			case 1:
				DoCast(me, SPELL_INHALE_BLIGHT);
				DoScriptText(SAY_PUNGENT_BLIGHT,me);
				m_uiInhaleBlightTimer = 22000;
				break;
			case 2:
				DoCast(me,SPELL_GASEOUS_BLIGHT);
				DoScriptText(SAY_GASEOUS, me);
				m_uiGaseousTimer = 13000;
				break;
			case 3:
				DoCast(me, SPELL_INHALE_BLIGHT);
				DoScriptText(SAY_PUNGENT_BLIGHT,me);
				m_uiInhaleBlightTimer = 25000;
				break;
			case 4:
				DoCast(me,SPELL_GASEOUS_BLIGHT);
				DoScriptText(SAY_GASEOUS, me);
				m_uiGaseousTimer = 12000;
				break;
			case 5:
				DoCast(me, SPELL_INHALE_BLIGHT);
				DoScriptText(SAY_PUNGENT_BLIGHT,me);
				m_uiInhaleBlightTimer = 20000;
				break;
			case 6:
				DoScriptText(SAY_PUNGENT_BLIGHT,me);
				DoCast(SPELL_PUNGENT_BLIGHT);
				m_uiInhaleBlightTimer = 20000;
				break;
			case 7:
				me->RemoveAurasDueToSpell(SPELL_INHALED_BLIGHT);
				stage = 0;
				break;
			}
			++stage;
		} else m_uiGaseousTimer -= uiDiff;

        if (m_uiGastricBloatTimer < uiDiff)
        {
            DoCast(me->getVictim(), SPELL_GASTRIC_BLOAT);
            m_uiGastricBloatTimer = 13000;
        } else m_uiGastricBloatTimer -= uiDiff;

		if(me->getVictim() && me->getVictim()->HasAura(SPELL_GASTRIC_BLOAT))
		{
		    Aura *GastricBloatAura = me->getVictim()->GetAura(SPELL_GASTRIC_BLOAT);
			if (GastricBloatAura && GastricBloatAura->GetStackAmount() > 9)
			{
				me->getVictim()->CastSpell(me->getVictim(), SPELL_GASTRIC_EXPLOSION,true);
				me->getVictim()->RemoveAurasDueToSpell(SPELL_GASTRIC_BLOAT);
			}
		}

        if (m_uiResetTimer <= uiDiff)
        {
            if (me->GetDistance2d(me->GetHomePosition().GetPositionX(), me->GetHomePosition().GetPositionY()) > 40)
                EnterEvadeMode();
            m_uiResetTimer = 5000;
        } else m_uiResetTimer -= uiDiff;

        if(m_uiUnoculatedTimer < uiDiff)
        {
		    Unoculated();
            m_uiUnoculatedTimer = 20000;
        } else m_uiUnoculatedTimer -= uiDiff;

        if (m_uiVileGasTimer < uiDiff)
        {
            if(Unit* target = SelectUnit(SELECT_TARGET_RANDOM, 1))
			{
			    DoCast(target,SPELL_SUMMON_STALKER);
                DoCast(target, SPELL_VILE_GAS);
			}
            m_uiVileGasTimer = 20000;
        } else m_uiVileGasTimer -= uiDiff;

        if (m_uiGasSporesTimer < uiDiff)
        {
            if(Unit* target = SelectUnit(SELECT_TARGET_RANDOM, 1))
            DoCast(target, SPELL_GAS_SPORES);
			DoScriptText(SAY_GAS_SPORES, me);
            m_uiGasSporesTimer = 20000;
        } else m_uiGasSporesTimer -= uiDiff;

        if(m_uiBerserkTimer < uiDiff)
        {
		    DoScriptText(SAY_BERSERK, me);
            DoCast(me, SPELL_BERSERK);
            m_uiBerserkTimer = 300000;
        }
        DoMeleeAttackIfReady();
    }
	};
};

class npc_vile_gas_stalker : public CreatureScript
{
public:
    npc_vile_gas_stalker() : CreatureScript("npc_vile_gas_stalker") { }

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new npc_vile_gas_stalkerAI(pCreature);
    }
struct npc_vile_gas_stalkerAI : public ScriptedAI
{
	npc_vile_gas_stalkerAI(Creature* pCreature) : ScriptedAI(pCreature)
	{
		pInstance = pCreature->GetInstanceScript();
	}

    InstanceScript* pInstance;

    uint32 m_uiDespawnTimer;

    void Reset()
    {
        me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
        me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
        me->SetInCombatWithZone();
        DoStartNoMovement(me->getVictim());
        me->SetDisplayId(11686);

        m_uiDespawnTimer = 13000;
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (m_uiDespawnTimer <= uiDiff)
		{
            me->ForcedDespawn();
			m_uiDespawnTimer = 13000;
		} else m_uiDespawnTimer -= uiDiff;
    }
};
};

class npc_orange_gas_stalker : public CreatureScript
{
public:
    npc_orange_gas_stalker() : CreatureScript("npc_orange_gas_stalker") { }

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new npc_orange_gas_stalkerAI(pCreature);
    }
struct npc_orange_gas_stalkerAI : public ScriptedAI
{
	npc_orange_gas_stalkerAI(Creature* pCreature) : ScriptedAI(pCreature)
	{
		pInstance = pCreature->GetInstanceScript();
	}

    InstanceScript* pInstance;

    void Reset()
    {
        me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
        me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
        me->SetInCombatWithZone();
        DoStartNoMovement(me->getVictim());
        me->SetDisplayId(11686);
		DoCast(SPELL_PUNGENT_BLIGHT);
    }

    void UpdateAI(const uint32 uiDiff)
    {
    }
};
};

void AddSC_boss_festergut()
{
    new boss_festergut;
    new npc_vile_gas_stalker;
    new npc_orange_gas_stalker;
}