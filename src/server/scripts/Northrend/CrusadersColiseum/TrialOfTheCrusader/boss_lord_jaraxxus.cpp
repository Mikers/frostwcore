/*
 * Copyright (C) 2010 Dj_Stels <djstels@mail.ru>
 */

#include "ScriptPCH.h"
#include "trial_of_the_crusader.h"


enum Spells
{
    BUFF                = 67009,
    FELL_LIGHTING       = 67888,
    BERSERK             = 64238,
    TOUCH               = 66209,

    FEL_FIREBALL_10N    = 66532,
    FEL_FIREBALL_10H    = 66964,
    FEL_FIREBALL_25N    = 66963,
    FEL_FIREBALL_25H    = 66965,

    FEL_LIGHTING_10N    = 66528,
    FEL_LIGHTING_10H    = 67030,
    FEL_LIGHTING_25N    = 67029,
    FEL_LIGHTING_25H    = 67031,

    INICIRATE_10N       = 66237,
    INICIRATE_10H       = 67050,
    INICIRATE_25N       = 67049,
    INICIRATE_25H       = 67051,

    ERRUPTION_10N       = 66258,
    ERRUPTION_10H       = 67902,
    ERRUPTION_25N       = 67901,
    ERRUPTION_25H       = 67903,

    LEGION_FLAME_10N    = 66197,
    LEGION_FLAME_10H    = 68124,
    LEGION_FLAME_25N    = 68123,
    LEGION_FLAME_25H    = 68125,

    PORTAL_10N          = 66269,
    PORTAL_10H          = 67899,
    PORTAL_25N          = 67898,
    PORTAL_25H          = 67900
};

enum Says
{
    SAY_AGGRO           = -1760011,
    SAY_INICIRATE       = -1760012,
    SAY_SISTER          = -1760013,
    SAY_INFERNUS        = -1760014,
    SAY_KILLING1        = -1760015,
    SAY_KILLING2        = -1760016,
    SAY_DEATH           = -1760017
};


enum Events
{
    EVENT_NULL,

    EVENT_INICIRATE_FLESH,
    EVENT_BUFF,
    EVENT_FEL_FIREBALL,
    EVENT_FEL_LIGHTING,
    EVENT_TOUCH_OF_JARAXXUS,
    EVENT_LEGION_FLAME,
    EVENT_SUMMON_P,
    EVENT_SUMMON_V
};

#define SAY_KILLING         RAND(SAY_KILLING1, SAY_KILLING2)

#define Inicirate_Timer         urand(25000, 35000)
#define Buff_Timer              urand(40000, 45000)
#define Summon_Timer            urand(30000, 45000)
#define LegionFlame_Timer       urand(20000, 30000)
#define FelFireball_Timer       10000
#define FelLighting_Timer       22000
#define Touch_Timer             urand(27000, 30000)


struct boss_lord_jaraxxusAI : public BossAI
{
    boss_lord_jaraxxusAI(Creature* creature) : BossAI(creature, DATA_LORD_JARAXXUS)
    {
    }

    void Reset()
    {
        _Reset();
    }

    void EnterCombat(Unit* who)
    {
        if (who->GetTypeId() != TYPEID_PLAYER)
        {
            _EnterCombat();
            return;
        }

        events.ScheduleEvent(EVENT_INICIRATE_FLESH, Inicirate_Timer);
        events.ScheduleEvent(EVENT_BUFF, Buff_Timer);
        events.ScheduleEvent(EVENT_FEL_FIREBALL, FelFireball_Timer);
        events.ScheduleEvent(EVENT_FEL_LIGHTING, FelLighting_Timer);
        events.ScheduleEvent(EVENT_LEGION_FLAME, LegionFlame_Timer);
        events.ScheduleEvent(EVENT_SUMMON_V, Summon_Timer-urand(15000, 20000));
        events.ScheduleEvent(EVENT_SUMMON_P, Summon_Timer-urand(15000, 20000));
        if (getDifficulty() == RAID_DIFFICULTY_10MAN_HEROIC || getDifficulty() == RAID_DIFFICULTY_25MAN_HEROIC)
            events.ScheduleEvent(EVENT_TOUCH_OF_JARAXXUS, Touch_Timer);

        if (Aura* aura = me->AddAura(BUFF, me))
            aura->ModStackAmount(RAID_MODE(5, 10, 5, 10));

        DoScriptText(SAY_AGGRO, me);
    }

    void KilledUnit(Unit* who)
    {
        if (who->GetTypeId() == TYPEID_PLAYER)
        {
            DoScriptText(SAY_KILLING, me);
            instance->SetData(UPDATE_DEATHS_COUNT, 0);
        }
    }

    void JustDied(Unit* who)
    {
        _JustDied();
        DoScriptText(SAY_DEATH, me);
    }

    void JustReachedHome()
    {
        instance->SetData(RESET_TO_FIGHT, DATA_LORD_JARAXXUS);
    }


    void UpdateAI(const uint32 diff)
    {
        if (!UpdateVictim())
            return;
        
        if (!me->IsNonMeleeSpellCasted(true))
            me->ApplySpellImmune(0, IMMUNITY_EFFECT, SPELL_EFFECT_INTERRUPT_CAST, true);

        if (!me->IsNonMeleeSpellCasted(true))
            events.Update(diff);

        while (uint32 id = events.GetEvent())
        {
            switch (id)
            {
            case EVENT_BUFF:
                if (Aura* aura = me->GetAura(BUFF))
                    aura->ModStackAmount(aura->GetStackAmount()+RAID_MODE(5, 10, 5, 10));
                else if (Aura* aura = me->AddAura(BUFF, me))
                    aura->ModStackAmount(RAID_MODE(5, 10, 5, 10));

                events.RepeatEvent(Buff_Timer);
                break;

            case EVENT_FEL_FIREBALL:
                me->ApplySpellImmune(0, IMMUNITY_EFFECT, SPELL_EFFECT_INTERRUPT_CAST, false);
                DoCast(me->getVictim(), RAID_MODE(FEL_FIREBALL_10N, FEL_FIREBALL_25N, FEL_FIREBALL_10H, FEL_FIREBALL_25H));
                events.RepeatEvent(FelFireball_Timer);
                break;

            case EVENT_FEL_LIGHTING:
                DoCast(SelectUnit(SELECT_TARGET_RANDOM, 0), RAID_MODE(FEL_LIGHTING_10N, FEL_LIGHTING_25N, FEL_LIGHTING_10H, FEL_LIGHTING_25H));
                events.RepeatEvent(FelLighting_Timer);
                break;

            case EVENT_INICIRATE_FLESH:
                DoScriptText(SAY_INICIRATE, me);
                DoCast(SelectUnit(SELECT_TARGET_RANDOM, 0), RAID_MODE(INICIRATE_10N, INICIRATE_25N, INICIRATE_10H, INICIRATE_25H));
                events.RepeatEvent(Inicirate_Timer);
                break;

            case EVENT_LEGION_FLAME:
                DoCast(SelectUnit(SELECT_TARGET_RANDOM, 0), RAID_MODE(LEGION_FLAME_10N, LEGION_FLAME_25N, LEGION_FLAME_10H, LEGION_FLAME_25H));
                events.RepeatEvent(LegionFlame_Timer);
                break;

            case EVENT_SUMMON_V:
                DoErruptionEvent();
                events.RescheduleEvent(EVENT_SUMMON_P, Summon_Timer-10000);
                events.RepeatEvent(Summon_Timer);
                break;

            case EVENT_SUMMON_P:
                DoPortalEvent();
                events.RescheduleEvent(EVENT_SUMMON_V, Summon_Timer-10000);
                events.RepeatEvent(Summon_Timer);
                break;

            case EVENT_TOUCH_OF_JARAXXUS:
                DoCast(SelectUnit(SELECT_TARGET_RANDOM, 0), TOUCH);
                events.RepeatEvent(Touch_Timer);
                break;

            default:
                events.PopEvent();
            }
        }


        DoMeleeAttackIfReady();
    }


    void DoErruptionEvent()
    {
        DoScriptText(SAY_INFERNUS, me);
        float x = 0, y = 0, z = 0;
        SelectUnit(SELECT_TARGET_RANDOM, 0)->GetClosePoint(x, y, z, 1, 20);
        if (x && y && z)
            me->CastSpell(x, y, z, RAID_MODE(ERRUPTION_10N, ERRUPTION_25N, ERRUPTION_10H, ERRUPTION_25H), false);//summon vulcan
    }

    void DoPortalEvent()
    {
        DoScriptText(SAY_SISTER, me);
        float x = 0, y = 0, z = 0;
        
        SelectUnit(SELECT_TARGET_RANDOM, 0)->GetClosePoint(x, y, z, 1, 20);
        if (x && y && z)
            me->CastSpell(x, y, z, RAID_MODE(PORTAL_10N, PORTAL_25N, PORTAL_10H, PORTAL_25H), false);//summon portal
    }
};

CreatureAI* GetAI_boss_lord_jaraxxus(Creature* creature)
{
    return new boss_lord_jaraxxusAI(creature);
}


struct mob_jaraxxus_portalAI : public ScriptedAI
{
    mob_jaraxxus_portalAI(Creature* creature) : ScriptedAI(creature)
    {
        summon = false;
        buff = false;
        Summoning_Timer = 8500;
        creature->SetReactState(REACT_PASSIVE);
    }

    bool summon;
    bool buff;
    uint32 Summoning_Timer;

    void UpdateAI(const uint32 diff)
    {
        if (!me->GetInstanceData())
            return;

        if (!ObjectAccessor::GetCreatureOrPetOrVehicle((*me), me->GetInstanceData()->GetData64(BOSS_JARAXXUS)))
            return;

        if (!buff)
        {
            DoCast(me, 67103);
            buff = true;
        }

        if (summon && !getDifficulty() || getDifficulty() == 1) //normal 10man and normal 25man
        {
            me->ForcedDespawn(1500);
            return;
        }

        if (Summoning_Timer < diff)
        {
            summon = true;
            Summoning_Timer = 8500;
            if (getDifficulty() == 2 || getDifficulty() == 3)
                DoCast(me, 67103);
        } else Summoning_Timer -= diff;
    }
};

CreatureAI* GetAI_mob_jaraxxus_portal(Creature* creature)
{
    return new mob_jaraxxus_portalAI(creature);
}


struct mob_jaraxxus_vulcanAI : public ScriptedAI
{
    mob_jaraxxus_vulcanAI(Creature* creature) : ScriptedAI(creature)
    {
        summon = false;
        Summoning_Timer = 2000;
        count = 0;
        creature->SetReactState(REACT_PASSIVE);
    }

    bool summon;
    uint32 Summoning_Timer;
    uint8 count;

    void UpdateAI(const uint32 diff)
    {
        if (!me->GetInstanceData())
            return;

        if (!ObjectAccessor::GetCreatureOrPetOrVehicle((*me), me->GetInstanceData()->GetData64(BOSS_JARAXXUS)))
            return;

        if (summon && !getDifficulty() || getDifficulty() == 1) //normal 10man and normal 25man)
        {
            me->ForcedDespawn(1500);
            return;
        }

        if (Summoning_Timer < diff)
        {
            ++count;
            float x,y,z = 0;
            me->GetClosePoint(x, y, z, 15.0f); //summon infernal in range of 15.0f from vuclano
            ObjectAccessor::GetUnit((*me), me->GetInstanceData()->GetData64(BOSS_JARAXXUS))->CastSpell(x, y, z, 66255, false); 
            Summoning_Timer = 5000;
        } else Summoning_Timer -= diff;

        if (count >= 3) //if we have summoned 3 infernal, make longest intervale
            Summoning_Timer = 15000;
    }
};

CreatureAI* GetAI_mob_jaraxxus_vulcan(Creature* creature)
{
    return new mob_jaraxxus_vulcanAI(creature);
}


struct mob_felflame_infernalAI : public ScriptedAI
{
    mob_felflame_infernalAI(Creature* creature) : ScriptedAI(creature)
    {
    }

    uint32 channel_Timer;
    uint32 charge_Timer;

    void Reset()
    {
        channel_Timer = 5000;
        charge_Timer = 10000;
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

        if (channel_Timer < diff)
        {
            DoCast(SelectUnit(SELECT_TARGET_RANDOM, 0), 67047);
            channel_Timer = 15000;
        } else channel_Timer -= diff;

        if (charge_Timer < diff)
        {
            DoCast(SelectUnit(SELECT_TARGET_RANDOM, 0), 66494);
            charge_Timer = 25000;
        } else charge_Timer -= diff;

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_mob_felflame_infernal(Creature* creature)
{
    return new mob_felflame_infernalAI(creature);
}


struct mob_misstress_of_painAI : public ScriptedAI
{
    mob_misstress_of_painAI(Creature* creature) : ScriptedAI(creature)
    {
    }

    uint32 leep_Timer;
    uint32 whirl_Timer;
    uint32 kiss_Timer;

    void Reset()
    {
        leep_Timer = 15000;
        whirl_Timer = 10000;
        kiss_Timer = urand(10000, 20000);
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

        if (leep_Timer < diff)
        {
            DoCast(SelectUnit(SELECT_TARGET_RANDOM, 0), 66283);
            leep_Timer = 25000;
        } else leep_Timer -= diff;

        if (whirl_Timer < diff)
        {
            DoCast(me->getVictim(), RAID_MODE(66378, 67098, 67097, 67099));
            whirl_Timer = 20000;
        } else whirl_Timer -= diff;

        if (getDifficulty() == 2 || getDifficulty() == 3)
        {
            if (kiss_Timer < diff)
            {
                DoCast(SelectUnit(SELECT_TARGET_RANDOM, 0), RAID_MODE(0, 0, 67077, 67078));
                kiss_Timer = urand(10000, 20000);
            } else kiss_Timer -= diff;
        }

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_mob_misstress_of_pain(Creature* creature)
{
    return new mob_misstress_of_painAI(creature);
}


struct mob_legion_fireAI : public ScriptedAI
{
    mob_legion_fireAI(Creature* creature) : ScriptedAI(creature)
    {
        tick_Timer = 1000;
    }

    uint32 tick_Timer;

    void KilledUnit(Unit* who)
    {
        if (who->GetTypeId() == TYPEID_PLAYER && me->GetInstanceData())
            me->GetInstanceData()->SetData(UPDATE_DEATHS_COUNT, 0);
    }

    void UpdateAI(const uint32 diff)
    {
        if (!me->GetInstanceData() && !me->GetMap()->HavePlayers())
            return;

        if (tick_Timer < diff)
        {
            const Map* map = me->GetMap();
            Map::PlayerList const& list = map->GetPlayers();
            for (Map::PlayerList::const_iterator itr = list.begin(); itr != list.end(); ++itr)
            {
                Player* plr = itr->getSource();
                if (!plr || !plr->isAlive() || plr->isGameMaster()) 
                    continue;

                if (me->GetDistance2d(plr) <= 0.5f)
                {
                    //atm spell not works, skipp
                }
            }

            tick_Timer = 1000;
        } else tick_Timer -= diff;
    }
};

CreatureAI* GetAI_mob_legion_fire(Creature* creature)
{
    return new mob_legion_fireAI(creature);
}

///*=============================
void AddSC_boss_lord_jaraxxus()
{
    Script* newscript;

    newscript = new Script;
    newscript->Name = "boss_lord_jaraxxus";
    newscript->GetAI = &GetAI_boss_lord_jaraxxus;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "mob_jaraxxus_portal";
    newscript->GetAI = &GetAI_mob_jaraxxus_portal;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "mob_jaraxxus_vulcan";
    newscript->GetAI = &GetAI_mob_jaraxxus_vulcan;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "mob_felflame_infernal";
    newscript->GetAI = &GetAI_mob_felflame_infernal;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "mob_misstress_of_pain";
    newscript->GetAI = &GetAI_mob_misstress_of_pain;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "mob_legion_fire";
    newscript->GetAI = &GetAI_mob_legion_fire;
    newscript->RegisterSelf();
}
