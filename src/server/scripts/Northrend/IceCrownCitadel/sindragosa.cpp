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

/*
*Need correct spell ID
*Need correct timers
*Need add  Sindragossa fly in fly phase
*/

#include "ScriptPCH.h"
#include "icecrown_citadel.h"

#define SAY_AGGRO           -1666071
#define SAY_UNCHAIND_MAGIC  -1666072
#define SAY_BLISTERING_COLD -1666073
#define SAY_BREATH          -1666074
#define SAY_AIR_PHASE       -1666075
#define SAY_PHASE_3         -1666076
#define SAY_KILL            RAND(-1666077,-1666078)
#define SAY_BERSERK         -1666079
#define SAY_DEATH           -1666080

#define SPELL_FROST_AURA         RAID_MODE(70084,71050)
#define SPELL_CLEAVE             19983
#define SPELL_TAIL_SMASH         71077
#define SPELL_FROST_BREATH       RAID_MODE(73061,73062,73063,73064)
#define SPELL_PERMEATING_CHILL   70107
#define SPELL_UNCHAINED_MAGIC    69762
#define SPELL_ICY_GRIP           70117
#define SPELL_ICY_TRIP_PULL      70122
#define SPELL_BOMB_VISUAL_1      64624
#define SPELL_BOMB_VISUAL_2      69016
#define SPELL_BLISTERING_COLD    RAID_MODE(70123,71047)
#define SPELL_FROST_BOMB_TRIGGER 69846
#define SPELL_FROST_BEACON       70126
#define SPELL_ICE_TOMB           70157
#define SPELL_ICE_TOMB_TRIGGER   69675
#define SPELL_FROST_BOMB         RAID_MODE(69845,71053,71054,71055)
#define SPELL_MYSTIC_BUFFED      70128
#define SPELL_BERSERK            47008
#define SPELL_MYSTIC_BUFFET      70128
#define SPELL_ASPHYXATION        71665
#define SPELL_FROST_AURA         71387
#define SPELL_FROST_BREATH_ADD   71386
#define SPELL_ICE_BLAST          71376
#define SPELL_BELLOWING_ROAR     36922
#define SPELL_CLEAVE             40505
#define SPELL_TAIL_SWEEP         71369

#define CREATURE_ICE_TOMB   36980
#define CREATURE_FROST_BOMB 37186

#define MARKED_TARGET 5

const Position SpawnLoc[]=
{
    {4523.889f, 2486.907f, 280.249f, 3.155f}, //fly pos
    {4407.439f, 2484.905f, 203.374f, 3.166f}, //land pos
    {4671.521f, 2481.815f, 343.365f, 3.166f}, //spawn pos
};

class boss_sindragosa : public CreatureScript
{
public:
    boss_sindragosa() : CreatureScript("boss_sindragosa") { }

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new boss_sindragosaAI(pCreature);
    }
struct boss_sindragosaAI : public BossAI
{
    boss_sindragosaAI(Creature* pCreature) : BossAI(pCreature, DATA_SINDRAGOSA_EVENT)
    {
        pInstance = me->GetInstanceScript();
    }

    InstanceScript* pInstance;

    uint8 m_uiPhase;

    uint32 m_uiBreathTimer;
    uint32 m_uiCleaveTimer;
    uint32 m_uiTailSmashTimer;
    uint32 m_uiBlisteringColdTimer;
    uint32 m_uiBerserkTimer;
    uint32 m_uiMarkTimer;
    uint32 m_uiIceBoltTriggerTimer;
    uint32 m_uiFlyTimer;
	uint32 m_uiMysticTimer;
	uint32 m_uiResetTimer;
	uint32 m_uiPermatingChilTimer;
	uint32 m_uiChangePhaseTimer;
	uint32 m_uiUnchainedMagicTimer;
	uint32 m_uiBombTimer;

	Unit* marked[MARKED_TARGET];

	bool Switch;

    void Reset()
    {
        m_uiPhase = 0;

        m_uiBreathTimer = 15000;
        m_uiTailSmashTimer = 10000;
        m_uiBlisteringColdTimer = 30000;
        m_uiMarkTimer = 20000;
		m_uiPermatingChilTimer = 12000;
		m_uiMysticTimer = 6000;
		m_uiBerserkTimer = 600000;
		m_uiChangePhaseTimer = 170000;
		m_uiUnchainedMagicTimer = 12000;
		m_uiBombTimer = 9000;

        me->SetSpeed(MOVE_WALK, 1.5f, true);
        me->SetSpeed(MOVE_RUN, 1.5f, true);
        me->SetSpeed(MOVE_FLIGHT, 2.5f, true);

		Switch = false;

		memset(&marked, 0, sizeof(marked));

		pInstance->DoRemoveAurasDueToSpellOnPlayers(SPELL_PERMEATING_CHILL);
		pInstance->DoRemoveAurasDueToSpellOnPlayers(SPELL_UNCHAINED_MAGIC);
    }

    void EnterCombat(Unit* who)
    {
        DoCast(me, SPELL_FROST_AURA);
		DoScriptText(SAY_AGGRO, me);

		m_uiPhase = 1;
    }

    void JustDied(Unit* pKiller)
    {
        DoScriptText(SAY_DEATH, me);

	    pInstance->DoRemoveAurasDueToSpellOnPlayers(SPELL_PERMEATING_CHILL);
		pInstance->DoRemoveAurasDueToSpellOnPlayers(SPELL_UNCHAINED_MAGIC);

        if (pInstance)
            pInstance->SetData(DATA_SINDRAGOSA_EVENT, DONE);
    }

    void KilledUnit(Unit *victim)
    {
        DoScriptText(SAY_KILL, me);

	    pInstance->DoRemoveAurasDueToSpellOnPlayers(SPELL_PERMEATING_CHILL);
		pInstance->DoRemoveAurasDueToSpellOnPlayers(SPELL_UNCHAINED_MAGIC);
	}

    void JustReachedHome()
    {
	    pInstance->DoRemoveAurasDueToSpellOnPlayers(SPELL_PERMEATING_CHILL);
		pInstance->DoRemoveAurasDueToSpellOnPlayers(SPELL_UNCHAINED_MAGIC);

        if(pInstance)
            pInstance->SetData(DATA_SINDRAGOSA_EVENT, FAIL);
    }

    void BlisteringCold()
    {
		Map::PlayerList const &PlList = me->GetMap()->GetPlayers();

		if (PlList.isEmpty())
			return;

		for (Map::PlayerList::const_iterator i = PlList.begin(); i != PlList.end(); ++i)
		{
			if (Player* pPlayer = i->getSource())
			if (pPlayer && pPlayer->isAlive() && pPlayer->IsWithinDistInMap(me, 25.0f))
			{
                DoCast(pPlayer, SPELL_ICY_TRIP_PULL);
                DoCast(pPlayer, SPELL_BLISTERING_COLD);
		        DoScriptText(SAY_BLISTERING_COLD, me);
		    }
		}
    }

	void MarkedPlayer()
	{
	    memset(&marked, 0, sizeof(marked));

	    uint8 count = RAID_MODE(2,5,2,5);
	    for (uint8 i = 0; i < count; i++)
		{
	        if(marked[i] = SelectUnit(SELECT_TARGET_RANDOM,1))
            if (marked[i] && !marked[i]->HasAura(SPELL_FROST_BEACON))
            {
                DoCast(marked[i], SPELL_FROST_BEACON);
            }
        }
	}

	void Tomb()
	{
	    uint8 count = RAID_MODE(2,5,2,5);
		for (uint8 i = 0; i < count; i++)
		{
		    if (marked[i] && marked[i]->isAlive())
			{
			    DoCast(marked[i], SPELL_ICE_TOMB);
				DoCast(marked[i], SPELL_ASPHYXATION);
				marked[i]->RemoveAurasDueToSpell(SPELL_FROST_BEACON);
                float x, y, z;
                marked[i]->GetPosition(x, y, z);
                if (Unit* tomb = DoSummon(CREATURE_ICE_TOMB, marked[i]))
                    tomb->AddThreat(marked[i], 5000.0f);
			}
		}
	}

    void UpdateAI(const uint32 uiDiff)
    {
        if (!UpdateVictim())
            return;

        if (m_uiResetTimer <= uiDiff)
        {
            if (me->GetDistance2d(me->GetHomePosition().GetPositionX(), me->GetHomePosition().GetPositionY()) > 250) //????
                EnterEvadeMode();
            m_uiResetTimer = 5000;
        } else m_uiResetTimer -= uiDiff;

        if (m_uiBerserkTimer <= uiDiff)
        {
			DoScriptText(SAY_BERSERK, me);
			DoCast(me, SPELL_BERSERK);
            m_uiBerserkTimer = 600000;
        } else m_uiBerserkTimer -= uiDiff;

        if(m_uiPhase == 1)
        {
		    if(m_uiUnchainedMagicTimer <= uiDiff)
			{
			    uint32 count = urand(1,3);
			    for (uint8 i = 1; i <= count; i++)
			    {
			        if(Unit* target = SelectUnit(SELECT_TARGET_RANDOM,1))
        		    if(target && target->getPowerType() == POWER_MANA && !target->HasAura(SPELL_UNCHAINED_MAGIC))
				    {
					    DoScriptText(SAY_UNCHAIND_MAGIC, me);
                        DoCast(target, SPELL_UNCHAINED_MAGIC);
				    }
			    }
			} else m_uiUnchainedMagicTimer -= uiDiff;

            if (m_uiPermatingChilTimer <= uiDiff)
            {
				if(Unit* target = SelectUnit(SELECT_TARGET_RANDOM,1))
		        if(target && !target->HasAura(SPELL_PERMEATING_CHILL))
		        {
	                if (target && target->GetDistance2d(me->GetPositionX(), me->GetPositionY()) < 5)
		            {
                        DoCast(target, SPELL_PERMEATING_CHILL);
                    }
		        }
				m_uiPermatingChilTimer = 12000;
            } else m_uiPermatingChilTimer -= uiDiff;

            if (m_uiBreathTimer <= uiDiff)
            {
				DoScriptText(SAY_BREATH, me);
                DoCast(SPELL_FROST_BREATH);
                m_uiBreathTimer = 15000;
            } else m_uiBreathTimer -= uiDiff;

            if (m_uiCleaveTimer <= uiDiff)
            {
                DoCast(me, SPELL_CLEAVE);
                m_uiCleaveTimer = 10000;
            } else m_uiCleaveTimer -= uiDiff;

            if (m_uiTailSmashTimer <= uiDiff)
            {
				DoCast(me, SPELL_TAIL_SMASH);
                m_uiTailSmashTimer = 8000;
            } else m_uiTailSmashTimer -= uiDiff;

            if (m_uiBlisteringColdTimer <= uiDiff)
            {
                BlisteringCold();
                m_uiBlisteringColdTimer = 30000;
            } else m_uiBlisteringColdTimer -= uiDiff;
        }

        if(m_uiPhase == 2)
        {
            if (m_uiMarkTimer < uiDiff)
            {
			    MarkedPlayer();
                m_uiMarkTimer = 15000;
                m_uiIceBoltTriggerTimer = 7000;
            } else m_uiMarkTimer -= uiDiff;

            if (m_uiIceBoltTriggerTimer < uiDiff)
            {
			    Tomb();
                m_uiIceBoltTriggerTimer = 31000;
            } else m_uiIceBoltTriggerTimer -= uiDiff;

            if (m_uiBombTimer <= uiDiff)
            {
			    if(Unit* target = SelectUnit(SELECT_TARGET_RANDOM,1))
				{
                    DoCast(target, SPELL_FROST_BOMB);
				    DoCast(target, SPELL_FROST_BOMB_TRIGGER);
				}
                m_uiBombTimer = 10000;
            } else m_uiBombTimer -= uiDiff;
        }

        if(m_uiPhase == 3)
        {
            if (m_uiMarkTimer < uiDiff)
            {
			    MarkedPlayer();
                m_uiMarkTimer = 15000;
                m_uiIceBoltTriggerTimer = 7000;
            } else m_uiMarkTimer -= uiDiff;

            if (m_uiBreathTimer <= uiDiff)
            {
				DoScriptText(SAY_BREATH, me);
                DoCast(SPELL_FROST_BREATH);
                m_uiBreathTimer = 15000;
            } else m_uiBreathTimer -= uiDiff;

            if (m_uiMysticTimer <= uiDiff)
            {
                Map::PlayerList const &PlList = me->GetMap()->GetPlayers();

                for (Map::PlayerList::const_iterator i = PlList.begin(); i != PlList.end(); ++i)
                {
                    if (Player* pPlayer = i->getSource())
                    {
						if (pPlayer && pPlayer->GetDistance2d(me->GetPositionX(), me->GetPositionY()) <= 8)
						{
                            DoCast(pPlayer, SPELL_MYSTIC_BUFFED);
						}
                    }
                }
               m_uiMysticTimer = 6000;
            } else m_uiMysticTimer -= uiDiff;

            if (m_uiIceBoltTriggerTimer < uiDiff)
            {
			    Tomb();
                m_uiIceBoltTriggerTimer = 31000;
            } else m_uiIceBoltTriggerTimer -= uiDiff;
        }

		if((me->GetHealth()*100) / me->GetMaxHealth() < 35 && Switch == false)
		{
			DoScriptText(SAY_PHASE_3, me);
			m_uiPhase = 3;
			Switch = true;
		}

        if (m_uiChangePhaseTimer < uiDiff)
        {
		    if(Switch != true)
			{
			    if(m_uiPhase == 1)
			    {
				    DoScriptText(SAY_AIR_PHASE, me);
				    m_uiPhase = 2;
			    }
			    if(m_uiPhase == 2)
			    {
				    m_uiPhase = 1;
			    }
			}
            m_uiChangePhaseTimer = 170000;
        } else m_uiChangePhaseTimer -= uiDiff;

        DoMeleeAttackIfReady();
    }
	};
};

class npc_ice_tomb : public CreatureScript
{
public:
    npc_ice_tomb() : CreatureScript("npc_ice_tomb") { }

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new npc_ice_tombAI(pCreature);
    }
struct npc_ice_tombAI: public ScriptedAI
{
	npc_ice_tombAI(Creature* pCreature) : ScriptedAI(pCreature)
	{
	    pInstance = pCreature->GetInstanceScript();
		IceTombGUID = 0;
	}

    InstanceScript* pInstance;
	uint64 IceTombGUID;

    void SetPrisoner(Unit* uPrisoner)
    {
        IceTombGUID = uPrisoner->GetGUID();
    }

    void Reset()
    {
	    SetCombatMovement(false);
        IceTombGUID = 0;
    }

    void JustDied(Unit *killer)
    {
        if (killer->GetGUID() != me->GetGUID())

            if (IceTombGUID)
            {
                Unit* IceTomb = Unit::GetUnit((*me), IceTombGUID);
                if (IceTomb)
                    IceTomb->RemoveAurasDueToSpell(SPELL_ICE_TOMB);
            }
    }

    void KilledUnit(Unit *pVictim)
    {
        if (pVictim->GetGUID() != me->GetGUID())

            if (IceTombGUID)
            {
                Unit* IceTomb = Unit::GetUnit((*me), IceTombGUID);
                if (IceTomb)
                    IceTomb->RemoveAurasDueToSpell(SPELL_ICE_TOMB);
            }
    }

    void UpdateAI(const uint32 uiDiff)
    {
    }
};
};

class npc_frost_bomb : public CreatureScript
{
public:
    npc_frost_bomb() : CreatureScript("npc_frost_bomb") { }

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new npc_frost_bombAI(pCreature);
    }
struct npc_frost_bombAI: public ScriptedAI
{
	npc_frost_bombAI(Creature* pCreature) : ScriptedAI(pCreature)
	{
	    pInstance = pCreature->GetInstanceScript();
	}

    InstanceScript* pInstance;

    uint32 m_uiBoomTimer;
    uint32 m_uiVisualTimer;

    bool end;

    void Reset()
    {
	    DoStartNoMovement(me->getVictim());

        m_uiVisualTimer = 6000;
        m_uiBoomTimer = 9000;

        end = false;

        me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
        me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
    }

	void EnterCombat(Unit* who)
	{
	}

    void UpdateAI(const uint32 uiDiff)
    {
        if (end == true)
        {
            DoCast(me, SPELL_FROST_BOMB);
            me->ForcedDespawn();
			end = false;
        }

        if (m_uiVisualTimer <= uiDiff)
        {
            DoCast(me, SPELL_BOMB_VISUAL_1);
            m_uiVisualTimer = 99999;
        } else m_uiVisualTimer -= uiDiff;

        if (m_uiBoomTimer <= uiDiff)
        {
            DoCast(me, SPELL_BOMB_VISUAL_2);
            end = true;
        } else m_uiBoomTimer -= uiDiff;
    }
};
};

class npc_rimefang : public CreatureScript
{
public:
    npc_rimefang() : CreatureScript("npc_rimefang") { }

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new npc_rimefangAI(pCreature);
    }
struct npc_rimefangAI: public ScriptedAI
{
	npc_rimefangAI(Creature* pCreature) : ScriptedAI(pCreature)
	{
	    pInstance = pCreature->GetInstanceScript();
	}

    InstanceScript* pInstance;

	uint32 m_uiFrostBreathTimer;
	uint32 m_uiIceBlastTimer;

    void Reset()
    {
	    m_uiFrostBreathTimer = 5000;
		m_uiIceBlastTimer = 7000;

        if(pInstance)
        if(pInstance->GetData(DATA_SINDRAGOSA_EVENT) != DONE)
           pInstance->SetData(DATA_SINDRAGOSA_EVENT, NOT_STARTED);
    }

	void EnterCombat(Unit* who)
	{
		if(pInstance)
		{
			if(pInstance->GetData(DATA_SINDRAGOSA_EVENT) != DONE)
				pInstance->SetData(DATA_SINDRAGOSA_EVENT, IN_PROGRESS);

			Creature* dragon = Unit::GetCreature(*me, pInstance->GetData64(DATA_SPINESTALKER));
			if (dragon)
			{
				if(dragon->isDead())
				{
					dragon->Respawn();
				}
				else
				{
					DoCast(SPELL_FROST_AURA);
					dragon->SetInCombatWithZone();
				}
			}
		}
	}

	void JustDied(Unit *killer)
	{
		if(pInstance)
		{
			if(pInstance->GetData(DATA_SINDRAGOSA_EVENT) != DONE)
			{
				Creature* dragon = Unit::GetCreature(*me, pInstance->GetData64(DATA_SPINESTALKER));
				if (dragon)
					if(dragon->isDead())
					{
						Creature* DragonBoss = me->SummonCreature(CREATURE_SINDRAGOSA, SpawnLoc[2], TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT,30000);
						if(DragonBoss)
						{
							DragonBoss->GetMotionMaster()->MovePoint(0, SpawnLoc[1]);
						}
					}
			}
		}
	}

    void UpdateAI(const uint32 uiDiff)
    {
        if (pInstance && pInstance->GetData(DATA_SINDRAGOSA_EVENT) == FAIL)
        {
            me->ForcedDespawn();
        }

        if (m_uiFrostBreathTimer <= uiDiff)
        {
            DoCast(me->getVictim(), SPELL_FROST_BREATH_ADD);
            m_uiFrostBreathTimer = 6000;
        } else m_uiFrostBreathTimer -= uiDiff;

        if (m_uiIceBlastTimer <= uiDiff)
        {
            DoCast(me, SPELL_ICE_BLAST);
            m_uiIceBlastTimer = 8000;
        } else m_uiIceBlastTimer -= uiDiff;

        DoMeleeAttackIfReady();
    }
};
};

class npc_spinestalker : public CreatureScript
{
public:
    npc_spinestalker() : CreatureScript("npc_spinestalker") { }

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new npc_spinestalkerAI(pCreature);
    }
struct npc_spinestalkerAI: public ScriptedAI
{
	npc_spinestalkerAI(Creature* pCreature) : ScriptedAI(pCreature)
	{
	    pInstance = pCreature->GetInstanceScript();
	}

    InstanceScript* pInstance;

	uint32 m_uiRoarTimer;
	uint32 m_uiCleaveTimer;
	uint32 m_uiSweepTimer;

    void Reset()
    {
	    m_uiRoarTimer = 14000;
		m_uiCleaveTimer = 6000;
		m_uiSweepTimer = 7000;

        if(pInstance)
        if (pInstance->GetData(DATA_SINDRAGOSA_EVENT) != DONE)
            pInstance->SetData(DATA_SINDRAGOSA_EVENT, NOT_STARTED);
    }

	void EnterCombat(Unit* who)
	{
		if(pInstance)
			if(pInstance->GetData(DATA_SINDRAGOSA_EVENT) != DONE)
				pInstance->SetData(DATA_SINDRAGOSA_EVENT, IN_PROGRESS);

		Creature* dragon = me->GetCreature(*me, pInstance->GetData64(CREATURE_RIMEFANG));
		if (dragon)
		{
			if(dragon->isDead())
			{
				dragon->Respawn();
			}
			else
			{
				dragon->SetInCombatWithZone();
			}
		}
	}

	void JustDied(Unit *killer)
	{
		if(pInstance)
		{
			if(pInstance->GetData(DATA_SINDRAGOSA_EVENT) != DONE)
			{
				Creature* dragon = Unit::GetCreature(*me, pInstance->GetData64(DATA_RIMEFANG));
				if (dragon)
					if(dragon->isDead())
					{
						Creature* DragonBoss = me->SummonCreature(CREATURE_SINDRAGOSA, SpawnLoc[2], TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT,30000);
						if(DragonBoss)
						{
							DragonBoss->GetMotionMaster()->MovePoint(0, SpawnLoc[1]);
						}
					}
			}
		}
	}

    void UpdateAI(const uint32 uiDiff)
    {
        if (pInstance->GetData(DATA_SINDRAGOSA_EVENT) == FAIL)
        {
            me->ForcedDespawn();
        }

        if (m_uiRoarTimer <= uiDiff)
        {
            DoCastAOE(SPELL_BELLOWING_ROAR);
            m_uiRoarTimer = 15000;
        } else m_uiRoarTimer -= uiDiff;

        if (m_uiCleaveTimer <= uiDiff)
        {
            DoCast(me->getVictim(), SPELL_CLEAVE);
            m_uiCleaveTimer = 5000;
        } else m_uiCleaveTimer -= uiDiff;

        if (m_uiSweepTimer <= uiDiff)
        {
            DoCast(SPELL_TAIL_SWEEP);
            m_uiSweepTimer = 7000;
        } else m_uiSweepTimer -= uiDiff;

        DoMeleeAttackIfReady();
    }
};
};

void AddSC_boss_sindragosa()
{
    new boss_sindragosa;
    new npc_spinestalker;
    new npc_rimefang;
    new npc_ice_tomb;
    new npc_frost_bomb;
}