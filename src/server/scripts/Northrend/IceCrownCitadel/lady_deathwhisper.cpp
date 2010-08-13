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

#define EMOTE_MANA_BARRIER "Lady Deathwhisper's Mana Barrier shimmers and fades away!" //emote when lady have 100 000 mp(mana point)

#define SPELL_DEATH_AND_DECAY   RAID_MODE(71001,72108,71001,72110)
#define	SPELL_DOMINATE_MIND     71289
#define	SPELL_SHADOW_BOLT       RAID_MODE(71254,72008,72503,72504)
#define	SPELL_MANA_BARRIER      70842
#define	SPELL_EMPOWEREMENT      70901
#define	SPELL_TRANSFORMATION    70900
#define	SPELL_FROST_BOLT        RAID_MODE(71420,72007,72501,72502)
#define	SPELL_FROST_BOLT_VALLEY RAID_MODE(72905,72906,72907,72908)
#define	SPELL_SUMMON_SHADE      71363
#define	SPELL_INSIGNIFICANCE    71204
#define	SPELL_BERSERK           47008
#define	SPELL_BLAST             71494
#define	SPELL_BLAST_DAMAGE      71544
#define	SPELL_PORT_VISUAL       41236
//#define SPELL_ANIMATED_DEAD   ????? // not in DBC! Need sniffs

#define	CREATURE_ADHERENT 37949
#define	CREATURE_FANATIC  37890
#define	CREATURE_SHADE    38222
#define CREATURE_RANDOM   RAND(37949,37890) //random NPC

#define	SAY_INTRO_1        -1665902
#define	SAY_INTRO_2        -1665903
#define	SAY_INTRO_3        -1665904
#define	SAY_INTRO_4        -1665905
#define	SAY_INTRO_5        -1665906
#define	SAY_INTRO_6        -1665907
#define	SAY_INTRO_7        -1665908
#define	SAY_AGGRO          -1665909
#define	SAY_PHASE_2        -1665910
#define	SAY_EMPOWERMENT    -1665911
#define	SAY_ANIMATE_DEAD   -1665913
#define	SAY_KILL           RAND(-1665917,-1665918)
#define	SAY_BERSERK        -1665915
#define	SAY_DEATH          -1665916

const Position SpawnLoc[]=
{
    {-619.006f, 2158.104f, 50.848f},
    {-598.697f, 2157.767f, 50.848f},
    {-577.992f, 2156.989f, 50.848f},
    {-618.748f, 2266.648f, 50.849f},
	{-598.573f, 2266.870f, 50.849f},
	{-578.360f, 2267.210f, 50.849f},
	{-555.643f, 2211.281f, 49.476f},
	{-623.055f, 2211.326f, 51.764f},
};

Unit* pSummoned= NULL;

class boss_lady_deathwisper : public CreatureScript
{
public:
    boss_lady_deathwisper() : CreatureScript("boss_lady_deathwisper") { }

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new boss_lady_deathwisperAI(pCreature);
    }
struct boss_lady_deathwisperAI : public BossAI
{
	boss_lady_deathwisperAI(Creature* pCreature) : BossAI(pCreature, DATA_DEATHWHISPER_EVENT)
	{
		me->ApplySpellImmune(0, IMMUNITY_EFFECT, SPELL_EFFECT_INTERRUPT_CAST, true); // interrupt frost bold
		me->ApplySpellImmune(0, IMMUNITY_EFFECT, SPELL_EFFECT_KNOCK_BACK, true);

		pInstance = me->GetInstanceScript();
	}

	InstanceScript* pInstance;

	uint32 m_uiPhase;
	uint32 m_uiDominateMindTimer;
	uint32 m_uiSummonWaveTimer;
	uint32 m_uiDeathandDecayTimer;
	uint32 m_uiFrostBoltTimer;
	uint32 m_uiFrostValleyTimer;
	uint32 m_uiShadowBoltTimer;
	uint32 m_uiBerserkTimer;
	uint32 m_uiInsignificanceTimer;
	uint32 m_uiShadeTimer;
	uint32 m_uiDarkEmpoweredTimer;
	uint32 m_uiResetTimer;

	uint32 uiIntroTimer;
    uint8 uiIntroPhase;

    bool Intro;
	bool barrier;
	bool combat;

	void Reset()
	{
	    m_uiPhase = 1;
		uiIntroPhase = 0;
		uiIntroTimer = 1000;

		m_uiSummonWaveTimer = 50000;
		m_uiDeathandDecayTimer = 10000;
		m_uiFrostBoltTimer = 10000;
		m_uiFrostValleyTimer = 13000;
		m_uiShadowBoltTimer = 7000;
		m_uiBerserkTimer = 600000;
		m_uiInsignificanceTimer = 10000;
		m_uiShadeTimer = 10000;
		m_uiDominateMindTimer = 27000;
		m_uiDarkEmpoweredTimer = 20000;

		Intro = false;
		barrier = false;
		combat = false;

		if (pInstance)
		    if(me->isAlive()) //cuz reset work and for died creature
			    pInstance->SetData(DATA_DEATHWHISPER_EVENT, NOT_STARTED);
	}

	void EnterCombat(Unit* who)
	{
		DoScriptText(SAY_AGGRO, me);

		combat = true;

		if (pInstance)
			pInstance->SetData(DATA_DEATHWHISPER_EVENT, IN_PROGRESS);
	}

	void JustDied(Unit* killer)
	{
		DoScriptText(SAY_DEATH, me);

		if (pInstance)
			pInstance->SetData(DATA_DEATHWHISPER_EVENT, DONE);
	}

	void JustReachedHome()
	{
	    Reset();

		if(pInstance)
			pInstance->SetData(DATA_DEATHWHISPER_EVENT, FAIL);
	}

	void KilledUnit(Unit *victim)
	{
		DoScriptText(SAY_KILL, me);
	}

    void MoveInLineOfSight(Unit *who)
    {
        if (!Intro && me->IsWithinDistInMap(who,90.0f)) // intro
        {
            DoScriptText(SAY_INTRO_1, me);
            uiIntroPhase = 1;
            uiIntroTimer = 11000;
			Intro = true;
        }
        ScriptedAI::MoveInLineOfSight(who);
    }

	void JustSummoned(Creature* summoned)
	{
		DoCast(summoned, SPELL_PORT_VISUAL);

        summoned->AddThreat(me->getVictim(), 5000.0f);
		summoned->GetMotionMaster()->MovePoint(1, SpawnLoc[7]); //move to Lady
		me->SetSpeed(MOVE_RUN, 1.5);
	}

	void RandomSpawn() //random spawn
	{
		switch(rand()%2)
		{
		    case 0:
				pSummoned = DoSummon(CREATURE_FANATIC,SpawnLoc[0]);
				pSummoned = DoSummon(CREATURE_ADHERENT,SpawnLoc[1]);
				pSummoned = DoSummon(CREATURE_FANATIC,SpawnLoc[2]);
		        break;
		    case 1:
				pSummoned = DoSummon(CREATURE_ADHERENT,SpawnLoc[3]);
				pSummoned = DoSummon(CREATURE_FANATIC,SpawnLoc[4]);
				pSummoned = DoSummon(CREATURE_ADHERENT,SpawnLoc[5]);
                break;
        }
	}

	void UpdateAI(const uint32 uiDiff)
	{
		if (uiIntroTimer <= uiDiff && Intro == true) //intro
		{
			switch (uiIntroPhase)
			{
			case 1:
				DoScriptText(SAY_INTRO_2, me);
				++uiIntroPhase;
				uiIntroTimer = 10000;
				break;
			case 2:
				DoScriptText(SAY_INTRO_3, me);
				++uiIntroPhase;
				uiIntroTimer = 7000;
				break;
			case 3:
				DoScriptText(SAY_INTRO_4, me);
				++uiIntroPhase;
				uiIntroTimer = 12000;
				break;
			case 4:
				DoScriptText(SAY_INTRO_5, me);
				++uiIntroPhase;
				uiIntroTimer = 7000;
				break;
			case 5:
				DoScriptText(SAY_INTRO_6, me);
				++uiIntroPhase;
				uiIntroTimer = 11000;
				break;
			case 6:
				DoScriptText(SAY_INTRO_7, me);
				++uiIntroPhase;
				uiIntroTimer = 20000;
				break;
			}
		} else uiIntroTimer -= uiDiff;

		if(combat == true)
		{
			if (m_uiResetTimer <= uiDiff)
			{
				if (me->GetDistance2d(me->GetHomePosition().GetPositionX(), me->GetHomePosition().GetPositionY()) > 100)
					EnterEvadeMode();
				m_uiResetTimer = 5000;
			} else m_uiResetTimer -= uiDiff; //reset

			if (m_uiBerserkTimer < uiDiff)
			{
				DoCast(me, SPELL_BERSERK);
				DoScriptText(SAY_BERSERK, me);
				m_uiBerserkTimer = 600000;
			} else m_uiBerserkTimer -= uiDiff;

			if (m_uiDeathandDecayTimer < uiDiff)
			{
				if(Unit* target = SelectUnit(SELECT_TARGET_RANDOM, 1))
					if(target && target->GetTypeId() == TYPEID_PLAYER && target->isAlive() && !target->HasAura(71289))
						DoCast(target, SPELL_DEATH_AND_DECAY);
				m_uiDeathandDecayTimer = 11000;
			} else m_uiDeathandDecayTimer -= uiDiff;

			if (m_uiDarkEmpoweredTimer < uiDiff)
			{
				if (Creature* adherent = me->FindNearestCreature(CREATURE_ADHERENT, 7.0f))
					DoCast(adherent, SPELL_EMPOWEREMENT);
				DoScriptText(SAY_EMPOWERMENT, me);
				m_uiDarkEmpoweredTimer = 30000;
			} else m_uiDarkEmpoweredTimer -= uiDiff;

			if (m_uiDominateMindTimer < uiDiff)
			{
				uint32 count = RAID_MODE(0,1,1,3);
				for (uint8 i = 1; i <= count; i++)
				{
					if(Unit* target = SelectUnit(SELECT_TARGET_RANDOM, 1))
						if(target && target->GetTypeId() == TYPEID_PLAYER && target->isAlive() && !target->HasAura(71289))
						{
							DoCast(target, SPELL_DOMINATE_MIND);
						}
				}
				m_uiDominateMindTimer = 15000;
			} else m_uiDominateMindTimer -= uiDiff;

			if (m_uiPhase == 1)
			{
				DoStartNoMovement(me->getVictim());

				if (!me->HasAura(SPELL_MANA_BARRIER) && barrier == false) // add mana barrier
				{
					DoCast(me, SPELL_MANA_BARRIER);
					barrier = true;
				}

				if (me->GetPower(POWER_MANA) < 100000)
				{
					me->MonsterTextEmote(EMOTE_MANA_BARRIER,NULL);
				}

				if (m_uiShadowBoltTimer < uiDiff)
				{
					if(Unit* target = SelectUnit(SELECT_TARGET_RANDOM, 1))
						if(target && target->GetTypeId() == TYPEID_PLAYER && target->isAlive() && !target->HasAura(71289))
							DoCast(target, SPELL_SHADOW_BOLT);
					m_uiShadowBoltTimer = 7000;
				} else m_uiShadowBoltTimer -= uiDiff;

				if (m_uiSummonWaveTimer < uiDiff) //spawn
				{
					if (getDifficulty() == RAID_DIFFICULTY_10MAN_NORMAL || getDifficulty() == RAID_DIFFICULTY_10MAN_HEROIC)
					{
						RandomSpawn();
					}
					if (getDifficulty() == RAID_DIFFICULTY_25MAN_NORMAL || getDifficulty() == RAID_DIFFICULTY_25MAN_HEROIC)
					{
						pSummoned = DoSummon(CREATURE_FANATIC,SpawnLoc[0]);
						pSummoned = DoSummon(CREATURE_ADHERENT,SpawnLoc[1]);
						pSummoned = DoSummon(CREATURE_FANATIC,SpawnLoc[2]);
						pSummoned = DoSummon(CREATURE_ADHERENT,SpawnLoc[3]);
						pSummoned = DoSummon(CREATURE_FANATIC,SpawnLoc[4]);
						pSummoned = DoSummon(CREATURE_ADHERENT,SpawnLoc[5]);
						pSummoned = DoSummon(CREATURE_RANDOM, SpawnLoc[6]);
					}
					m_uiSummonWaveTimer = 60000;
				} else m_uiSummonWaveTimer -= uiDiff;

				if (!me->HasAura(SPELL_MANA_BARRIER) && barrier == true)
				{
					DoStartMovement(me->getVictim());
					DoScriptText(SAY_PHASE_2, me);
					DoResetThreat();
					m_uiPhase = 2; // phase switch
				}
			}

			if (m_uiPhase == 2)
			{
				if (m_uiFrostBoltTimer < uiDiff)
				{
					me->ApplySpellImmune(0, IMMUNITY_EFFECT, SPELL_EFFECT_INTERRUPT_CAST, false);
					DoCast(me->getVictim(), SPELL_FROST_BOLT);
					m_uiFrostBoltTimer = 10000;
				} else m_uiFrostBoltTimer -= uiDiff;

				if (m_uiFrostValleyTimer < uiDiff)
				{
					me->ApplySpellImmune(0, IMMUNITY_EFFECT, SPELL_EFFECT_INTERRUPT_CAST, true);
					DoCastAOE(SPELL_FROST_BOLT_VALLEY);
					m_uiFrostValleyTimer = 13000;
				} else m_uiFrostValleyTimer -= uiDiff;

				if (m_uiInsignificanceTimer < uiDiff)
				{
					DoCast(me->getVictim(), SPELL_INSIGNIFICANCE);
					m_uiInsignificanceTimer = 10000;
				} else m_uiInsignificanceTimer -= uiDiff;

				if (m_uiSummonWaveTimer < uiDiff)
				{
					if (Difficulty() == RAID_DIFFICULTY_10MAN_HEROIC)
					{
						pSummoned = DoSummon(CREATURE_RANDOM, SpawnLoc[6]);
					}
					if (Difficulty() == RAID_DIFFICULTY_25MAN_HEROIC)
					{
						RandomSpawn();
					}
					m_uiSummonWaveTimer = 60000;
				} else m_uiSummonWaveTimer -= uiDiff;

				if (getDifficulty() != RAID_DIFFICULTY_10MAN_NORMAL)
				{
					if (m_uiShadeTimer < uiDiff)
					{
						if(Unit* target = SelectUnit(SELECT_TARGET_RANDOM, 1))
							if(target && target->GetTypeId() == TYPEID_PLAYER && target->isAlive() && !target->HasAura(71289))
							{
								DoCast(target, SPELL_SUMMON_SHADE);
								m_uiShadeTimer = 15000;
							}
					} else m_uiShadeTimer -= uiDiff;
				}
			}
		}
	}
	};
};

class npc_shade : public CreatureScript
{
public:
    npc_shade() : CreatureScript("npc_shade") { }

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new npc_shadeAI(pCreature);
    }
struct npc_shadeAI : public ScriptedAI
{
	npc_shadeAI(Creature* pCreature) : ScriptedAI(pCreature)
	{
		pInstance = pCreature->GetInstanceScript();
	}

	InstanceScript* pInstance;

	uint32 m_uiBlastTimer;

	void Reset()
	{
	    m_uiBlastTimer = 500;

		me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
		me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
		me->SetInCombatWithZone();
		DoCast(me, SPELL_BLAST);

		if(Unit* target = SelectUnit(SELECT_TARGET_RANDOM,1))
		{
            me->AddThreat(target, 1000.0f);
            me->GetMotionMaster()->MoveChase(target);
            me->SetSpeed(MOVE_RUN, 0.5);
		}
	}

	void EnterCombat(Unit* who)
	{
	}

	void KilledUnit(Unit *victim)
	{
	}

	void UpdateAI(const uint32 uiDiff)
	{
		if (!UpdateVictim())
			return;

			if (m_uiBlastTimer < uiDiff)
			{
			    if (me->IsWithinDist(me->getVictim(), 3.0f, false))
				{
				    DoCast(SPELL_BLAST_DAMAGE);
				    me->ForcedDespawn();
				    m_uiBlastTimer = 500;
				}
			} else m_uiBlastTimer -= uiDiff;

		DoMeleeAttackIfReady();
	}
};
};

void AddSC_boss_deahtwisper()
{
	new boss_lady_deathwisper;
	new npc_shade;
}
