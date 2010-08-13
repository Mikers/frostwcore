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

#define	SAY_PRECIOUS    -1666015
#define	SAY_AGGRO       -1666016
#define	SAY_DEATH_1     -1666024
#define	SAY_DEATH_2     -1666025
#define	SAY_KILL        RAND(-1666022,-1666021)
#define	SAY_BERSERK     -1666023
#define	SAY_SPRAY       -1666017
#define	SAY_OOZE_FLOOD  -1666018

#define EMOTE_EXPLOSION "Big Ooze can barely maintain its form!"
#define EMOTE_SLIME_SPRAY "Rotface begins to cast Slime Spray!"

#define	SPELL_OOZE_FLOOD         69789
#define	SPELL_OOZE_FLOOD_1       69788
#define	SPELL_OOZE_FLOOD_2       69783
#define	SPELL_SLIME_SPRAY        69508 //vozmozno summonit NIPa
#define	SPELL_INFECTION          70003
#define	SPELL_INFECTION_1        69674
#define	SPELL_SUMMON_LITTLE_OOZE 69706
#define	SPELL_SUMMON_BIG_OOZE    69540
#define	SPELL_BERSERK            47008
#define	SPELL_STICKY_OOZE        69774
#define	SPELL_STICKY_OOZE_1      69776
#define	SPELL_RADIATING_OOZE     69750
#define	SPELL_RADIATING_OOZE_1   69760
#define	SPELL_UNSTABLE_OOZE      69558
#define	SPELL_UNSTABLE_OOZE_1    69644
#define	SPELL_EXPLOSION          69839
#define	SPELL_EXPLOSION_1        69840
#define	SPELL_MERGE_OOZE         69889
#define SPELL_VOLATILE_OOZE      RAID_MODE(70447,72837,72836,72838)

const Position SpawnLoc[]=
{
    {4468.825f, 3094.986f, 360.385f},
    {4487.825f, 3114.452f, 360.385f},
    {4489.825f, 3159.452f, 360.385f},
    {4467.825f, 3178.986f, 360.385f},
    {4424.421f, 3178.986f, 360.385f},
    {4404.821f, 3158.452f, 360.385f},
    {4404.825f, 3116.452f, 360.385f},
    {4424.825f, 3095.986f, 360.385f},
};

class boss_rotface : public CreatureScript
{
public:
    boss_rotface() : CreatureScript("boss_rotface") { }

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new boss_rotfaceAI(pCreature);
    }
struct boss_rotfaceAI : public BossAI
{
	boss_rotfaceAI(Creature* pCreature) : BossAI(pCreature, DATA_ROTFACE_EVENT), summons(me)
	{
		pInstance = me->GetInstanceScript();
	}

	InstanceScript* pInstance;

	uint32 m_uiFloodTimer;
	uint32 m_uiSlimeSprayTimer;
	uint32 m_uiMutatedInfectionTimer;
	uint32 m_uiMutatedInfection1Timer;
	uint32 m_uiBerserkTimer;
	uint32 m_uiResetTimer;

	Unit* InfectionTarget[5];

	bool flood;
	bool spawn;
	bool add_precious;

	SummonList summons;

	void Reset()
	{
		m_uiFloodTimer = 35000;
		m_uiSlimeSprayTimer = 20000;
		m_uiMutatedInfectionTimer = 15000;
		m_uiMutatedInfection1Timer = 1000;
		m_uiBerserkTimer = 600000;

		flood = false;
		add_precious = false;

		if(summons.empty())
			return;

		summons.DespawnAll();

		memset(&InfectionTarget, 0, sizeof(InfectionTarget));

		if(pInstance)
			if(me->isAlive())
			{
				pInstance->SetData(DATA_ROTFACE_EVENT, NOT_STARTED);
				pInstance->DoRemoveAurasDueToSpellOnPlayers(SPELL_INFECTION);
			}
	}

	void JustDied(Unit* pKiller)
	{
	    Creature* professor = Unit::GetCreature(*me, pInstance->GetData64(DATA_PROFESSOR_PUTRICIDE));
		if(professor)
		{
		    DoScriptText(SAY_DEATH_2, professor);
		}
		DoScriptText(SAY_DEATH_1, me);

		if(summons.empty())
            return;

		summons.DespawnAll();

		if(pInstance)
		{
		    pInstance->DoRemoveAurasDueToSpellOnPlayers(SPELL_INFECTION);
			pInstance->SetData(DATA_ROTFACE_EVENT, DONE);
		}
	}

	void EnterCombat(Unit* who)
	{
		DoScriptText(SAY_AGGRO, me);

		if(add_precious == false)
		{
			Creature* precious = Unit::GetCreature(*me, pInstance->GetData64(DATA_PRECIOUS));

			if (precious)
			    if(precious->isDead())
			    {
				    DoScriptText(SAY_PRECIOUS, me);
				    add_precious = true;
			    }
		}

		if(pInstance)
			pInstance->SetData(DATA_ROTFACE_EVENT, IN_PROGRESS);
	}

	void JustReachedHome()
	{
		if(pInstance)
		{
		    pInstance->DoRemoveAurasDueToSpellOnPlayers(SPELL_INFECTION);
			pInstance->SetData(DATA_ROTFACE_EVENT, FAIL);
		}
	}

	void KilledUnit(Unit *pVictim)
	{
		DoScriptText(SAY_KILL, me);
	}

	void UpdateAI(const uint32 diff)
	{
		if (!UpdateVictim())
			return;

		if (m_uiSlimeSprayTimer <= diff)
		{
		    if(Unit* target = SelectUnit(SELECT_TARGET_NEAREST, 1))
			{
			    float x,y,z;
				target->GetPosition(x,y,z);
				me->SummonCreature(37986,x,y,z,0,TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,4000);
			    DoCast(SPELL_SLIME_SPRAY);
			    DoScriptText(SAY_SPRAY,me);
			    me->MonsterTextEmote(EMOTE_SLIME_SPRAY,NULL);
			}
			m_uiSlimeSprayTimer = 25000;
		} else m_uiSlimeSprayTimer -= diff;

        if (m_uiResetTimer <= diff)
        {
            if (me->GetDistance2d(me->GetHomePosition().GetPositionX(), me->GetHomePosition().GetPositionY()) > 40)
                EnterEvadeMode();
            m_uiResetTimer = 5000;
        } else m_uiResetTimer -= diff;

		if(flood == true)
		{
		    DoCast(SPELL_OOZE_FLOOD_2);
			flood = false;
		}

		if (m_uiFloodTimer <= diff)
		{
			flood = true;
			DoScriptText(SAY_OOZE_FLOOD, me);
			//random
			switch (rand() % 4)
			{
			case 0:
				me->SummonCreature(37013, SpawnLoc[0], TEMPSUMMON_TIMED_DESPAWN, 24000);
				me->SummonCreature(37013, SpawnLoc[1], TEMPSUMMON_TIMED_DESPAWN, 24000);
				break;
			case 1:
				me->SummonCreature(37013, SpawnLoc[2], TEMPSUMMON_TIMED_DESPAWN, 24000);
				me->SummonCreature(37013, SpawnLoc[3], TEMPSUMMON_TIMED_DESPAWN, 24000);
				break;
			case 2:
				me->SummonCreature(37013, SpawnLoc[4], TEMPSUMMON_TIMED_DESPAWN, 24000);
				me->SummonCreature(37013, SpawnLoc[5], TEMPSUMMON_TIMED_DESPAWN, 24000);
				break;
			case 3:
				me->SummonCreature(37013, SpawnLoc[6], TEMPSUMMON_TIMED_DESPAWN, 24000);
				me->SummonCreature(37013, SpawnLoc[7], TEMPSUMMON_TIMED_DESPAWN, 24000);
				break;
			}
			m_uiFloodTimer = 25000;
		} else m_uiFloodTimer -= diff;

		if (m_uiMutatedInfection1Timer <= diff)
		{
			for(uint8 i = 0; i < 5; ++i)
			{
				if (InfectionTarget[i])
				{
					if(InfectionTarget[i]->isAlive() && !InfectionTarget[i]->HasAura(SPELL_INFECTION_1))
					{
						float x, y, z;
						InfectionTarget[i]->GetPosition(x, y, z);
						Unit* smallooze = DoSummon(36897, InfectionTarget[i]);
						if(smallooze)
						{
							smallooze->AddThreat(InfectionTarget[i], 1000.0f);
							InfectionTarget[i] = NULL;
						}
					}
				}
			}
			m_uiMutatedInfection1Timer = 1000;
		} else m_uiMutatedInfection1Timer -= diff;

	    if (m_uiMutatedInfectionTimer <= diff)
	    {
		    for(uint8 i = 0; i < 5; ++i)
			{
		        if (!InfectionTarget[i])
		        {
				    if(Unit* target = SelectUnit(SELECT_TARGET_RANDOM, 1))
					{
                        InfectionTarget[i] = target;
                        DoCast(InfectionTarget[i], SPELL_INFECTION);
					}
				}
		    }
		    m_uiMutatedInfectionTimer = 15000;
	    } else m_uiMutatedInfectionTimer -= diff;

	    if (m_uiBerserkTimer <= diff)
	    {
		    DoScriptText(SAY_BERSERK, me);
		    DoCast(me, SPELL_BERSERK);
		    m_uiBerserkTimer = 600000;
	    } else m_uiBerserkTimer -= diff;
	DoMeleeAttackIfReady();
    }
	};
};

class npc_ooze_big : public CreatureScript
{
public:
    npc_ooze_big() : CreatureScript("npc_ooze_big") { }

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new npc_ooze_bigAI(pCreature);
    }
struct npc_ooze_bigAI : public ScriptedAI
{
	npc_ooze_bigAI(Creature* pCreature) : ScriptedAI(pCreature)
	{
		pInstance = pCreature->GetInstanceScript();
	}

	InstanceScript* pInstance;

	uint32 m_uiStickyOozeTimer;

	void Reset()
	{
		m_uiStickyOozeTimer = 10000;
		DoCast(SPELL_UNSTABLE_OOZE);
		me->AddUnitMovementFlag(MOVEMENTFLAG_WALKING);
		me->SetSpeed(MOVE_WALK, 0.5f);
		me->SetSpeed(MOVE_RUN, 0.5);
	}

	void EnterCombat(Unit* who)
	{
	}

	void KilledUnit(Unit *pVictim)
	{
	}

	void UpdateAI(const uint32 diff)
	{
		if (!UpdateVictim())
			return;

		if (m_uiStickyOozeTimer <= diff)
		{
			DoCast(SPELL_STICKY_OOZE);
			m_uiStickyOozeTimer = 10000;
		} else m_uiStickyOozeTimer -= diff;

		Creature* little = me->FindNearestCreature(36897, 7.0f,true);
		if(little)
		{
	        DoCast(me, SPELL_UNSTABLE_OOZE);
			little->ForcedDespawn();
		}

		Creature* big = me->FindNearestCreature(36899, 7.0f,true);
		if(big)
		{
		    DoCast(me, SPELL_UNSTABLE_OOZE);
			big->ForcedDespawn();
		}

		if (Aura *UnstableAura = me->GetAura(SPELL_UNSTABLE_OOZE))
		{
			if (UnstableAura && UnstableAura->GetStackAmount() > 4)
			{
				DoCast(SPELL_EXPLOSION);
				me->MonsterTextEmote(EMOTE_EXPLOSION,NULL);
				me->RemoveAurasDueToSpell(SPELL_UNSTABLE_OOZE);
				me->ForcedDespawn();
			}
		}
		DoMeleeAttackIfReady();
	}
};
};

class npc_ooze_little : public CreatureScript
{
public:
    npc_ooze_little() : CreatureScript("npc_ooze_little") { }

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new npc_ooze_littleAI(pCreature);
    }
struct npc_ooze_littleAI : public ScriptedAI
{
	npc_ooze_littleAI(Creature* pCreature) : ScriptedAI(pCreature)
	{
		pInstance = pCreature->GetInstanceScript();
	}

	InstanceScript* pInstance;

	uint32 m_uiStickyOozeTimer;

	void Reset()
	{
		m_uiStickyOozeTimer = 10000;
		DoCast(SPELL_RADIATING_OOZE);
		me->AddUnitMovementFlag(MOVEMENTFLAG_WALKING);
		me->SetSpeed(MOVE_WALK, 0.5f);
		me->SetSpeed(MOVE_RUN, 0.5f);
	}

	void EnterCombat(Unit* who)
	{
	}

	void KilledUnit(Unit *victim)
	{
	}

	void UpdateAI(const uint32 diff)
	{
		if (!UpdateVictim())
			return;

		if (m_uiStickyOozeTimer <= diff)
		{
			DoCast(SPELL_STICKY_OOZE);
			m_uiStickyOozeTimer = 10000;
		} else m_uiStickyOozeTimer -= diff;

		Creature* little = me->FindNearestCreature(36897, 7.0f,true);
		if(little)
		{
	        DoCast(little, SPELL_MERGE_OOZE);
			little->ForcedDespawn();
		}
		DoMeleeAttackIfReady();
	}
};
};

class npc_sticky_ooze : public CreatureScript
{
public:
    npc_sticky_ooze() : CreatureScript("npc_sticky_ooze") { }

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new npc_sticky_oozeAI(pCreature);
    }
struct npc_sticky_oozeAI : public ScriptedAI
{
	npc_sticky_oozeAI(Creature* pCreature) : ScriptedAI(pCreature)
	{
		pInstance = pCreature->GetInstanceScript();
	}

	InstanceScript* pInstance;

    void Reset()
    {
        me->SetDisplayId(11686);
        DoCast(me, SPELL_STICKY_OOZE_1);
        me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
        me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
        me->SetInCombatWithZone();
        DoStartNoMovement(me->getVictim());
    }

	void EnterCombat(Unit* who)
	{
	}

	void KilledUnit(Unit *victim)
	{
	}

    void UpdateAI(const uint32 diff)
    {
		if (!UpdateVictim())
			return;
    }
};
};

class npc_ooze_stalker : public CreatureScript
{
public:
    npc_ooze_stalker() : CreatureScript("npc_ooze_stalker") { }

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new npc_ooze_stalkerAI(pCreature);
    }
struct npc_ooze_stalkerAI : public ScriptedAI
{
	npc_ooze_stalkerAI(Creature* pCreature) : ScriptedAI(pCreature)
	{
		pInstance = pCreature->GetInstanceScript();
	}

    InstanceScript* pInstance;

	uint32 m_uiFloodTimer;

    void Reset()
    {
        me->SetDisplayId(11686);
        me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
        me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
        me->SetInCombatWithZone();
        DoStartNoMovement(me->getVictim());
		me->CastSpell(me, SPELL_OOZE_FLOOD, true);

		m_uiFloodTimer = 1500;
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if(m_uiFloodTimer <= uiDiff)
        {
            DoCast(me,SPELL_OOZE_FLOOD);
            m_uiFloodTimer = 1500;
        } else m_uiFloodTimer -= uiDiff;
    }
};
};

class npc_ooze_spray_stalker : public CreatureScript
{
public:
    npc_ooze_spray_stalker() : CreatureScript("npc_ooze_spray_stalker") { }

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new npc_ooze_spray_stalkerAI(pCreature);
    }
struct npc_ooze_spray_stalkerAI : public ScriptedAI
{
	npc_ooze_spray_stalkerAI(Creature* pCreature) : ScriptedAI(pCreature)
	{
		pInstance = pCreature->GetInstanceScript();
	}

    InstanceScript* pInstance;

    void Reset()
    {
        me->SetDisplayId(11686);
        me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
        me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
        me->SetInCombatWithZone();
        DoStartNoMovement(me->getVictim());
    }

    void UpdateAI(const uint32 uiDiff)
    {
    }
};
};

class npc_ooze_explode_stalker : public CreatureScript
{
public:
    npc_ooze_explode_stalker() : CreatureScript("npc_ooze_explode_stalker") { }

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new npc_ooze_explode_stalkerAI(pCreature);
    }
struct npc_ooze_explode_stalkerAI : public ScriptedAI
{
	npc_ooze_explode_stalkerAI(Creature* pCreature) : ScriptedAI(pCreature)
	{
		pInstance = pCreature->GetInstanceScript();
	}

    InstanceScript* pInstance;

	uint32 m_uiExplosionTimer;

    void Reset()
    {
		m_uiExplosionTimer = 2000;

        me->SetDisplayId(11686);
        me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
        me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
        DoStartNoMovement(me->getVictim());
        me->SetInCombatWithZone();
        DoCast(SPELL_EXPLOSION_1);
    }

    void UpdateAI(const uint32 uiDiff)
    {
		if (!UpdateVictim())
			return;

		Creature* creator = me->FindNearestCreature(36899, 20.0f,true);
        if (creator && creator->isAlive())
              creator->ForcedDespawn();

		if (m_uiExplosionTimer <= uiDiff)
		{
			DoCast(SPELL_EXPLOSION_1);
			me->ForcedDespawn();
			m_uiExplosionTimer = 2000;
		} else m_uiExplosionTimer -= uiDiff;

    }
};
};

void AddSC_boss_rotface()
{
	new boss_rotface;
	new npc_ooze_big;
	new npc_ooze_little;
    new npc_sticky_ooze;
    new npc_ooze_stalker;
    new npc_ooze_spray_stalker;
    new npc_ooze_explode_stalker;
}
