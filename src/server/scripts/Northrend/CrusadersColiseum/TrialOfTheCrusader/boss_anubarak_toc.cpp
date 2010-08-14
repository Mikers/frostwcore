/*
 * Copyright (C) 2010 Dj_Stels <djstels@mail.ru>
 */

#include "ScriptPCH.h"
#include "trial_of_the_crusader.h"


enum Spells
{
    FREEZING_SLASH          = 66012,

    SWARM_10N               = 66118,
    SWARM_10H               = 68646,
    SWARM_25N               = 67630,
    SWARM_25H               = 68647,

    COLD_10N                = 66013,
    COLD_10H                = 68509,
    COLD_25N                = 67700,
    COLD_25H                = 68510,

    PERMAFROST_N            = 66193,
    PERMAFROST_H            = 67856,

    PURSUE                  = 67574,
    SPIKE                   = 65922,


    SUBMERGE_ANUB           = 65981,
    SUBMERGE_BURROWER       = 68394,
    BERSERK                 = 26662
};

enum Says
{
    SAY_GREET               = -1760064,
    SAY_AGGRO               = -1760065,
    SAY_SUBMERGE            = -1760066,
    SAY_SWARM               = -1760067,
    SAY_KILLING_1           = -1760068,
    SAY_KILLING_2           = -1760069,
    SAY_DEATH               = -1760070
};

enum Events
{
    EVENT_NULL,
    EVENT_COLD,
    EVENT_FREEZING_SLASH,
    EVENT_SPIKE
};

typedef std::list<HostileReference*> ThreatList;

Position spawnPositions[6]         =
{
    { 735.114990, 191.412994, 142.117996, 4.971080 },
    { 696.405273, 186.296097, 142.117996, 5.434452 },
    { 686.743835, 98.430656, 142.120285, 0.884638 },
    { 711.423523, 78.581139, 142.120285, 0.708715 },
    { 756.423462, 90.765480, 142.124878, 1.305618 },
    { 784.310913, 171.513092, 142.120331, 4.325483 }
};


#define SAY_KILLING                 RAND(SAY_KILLING_1, SAY_KILLING_2)

#define Cold_Timer                  18000
#define FreezingSlash_Timer         20000
#define Spike_Timer                 20000

struct boss_anubarakAI : public BossAI
{
    boss_anubarakAI(Creature* creature) : BossAI(creature, DATA_ANUBARAK)
    {
        greet = false;
    };

    uint32 phase;

    uint32 SwarmScarab_Timer;
    uint32 Burrower_Timer;

    uint32 Burrow_Timer;
    bool burrowed;

    uint32 tick_Timer;

    std::vector<uint64> ColdTargets;
    bool greet;

    void Reset()
    {
        _Reset();

        phase = 1;
        SwarmScarab_Timer = 5000;
        Burrower_Timer = 20000;
        Burrow_Timer = 90000;
        burrowed = false;
        tick_Timer = 1000;

        me->RemoveAllAuras();
        me->RemoveFlag64(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE|UNIT_FLAG_NOT_SELECTABLE);

        instance->DoRemoveAurasDueToSpellOnPlayers(RAID_MODE(PERMAFROST_N, PERMAFROST_N, PERMAFROST_H, PERMAFROST_H));
        ColdTargets.resize(5);
    }

    void JustReachedHome()
    {
        instance->SetData(RESET_TO_FIGHT, DATA_ANUBARAK);
    }

    void EnterCombat(Unit* who)
    {
        _EnterCombat();

        DoScriptText(SAY_AGGRO, me);

        events.ScheduleEvent(EVENT_COLD, 5000);
        events.ScheduleEvent(EVENT_FREEZING_SLASH, FreezingSlash_Timer);
    }

    void KilledUnit(Unit* who)
    {
        if (who->GetTypeId() == TYPEID_PLAYER)
            DoScriptText(SAY_KILLING, me);


        if (who->GetTypeId() == TYPEID_PLAYER)
            instance->SetData(UPDATE_DEATHS_COUNT, 0);
    }

    void JustDied(Unit* who)
    {
        _JustDied();

        DoScriptText(SAY_DEATH, me);
        instance->DoRemoveAurasDueToSpellOnPlayers(RAID_MODE(PERMAFROST_N, PERMAFROST_N, PERMAFROST_H, PERMAFROST_H));
    }



    void UpdateAI(const uint32 diff)
    {
		if (!greet)
		{
			Map::PlayerList const &PlayerList = me->GetMap()->GetPlayers();
			if (!PlayerList.isEmpty())
				for (Map::PlayerList::const_iterator i = PlayerList.begin(); i != PlayerList.end(); ++i)
					if (Player* pPlayer = i->getSource())
						if (!pPlayer->isGameMaster() && me->GetDistance(pPlayer) <= 75.0f)
						{
							DoScriptText(SAY_GREET, me);
							greet = true;
							break;
						}
		}
        if (!UpdateVictim())
            return;

        if (phase != 3)
        {
            if (SwarmScarab_Timer < diff)
            {
                //spell 66340
                if (Creature* scarab = DoSummon(NPC_SCARAB, spawnPositions[urand(0,5)]))
                {
                    if (phase != 2)
                        scarab->GetMotionMaster()->MoveRandom(30.0f);
                    else
                    {
                        scarab->setFaction(me->getFaction());
                        scarab->AI()->AttackStart(SelectUnit(SELECT_TARGET_RANDOM, 0));
                    }
                }
                SwarmScarab_Timer = 10000;
            } else SwarmScarab_Timer -= diff;
        }

        if (phase == 1 || (RAID_MODE(0,0,1,1) && phase ==3))
        {
            if (Burrower_Timer < diff)
            {
                for (int i = 0; i < RAID_MODE(1,2,2,4); ++i)
                {
                    if (Creature* burrower = DoSummon(NPC_BURROWER, spawnPositions[urand(0,5)]))
                        burrower->AI()->AttackStart(SelectUnit(SELECT_TARGET_RANDOM, 0));
                }

                Burrower_Timer = urand(55000, 65000);
            } else Burrower_Timer -= diff;
        }

        if (phase == 3)
        {
            if (tick_Timer < diff)
            {
                if (me->GetMap()->HavePlayers())
                {
                    uint32 healammount=0;
                    Map::PlayerList const& list = me->GetMap()->GetPlayers();
                    for (Map::PlayerList::const_iterator itr = list.begin(); itr != list.end(); ++itr)
                    {
                        Player* plr = itr->getSource();
                        if (!plr || !plr->isAlive() || !plr->HasAura(RAID_MODE(SWARM_10N, SWARM_25N, SWARM_10H, SWARM_25H)) || plr->isGameMaster())
                            continue;

                        uint8 percent = RAID_MODE(10, 10, 20, 30);
                        uint32 dmg = plr->GetHealth()*percent/100;

                        if (dmg < 250)
                            dmg = 250;

                        me->DealDamage(plr, dmg);
                        healammount+=dmg;
                    }

                    if (healammount)
                        me->DealHeal(me, healammount, GetSpellStore()->LookupEntry(RAID_MODE(SWARM_10N, SWARM_25N, SWARM_10H, SWARM_25H)));
  
                }
                tick_Timer = 1000;
            } else tick_Timer -= diff;
        }

        events.Update(diff);
        UpdateBurrowers();

        if (!burrowed && phase != 3)
        {
            if (Burrow_Timer < diff)
            {
                DoScriptText(SAY_SUBMERGE, me);
                DoCast(me, SUBMERGE_ANUB);

                burrowed = true;
                SwitchPhase(2);

                Burrow_Timer = 60000;
            } else Burrow_Timer -= diff;
        }
        else if (phase != 3)
        {
            if (Burrow_Timer < diff)
            {
                me->RemoveAurasDueToSpell(SUBMERGE_ANUB);

                burrowed = false;
                SwitchPhase(1);

                Burrow_Timer = 90000;
            } else Burrow_Timer -= diff;
        }

        if (HealthBelowPct(31) && phase != 3)
            SwitchPhase(3);

        while (uint32 id = events.GetEvent())
        {
            switch (id)
            {
            case EVENT_COLD:
                DoColdEvent();
                events.RepeatEvent(Cold_Timer);
                break;

            case EVENT_FREEZING_SLASH:
                DoCast(me->getVictim(), FREEZING_SLASH);
                events.RepeatEvent(FreezingSlash_Timer);
                break;

            case EVENT_SPIKE:
                if (Unit* target = SelectUnit(SELECT_TARGET_RANDOM, 0))
                {
                    DoCast(target, PURSUE);
                    DoCast(target, SPIKE);
                }
                events.RepeatEvent(Spike_Timer);
                break;

            default:
                events.PopEvent();
            }
        }

        if (!burrowed)
            DoMeleeAttackIfReady();
    }




    void SwitchPhase(int i)
    {
        events.Reset();

        switch (i)
        {
        case 1:
            phase = 1;
            events.ScheduleEvent(EVENT_COLD, Cold_Timer);
            events.ScheduleEvent(EVENT_FREEZING_SLASH, FreezingSlash_Timer);
            me->RemoveFlag64(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE|UNIT_FLAG_NOT_SELECTABLE);
            break;

        case 2:
            phase = 2;
            events.ScheduleEvent(EVENT_SPIKE, Spike_Timer);
            me->SetFlag64(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE|UNIT_FLAG_NOT_SELECTABLE);
            for (SummonList::const_iterator itr = summons.begin(); itr != summons.end(); ++itr)
            {
                if (Creature* scarab = ObjectAccessor::GetCreatureOrPetOrVehicle((*me), (*itr)))
                {
                    if (scarab->isAlive() && scarab->GetEntry() == NPC_SCARAB)
                    {
                        scarab->setFaction(me->getFaction());
                        scarab->AI()->AttackStart(SelectUnit(SELECT_TARGET_RANDOM, 0));
                    }
                }
            }
            break;

        case 3:
            phase = 3;
            DoCast(me, RAID_MODE(SWARM_10N, SWARM_25N, SWARM_10H, SWARM_25H));
            events.ScheduleEvent(EVENT_COLD, Cold_Timer);
            events.ScheduleEvent(EVENT_FREEZING_SLASH, FreezingSlash_Timer);
            break;
        }
    }

    void DoColdEvent()
    {
        std::vector<uint64> newTargets;

        ThreatList const& list = me->getThreatManager().getThreatList();
        uint32 size = list.size();

        ThreatList::const_iterator itr = list.begin();
        while (itr != list.end())
        {
            Unit* unit = ObjectAccessor::GetUnit((*me), (*itr)->getUnitGuid());
            if (!unit || !unit->isAlive())
            {
                --size;
            }
            else
            {
                uint64 guid = unit->GetGUID();

                bool ok = true;

                //if in boss' threat list is only 5 targtes of less, add them anyway
                if (size > 5 && !ColdTargets.empty())
                {
                    //if more, add only if prevoiusly wasn't targeted
                    for (int i = 0; i < ColdTargets.size(); ++i)
                    {
                        if (ColdTargets[i] == guid)
                            ok = false;
                    }
                }

                if (ok)
                    newTargets.push_back(guid);

            }

            ++itr;
        }

        if (!newTargets.empty())
        {
            //if we have less than 5 targets (if threat list have more than 5 positions but less than 10)
            if (newTargets.size() < 5 && size > 5)
            {
                do
                {
                    uint64 guid = SelectUnit(SELECT_TARGET_RANDOM, 0)->GetGUID();
                    bool ok = true;

                    for (int i = 0; i < newTargets.size(); ++i)
                    {
                        if (newTargets[i] == guid)
                            ok = false;
                    }

                    if (ok)
                        newTargets.push_back(guid);
                }
                while (newTargets.size() < 5);
            }

            ColdTargets.clear(); //na wszelki wypadek :)
            ColdTargets = newTargets;
        }

        for (int i = 0; i < ColdTargets.size(); ++i)
        {
            Unit* unit = ObjectAccessor::GetUnit((*me), ColdTargets[i]);
            DoCast(unit, RAID_MODE(COLD_10N, COLD_25N, COLD_10H, COLD_25H));
        }
    }

    void UpdateBurrowers()
    {
        if (summons.empty() || summons.size() == 1)
            return;

        for (SummonList::const_iterator itr = summons.begin(); itr != summons.end(); ++itr)
        {
            uint32 count = 0;
            Creature* burrower = ObjectAccessor::GetCreatureOrPetOrVehicle((*me), (*itr));
            if (!burrower || !burrower->isAlive())
                continue;
            if (burrower->GetEntry() != NPC_BURROWER)
                continue;

            for (SummonList::const_iterator itr2 = summons.begin(); itr2 != summons.end(); ++itr2)
            {
                Creature* burrower2 = ObjectAccessor::GetCreatureOrPetOrVehicle((*me), (*itr));
                if (!burrower2 || !burrower2->isAlive())
                    continue;
                if (burrower2->GetEntry() != NPC_BURROWER)
                    continue;
                if (burrower2->GetGUID() == burrower->GetGUID())
                    continue;

                if (burrower->GetDistance2d(burrower2) >= 12.0f)
                    ++count;
            }

            if (burrower->HasAura(66129))
            {
                while (burrower->GetAura(66129)->GetStackAmount() < count)
                    burrower->CastSpell(burrower, 66129, false);
            }
            else
            {
                if (Aura* aura = burrower->AddAura(66129, burrower))
                    aura->SetStackAmount(count);
            }
        }
    }
};

CreatureAI* GetAI_boss_anubarak(Creature* creature)
{
    return new boss_anubarakAI(creature);
}



struct mob_frost_spheresAI : public ScriptedAI
{
    mob_frost_spheresAI(Creature* creature) : ScriptedAI(creature)
    {
    }

    bool kill;

    void Reset()
    {
        kill = false;
    }


    void DamageTaken(Unit* who, uint32& dmg)
    {
        if (dmg > me->GetHealth())
        {
            dmg = 0;
            if (!kill)
                kill = true;
        }
    }

    void UpdateAI(const uint32 diff)
    {
        if (!me->isAlive())
        {
            Map::PlayerList const& list = me->GetMap()->GetPlayers();
            if (!list.isEmpty())
            {
                for (Map::PlayerList::const_iterator itr = list.begin(); itr != list.end(); ++itr)
                {
                    Player* plr = itr->getSource();
                    if (!plr || !plr->isAlive() || plr->isGameMaster())
                        continue;

                    if (me->GetDistance2d(plr) <= 5.0f)
                        me->AddAura(RAID_MODE(PERMAFROST_N, PERMAFROST_N, PERMAFROST_H, PERMAFROST_H), plr);
                    else
                        plr->RemoveAurasDueToSpell(RAID_MODE(PERMAFROST_N, PERMAFROST_N, PERMAFROST_H, PERMAFROST_H));
                }
            }
        }

        if (kill)
        {
            me->GetMotionMaster()->MoveFall(me->GetMap()->GetHeight(me->GetPositionX(), me->GetPositionY(), me->GetPositionZ()));
            DoCast(me, RAID_MODE(PERMAFROST_N, PERMAFROST_N, PERMAFROST_H, PERMAFROST_H));
            me->Kill(me);
        }
    }
};

CreatureAI* GetAI_mob_frost_spheres(Creature* creature)
{
    return new mob_frost_spheresAI(creature);
}



struct mob_nerubian_burrowerAI : public ScriptedAI
{
    mob_nerubian_burrowerAI(Creature* creature) : ScriptedAI(creature)
    {
    }

    bool tryToBurrow;
    uint32 exposeTimer;
    uint32 shadowStrikeTimer;
    uint32 heal_Timer;

    void Reset()
    {
        tryToBurrow = false;
        exposeTimer = me->GetAttackTime(BASE_ATTACK);
        shadowStrikeTimer = 30000;
        heal_Timer = 1000;
    }

    void DamageTaken(Unit* who, uint32& damage)
    {
        if ((me->GetHealth()-damage)*100/me->GetMaxHealth() <= 10)
            tryToBurrow = true;
    }

    void KilledUnit(Unit* who)
    {
        if (who->GetTypeId() == TYPEID_PLAYER && me->GetInstanceData())
            me->GetInstanceData()->SetData(UPDATE_DEATHS_COUNT, 0);
    }

    void UpdateAI(const uint32 diff)
    {
        if (!UpdateVictim())
            return;

        if (tryToBurrow && !me->HasAura(RAID_MODE(PERMAFROST_N, PERMAFROST_N, PERMAFROST_H, PERMAFROST_H)))
        {
            DoCast(me, SUBMERGE_BURROWER);
            me->SetFlag64(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE|UNIT_FLAG_NOT_SELECTABLE);
            tryToBurrow = false;
        }

        if (me->HasAura(SUBMERGE_BURROWER))
        {
            if (heal_Timer < diff)
            {
                me->SetHealth(me->GetHealth()+me->GetMaxHealth()*10/100);
                if (me->GetHealth() == me->GetMaxHealth())
                {
                    me->RemoveAurasDueToSpell(SUBMERGE_BURROWER);
                    me->RemoveFlag64(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE|UNIT_FLAG_NOT_SELECTABLE);
                }
                heal_Timer = 1000;
            } else heal_Timer -= diff;
        }

        if (me->HasAura(SUBMERGE_BURROWER))
            return;

        if (me->IsWithinMeleeRange(me->getVictim()) && roll_chance_i(66))
        {
            if (exposeTimer < diff)
            {
                DoCast(me->getVictim(), 67847);
                exposeTimer = me->GetAttackTime(BASE_ATTACK);
            } else exposeTimer -= diff;
        }

        if (getDifficulty() == RAID_DIFFICULTY_10MAN_HEROIC || getDifficulty() == RAID_DIFFICULTY_25MAN_HEROIC)
        {
            if (shadowStrikeTimer < diff)
            {
                DoCast(SelectUnit(SELECT_TARGET_RANDOM, 0), 66134);
                shadowStrikeTimer = 30000;
            } else shadowStrikeTimer -= diff;
        }

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_mob_nerubian_burrower(Creature* creature)
{
    return new mob_nerubian_burrowerAI(creature);
}


struct mob_swarm_scarabAI : public ScriptedAI
{
    mob_swarm_scarabAI(Creature* creature) : ScriptedAI(creature)
    {
    }

    uint32 poisonTimer;
    bool roll;

    void Reset()
    {
        roll = false;
        poisonTimer = me->GetAttackTime(BASE_ATTACK);
    }

    void KilledUnit(Unit* who)
    {
        if (who->GetTypeId() == TYPEID_PLAYER && me->GetInstanceData())
            me->GetInstanceData()->SetData(UPDATE_DEATHS_COUNT, 0);
    }

    void JustDied(Unit* who)
    {
        if (me->GetInstanceData())
            me->GetInstanceData()->SetData(SCARAB_DEATH, 0);
    }

    void UpdateAI(const uint32 diff)
    {
        if (!UpdateVictim())
            return;

        if (poisonTimer < diff)
        {
            //50% chance
            if (urand(0,1))
                DoCast(me->getVictim(), RAID_MODE(65775, 67861, 67862, 67863));
            poisonTimer = me->GetAttackTime(BASE_ATTACK);
        } else poisonTimer -= diff;


        if (!roll && HealthBelowPct(30))
        {
            if (roll_chance_i(33))
                DoCast(me, 66092);
            roll = true;
        }

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_mob_swarm_scarab(Creature* creature)
{
    return new mob_swarm_scarabAI(creature);
}


/* struct mob_anubs_spikeAI : public ScriptedAI
{
    mob_anubs_spikeAI(Creature* creature) : ScriptedAI(creature)
    {
    }

    uint32 move_Timer;
    uint64 target;

    void Reset()
    {
        move_Timer = 1500;
        target = 0;
    }

    void UpdateAI(const uint32 diff)
    {
        if (!target)
            return;

        Unit* pTarget = ObjectAccessor::GetUnit((*me), target);
        if (!pTarget->isAlive())
        {
            me->ForcedDespawn();
            return;
        }

        if (move_Timer < diff)
        {
            float x,y,z = 0;
            
            me->GetClosePoint(x, y, z, me->GetObjectSize(), 1.5f, me->GetAngle((*pTarget)));
            me->Relocate(x, y, z);
            me->SetOrientation(me->GetAngle((*pTarget)));

            if (me->HasAura(RAID_MODE(PERMAFROST_N, PERMAFROST_N, PERMAFROST_H, PERMAFROST_H)))
            {
                uint64 guid = me->GetAura(RAID_MODE(PERMAFROST_N, PERMAFROST_N, PERMAFROST_H, PERMAFROST_H))->GetCasterGUID();
                if (guid)
                    if (GameObject* go = me->GetMap()->GetGameObject(guid))
                        go->Delete();

                me->ForcedDespawn();
                return;
            }

            if (const Map* map = me->GetMap())
            {
                Map::PlayerList const& list = map->GetPlayers();
                if (!list.isEmpty())
                {
                    for (Map::PlayerList::const_iterator itr = list.begin(); itr != list.end(); ++itr)
                    {
                        Player* plr = itr->getSource();
                        if (!plr || !plr->isAlive() || plr->isGameMaster() || me->GetDistance2d(plr) > 4.0f)
                            continue;

                        if (me->GetDistance2d(plr) < 4.1f && me->GetDistance2d(plr) > 1.5f)
                            me->DealDamage(plr, urand(2828, 3172));
                        else if (me->GetDistance2d(plr) < 1.6f)
                        {
                            me->CastSpell(plr, RAID_MODE(67858, 67858, 67859, 67859), false);
                            if (plr == pTarget)
                                me->ForcedDespawn();
                        }
                    }
                }
            }
            move_Timer = 1500;
        } else move_Timer -= diff;
    }
};*/



void AddSC_boss_anubarak_toc()
{
    Script* newscript;

    newscript = new Script;
    newscript->Name = "boss_anubarak_toc";
    newscript->GetAI = &GetAI_boss_anubarak;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "mob_frost_spheres";
    newscript->GetAI = &GetAI_mob_frost_spheres;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "mob_nerubian_burrower";
    newscript->GetAI = &GetAI_mob_nerubian_burrower;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "mob_swarm_scarab";
    newscript->GetAI = &GetAI_mob_swarm_scarab;
    newscript->RegisterSelf();
}