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

#define SAY_AGGRO       -1666026
#define SAY_AIRLOCK     -1666027
#define SAY_PHASE_HC    -1666028
#define SAY_TRANSFORM_1 -1666029
#define SAY_TRANSFORM_2 -1666030
#define SAY_KILL        RAND(-1666031,-1666032)
#define SAY_BERSERK     -1666033
#define SAY_DEATH       -1666034

#define SPELL_UNSTABLE_EXPERIMENT   71968 //70351
#define SPELL_TEAR_GAS              71615
#define SPELL_CREATE_CONCOTION      71621
#define SPELL_GUZZLE_POTIONS        71893
#define SPELL_MALLEABLE_GOO         RAID_MODE(72296,70852,70852,70852) //72295
#define SPELL_MUTATED_STRENGTH      71603
#define SPELL_MUTATED_PLAGUE        72672
#define SPELL_OOZE_ERUPTION         RAID_MODE(70492,72624,72505,72625)
#define SPELL_VOLATILE_OOZE         72838
#define SPELL_CHOKING_GAS           71278
#define SPELL_SLIME_PUDDLE          70342
#define SPELL_SLIME_PUDDLE_AURA     70346
#define SPELL_CHOKING_GAS_EXPLOSION 71279
#define	SPELL_CHOKING_GAS_BOMB      71273
#define SPELL_CHOKING_GAS_AURA      71278
#define SPELL_SUMMON_OOZE           71413
#define SPELL_GASEOUS_BLOAT         70215
#define SPELL_GASEOUS_BLOAT_AURA    72833
#define SPELL_MUTATED               70405
#define SPELL_STRENGTH              71603
#define SPELL_ORANGE_RADIATION      45857
#define SPELL_BERSERK               26662

#define EMOTE_UNSTABLE_EXPERIMENT "Professor Putricide begins unstable experiment!"

class boss_professor_putricide : public CreatureScript
{
public:
    boss_professor_putricide() : CreatureScript("boss_professor_putricide") { }

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new boss_professor_putricideAI(pCreature);
    }
struct boss_professor_putricideAI : public BossAI
{
    boss_professor_putricideAI(Creature* pCreature) : BossAI(pCreature, DATA_PROFESSOR_PUTRICIDE_EVENT)
    {
        pInstance = me->GetInstanceScript();
    }

    InstanceScript* pInstance;

    uint32 m_uiPhase;
    uint32 m_uiUnstableExperimentTimer;
	uint32 m_uiResetTimer;
	uint32 m_uiPuddleTimer;
	uint32 m_uiMalleableTimer;
	uint32 m_uiPhaseSwitchTimer;
	uint32 m_uiBerserkTimer;
	uint32 m_uiBombTimer;

	uint8 experement;
	uint8 phaseswitch;

	bool PhaseSwitch1;
	bool PhaseSwitch2;

    void Reset()
    {
        m_uiPhase = 1;
        m_uiUnstableExperimentTimer = 35000;
		m_uiPuddleTimer = 15000;
		m_uiMalleableTimer = 15000;
		m_uiPhaseSwitchTimer = 1000;
		m_uiBerserkTimer = 600000;
		m_uiBombTimer = 20000;

		experement = 1;
		phaseswitch = 0;

	    PhaseSwitch1 = false;
	    PhaseSwitch2 = false;

        if (pInstance)
		    if(me->isAlive())
                pInstance->SetData(DATA_PROFESSOR_PUTRICIDE_EVENT, NOT_STARTED);
    }

    void EnterCombat(Unit* who)
    {
        DoScriptText(SAY_AGGRO, me);

        if (pInstance)
            pInstance->SetData(DATA_PROFESSOR_PUTRICIDE_EVENT, IN_PROGRESS);
    }

    void JustDied(Unit* pKiller)
    {
        DoScriptText(SAY_DEATH, me);

        if (pInstance)
            pInstance->SetData(DATA_PROFESSOR_PUTRICIDE_EVENT, DONE);
    }

    void KilledUnit(Unit *victim)
    {
        DoScriptText(SAY_KILL, me);
    }

    void JustReachedHome()
    {
        if(pInstance)
            pInstance->SetData(DATA_PROFESSOR_PUTRICIDE_EVENT, FAIL);
    }

    void JustSummoned(Creature* pSummoned)
    {
        if(Unit* target = SelectUnit(SELECT_TARGET_RANDOM,1))
        pSummoned->AI()->AttackStart(target);
    }

	void Adds()
	{
		switch(experement)
		{
		case 1:
			me->SummonCreature(37697, 4386.684, 3211.339, 389.340, 0, TEMPSUMMON_DEAD_DESPAWN, 10000);
			experement = 2;
			break;
		case 2:
			me->SummonCreature(37562, 4326.529, 3213.906, 389.340, 0, TEMPSUMMON_DEAD_DESPAWN, 10000);
			experement = 1;
			break;
		}
	}

	void TwoAdds()
	{
		me->SummonCreature(37697, 4386.684, 3211.339, 389.340, 0, TEMPSUMMON_DEAD_DESPAWN, 10000);
		me->SummonCreature(37562, 4326.529, 3213.906, 389.340, 0, TEMPSUMMON_DEAD_DESPAWN, 10000);
	}

	void PhaseSwitch()
	{
		Map::PlayerList const &PlList = me->GetMap()->GetPlayers();

		for (Map::PlayerList::const_iterator i = PlList.begin(); i != PlList.end(); ++i)
		{
			if (Player* pPlayer = i->getSource())
			{
				DoCast(pPlayer, SPELL_TEAR_GAS);
			}
		}

		Creature* gas = me->FindNearestCreature(37562,100,true);
			if(gas)
			{
				DoCast(gas,SPELL_TEAR_GAS);
			}

		Creature* ooze = me->FindNearestCreature(37697,100,true);
			if(ooze)
			{
				DoCast(ooze,SPELL_TEAR_GAS);
			}
	}

    void UpdateAI(const uint32 uiDiff)
    {
        if (!UpdateVictim())
            return;

        if (m_uiResetTimer <= uiDiff)
        {
            if (me->GetDistance2d(me->GetHomePosition().GetPositionX(), me->GetHomePosition().GetPositionY()) > 90)
                EnterEvadeMode();
            m_uiResetTimer = 5000;
        } else m_uiResetTimer -= uiDiff;

			if (m_uiBerserkTimer < uiDiff)
			{
				DoScriptText(SAY_BERSERK,me);
				DoCast(me, SPELL_BERSERK);
				m_uiBerserkTimer = 600000;
			} else m_uiBerserkTimer -= uiDiff;

		if(m_uiPhaseSwitchTimer <= uiDiff)
		{
			if((me->GetHealth()*100) / me->GetMaxHealth() < 81 && PhaseSwitch1 == false)
			{
				switch(phaseswitch)
				{
				case 0:
					if (getDifficulty() == RAID_DIFFICULTY_10MAN_NORMAL ||
						getDifficulty() == RAID_DIFFICULTY_25MAN_NORMAL)
					{
						PhaseSwitch();
					}
					if (getDifficulty() == RAID_DIFFICULTY_10MAN_HEROIC ||
						getDifficulty() == RAID_DIFFICULTY_25MAN_HEROIC)
					{
						DoScriptText(SAY_PHASE_HC,me);
						TwoAdds();
					}
					++phaseswitch;
					m_uiPhaseSwitchTimer = 4000;
					break;
				case 1:
					me->GetMotionMaster()->MovePoint(0,4356.779785, 3263.510010, 389.398010);
					++phaseswitch;
					m_uiPhaseSwitchTimer = 7000;
					break;
				case 2:
					DoCast(SPELL_CREATE_CONCOTION);
					m_uiPhaseSwitchTimer = 3000;
					++phaseswitch;
					break;
				case 3:
					PhaseSwitch1 = true;
					pInstance->DoRemoveAurasDueToSpellOnPlayers(SPELL_TEAR_GAS);
					++phaseswitch;
					m_uiPhase = 2;
					break;
				}
			}
		} else m_uiPhaseSwitchTimer -= uiDiff;

		if(m_uiPhaseSwitchTimer <= uiDiff)
		{
			if((me->GetHealth()*100) / me->GetMaxHealth() < 36 && PhaseSwitch2 == false)
			{
				switch(phaseswitch)
				{
				case 0:
					if (getDifficulty() == RAID_DIFFICULTY_10MAN_NORMAL ||
						getDifficulty() == RAID_DIFFICULTY_25MAN_NORMAL)
					{
						PhaseSwitch();
					}
					if (getDifficulty() == RAID_DIFFICULTY_10MAN_HEROIC ||
						getDifficulty() == RAID_DIFFICULTY_25MAN_HEROIC)
					{
						DoScriptText(SAY_PHASE_HC,me);
						TwoAdds();
					}
					++phaseswitch;
					m_uiPhaseSwitchTimer = 4000;
					break;
				case 1:
					me->GetMotionMaster()->MovePoint(0,4356.779785, 3263.510010, 389.398010);
					++phaseswitch;
					m_uiPhaseSwitchTimer = 7000;
					break;
				case 2:
					DoCast(SPELL_GUZZLE_POTIONS);
					m_uiPhaseSwitchTimer = 3000;
					++phaseswitch;
					break;
				case 3:
					PhaseSwitch2 = true;
					pInstance->DoRemoveAurasDueToSpellOnPlayers(SPELL_TEAR_GAS);
					m_uiPhase = 3;
					++phaseswitch;
					break;
				}
			}
		} else m_uiPhaseSwitchTimer -= uiDiff;

		if (m_uiPhase == 1)
		{
			if (m_uiUnstableExperimentTimer < uiDiff)
			{
				DoCast(me, SPELL_UNSTABLE_EXPERIMENT);
				me->MonsterTextEmote(EMOTE_UNSTABLE_EXPERIMENT,NULL);
				Adds();
				m_uiUnstableExperimentTimer = 40000;
			} else m_uiUnstableExperimentTimer -= uiDiff;

			if (m_uiPuddleTimer < uiDiff)
			{
				uint32 count = RAID_MODE(1,2,1,2);
				for (uint8 i = 1; i <= count; i++)
				{
					if(Unit* target = SelectUnit(SELECT_TARGET_RANDOM,1))
					{
						if(target &&  target->GetTypeId() == TYPEID_PLAYER)
						{
						    DoCast(target,SPELL_SLIME_PUDDLE);
						}
					}
				}
				m_uiPuddleTimer = 17000;
			} else m_uiPuddleTimer -= uiDiff;
		}

        if (m_uiPhase == 2)
        {
			if (m_uiUnstableExperimentTimer < uiDiff)
			{
				DoCast(me, SPELL_UNSTABLE_EXPERIMENT);
				me->MonsterTextEmote(EMOTE_UNSTABLE_EXPERIMENT,NULL);
				TwoAdds();
				m_uiUnstableExperimentTimer = 40000;
			} else m_uiUnstableExperimentTimer -= uiDiff;

			if (m_uiPuddleTimer < uiDiff)
			{
				uint32 count = RAID_MODE(1,2,1,2);
				for (uint8 i = 1; i <= count; i++)
				{
					if(Unit* target = SelectUnit(SELECT_TARGET_RANDOM,1))
					{
						if(target &&  target->GetTypeId() == TYPEID_PLAYER)
						{
						    DoCast(target,SPELL_SLIME_PUDDLE);
						}
					}
				}
				m_uiPuddleTimer = 17000;
			} else m_uiPuddleTimer -= uiDiff;

			if (m_uiMalleableTimer < uiDiff)
			{
				if(Unit* target = SelectUnit(SELECT_TARGET_FARTHEST,1))
				{
					if(target &&  target->GetTypeId() == TYPEID_PLAYER)
					{
				        DoCast(target,SPELL_MALLEABLE_GOO);
					}
				}
				m_uiMalleableTimer = 16000;
			} else m_uiMalleableTimer -= uiDiff;

			if (m_uiBombTimer < uiDiff)
			{
				DoCast(SPELL_CHOKING_GAS_BOMB);
				m_uiBombTimer = 21000;
			} else m_uiBombTimer -= uiDiff;
        }
        if (m_uiPhase == 3)
        {
			Creature* abomination = Unit::GetCreature(*me, pInstance->GetData64(DATA_ABOMINATION));
			if(abomination)
				abomination->ForcedDespawn();

			if(!me->HasAura(SPELL_STRENGTH))
			{
				DoCast(me,SPELL_STRENGTH);
			}

			if (m_uiPuddleTimer < uiDiff)
			{
				uint32 count = RAID_MODE(1,2,1,2);
				for (uint8 i = 1; i <= count; i++)
				{
					if(Unit* target = SelectUnit(SELECT_TARGET_RANDOM,1))
					{
						if(target &&  target->GetTypeId() == TYPEID_PLAYER)
						{
						    DoCast(target,SPELL_SLIME_PUDDLE);
						}
					}
				}
				m_uiPuddleTimer = 17000;
			} else m_uiPuddleTimer -= uiDiff;

			if (m_uiMalleableTimer < uiDiff)
			{
				if(Unit* target = SelectUnit(SELECT_TARGET_FARTHEST,1))
				{
					if(target &&  target->GetTypeId() == TYPEID_PLAYER)
					{
				        DoCast(target,SPELL_MALLEABLE_GOO);
					}
				}
				m_uiMalleableTimer = 16000;
			} else m_uiMalleableTimer -= uiDiff;

			if (m_uiBombTimer < uiDiff)
			{
				DoCast(SPELL_CHOKING_GAS_BOMB);
				m_uiBombTimer = 21000;
			} else m_uiBombTimer -= uiDiff;
        }
        DoMeleeAttackIfReady();
    }
	};
};

class npc_volatile_ooze : public CreatureScript
{
public:
    npc_volatile_ooze() : CreatureScript("npc_volatile_ooze") { }

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new npc_volatile_oozeAI(pCreature);
    }
struct npc_volatile_oozeAI : public ScriptedAI
{
	npc_volatile_oozeAI(Creature* pCreature) : ScriptedAI(pCreature)
	{
		pInstance = pCreature->GetInstanceScript();
	}

	InstanceScript* pInstance;

    void Reset()
    {
		me->SetSpeed(MOVE_RUN, 0.5);
		me->SetSpeed(MOVE_WALK, 0.5);
		me->AddUnitMovementFlag(MOVEMENTFLAG_WALKING);
		Volatile();
    }

	void Volatile()
	{
		if(Unit* target = SelectUnit(SELECT_TARGET_RANDOM,1))
		{
			DoCast(target, SPELL_VOLATILE_OOZE);
		}
	}

    void EnterCombat(Unit *who)
    {
    }

	void UpdateAI(const uint32 diff)
    {
		if(me->getVictim()->HasAura(SPELL_VOLATILE_OOZE))
		{
			me->AddThreat(me->getVictim(), 1000000.0f);
			me->GetMotionMaster()->MoveChase(me->getVictim());
		}

		if (me->getVictim() && me->getVictim()->IsWithinDistInMap(me, 1))
		{
			DoCast(me, SPELL_OOZE_ERUPTION);
			me->getVictim()->RemoveAurasDueToSpell(SPELL_VOLATILE_OOZE);
			Volatile();
		}
    }
};
};

class npc_gas_cloud_icc : public CreatureScript
{
public:
    npc_gas_cloud_icc() : CreatureScript("npc_gas_cloud_icc") { }

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new npc_gas_cloud_iccAI(pCreature);
    }
struct npc_gas_cloud_iccAI : public ScriptedAI
{
	npc_gas_cloud_iccAI(Creature* pCreature) : ScriptedAI(pCreature)
	{
		pInstance = pCreature->GetInstanceScript();
	}

	InstanceScript* pInstance;

	uint32 m_uiBloatTimer;

	void Gas()
	{
		if(Unit* target = SelectUnit(SELECT_TARGET_RANDOM,1))
		{
			DoCast(target, SPELL_GASEOUS_BLOAT);
		}
	}

    void Reset()
    {
		Gas();
		me->SetSpeed(MOVE_RUN, 0.5);
		me->SetSpeed(MOVE_WALK, 0.5);
		me->AddUnitMovementFlag(MOVEMENTFLAG_WALKING);

		m_uiBloatTimer = 6000;
    }

    void EnterCombat(Unit *who)
    {
    }

	void UpdateAI(const uint32 diff)
	{

		if(me->getVictim()->HasAura(SPELL_GASEOUS_BLOAT));
		{
			me->AddThreat(me->getVictim(), 1000000.0f);
			me->GetMotionMaster()->MoveChase(me->getVictim());
		}

		if (m_uiBloatTimer < diff)
		{
			DoCast(me->getVictim(), SPELL_GASEOUS_BLOAT_AURA);
			m_uiBloatTimer = 7000;
		} else m_uiBloatTimer -= diff;
	}
};
};

class npc_growing_ooze : public CreatureScript
{
public:
    npc_growing_ooze() : CreatureScript("npc_growing_ooze") { }

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new npc_growing_oozeAI(pCreature);
    }
struct npc_growing_oozeAI : public ScriptedAI
{
	npc_growing_oozeAI(Creature* pCreature) : ScriptedAI(pCreature)
	{
		pInstance = pCreature->GetInstanceScript();
	}

	InstanceScript* pInstance;

	uint32 m_uiPuddleTimer;

    void Reset()
    {
		m_uiPuddleTimer = 1500;

		me->SetSpeed(MOVE_RUN, 0.5);
		me->SetSpeed(MOVE_WALK, 0.5);
        //me->SetDisplayId(11686);
        me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
        me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
        me->SetInCombatWithZone();
        DoStartNoMovement(me->getVictim());
		DoCast(SPELL_SLIME_PUDDLE_AURA);
    }

    void EnterCombat(Unit *who)
    {
    }

	void UpdateAI(const uint32 diff)
    {
		if (m_uiPuddleTimer < diff)
		{
			DoCast(SPELL_SLIME_PUDDLE_AURA);
			m_uiPuddleTimer = 1500;
		} else m_uiPuddleTimer -= diff;
	}
};
};

class npc_bomb_icc : public CreatureScript
{
public:
    npc_bomb_icc() : CreatureScript("npc_bomb_icc") { }

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new npc_bomb_iccAI(pCreature);
    }
struct npc_bomb_iccAI : public ScriptedAI
{
	npc_bomb_iccAI(Creature* pCreature) : ScriptedAI(pCreature)
	{
		pInstance = pCreature->GetInstanceScript();
	}

	InstanceScript* pInstance;

	uint32 m_uiBombTimer;
	uint32 m_uiBoomTimer;

    void Reset()
    {
		m_uiBombTimer = 1500;
		m_uiBoomTimer = 20000;

        //me->SetDisplayId(11686);
        me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
        me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
        me->SetInCombatWithZone();
        DoStartNoMovement(me->getVictim());
		DoCast(me, SPELL_ORANGE_RADIATION);
    }

    void EnterCombat(Unit *who)
    {
    }

	void UpdateAI(const uint32 diff)
    {
		if (m_uiBombTimer < diff)
		{
			DoCast(SPELL_CHOKING_GAS_AURA);
			m_uiBombTimer = 1500;
		} else m_uiBombTimer -= diff;

		if (m_uiBoomTimer < diff)
		{
			DoCast(SPELL_CHOKING_GAS_EXPLOSION);
			me->ForcedDespawn();
			m_uiBoomTimer = 20000;
		} else m_uiBoomTimer -= diff;
	}
};
};

class npc_abomination : public CreatureScript
{
public:
    npc_abomination() : CreatureScript("npc_abomination") { }

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new npc_abominationAI(pCreature);
    }
struct npc_abominationAI : public ScriptedAI
{
	npc_abominationAI(Creature* pCreature) : ScriptedAI(pCreature), vehicle(me->GetVehicleKit())
	{
		assert(vehicle);
	}

	Vehicle* vehicle;

	bool InVehicle;

	void Reset()
	{
        me->GetVehicleKit();
		InVehicle = false;

		DoCast(me, SPELL_MUTATED);

		if(Unit* target = SelectUnit(SELECT_TARGET_RANDOM, 1))
		{
			if(InVehicle == false)
			{
			    target->EnterVehicle(vehicle);
			    InVehicle = true;
			}
		}
	}

	void UpdateAI(const uint32 uiDiff)
	{
	}
};
};

void AddSC_boss_professor_putricide()
{
    new boss_professor_putricide;
    new npc_volatile_ooze;
    new npc_gas_cloud_icc;
    new npc_bomb_icc;
    new npc_growing_ooze;
    new npc_abomination;

}
