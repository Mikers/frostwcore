/*
 * Copyright (C) 2010 Dj_Stels <djstels@mail.ru>
 *//*

#include "ScriptPCH.h"
#include "trial_of_the_crusader.h"


enum Says
{
    SAY_KILL_H1     = -1760029,
    SAY_KILL_H2     = -1760030,
    SAY_KILL_H3     = -1760031,
    SAY_KILL_H4     = -1760032,

    SAY_KILL_A1     = -1760033,
    SAY_KILL_A2     = -1760034,
    SAY_KILL_A3     = -1760035,
    SAY_KILL_A4     = -1760036,


    SAY_WIN_A       = -1760037,
    SAY_WIN_H       = -1760038
};

enum Spells
{
    TRINCKET            = 65547,

    //DRUID HEALER
    BARKSKIN            = 65860,
    NATURES_GRAPS       = 66071,
    //THORNS              = ,
    //TRANQULITY          = ,

    LIFEBLOOM_10N       = 66093,
    LIFEBLOOM_10H       = 67958,
    LIFEBLOOM_25N       = 67957,
    LIFEBLOOM_25H       = 67959,

    NOURISH_10N         = 66066,
    NOURISH_10H         = 67966,
    NOURISH_25N         = 67965,
    NOURISH_25H         = 67967,

    REGROWH_10N         = 66067,
    REGROWH_10H         = 67969,
    REGROWH_25N         = 67968,
    REGROWH_25H         = 67970,

    REVUJENATION_10N    = 66065,
    REVUJENATION_10H    = 67972,
    REVUJENATION_25N    = 67971,
    REVUJENATION_25H    = 67973,




    //PALADIN HEALER
    DIVINE_SHIELD       = 66010,
    HAND_OF_PROTECTION  = 66009,
    HAMMER_OF_JUSTICE   = 66613,

    CLEANSE_10N         = 66116,
    CLEANSE_10H         = 68622,
    CLEANSE_25N         = 68621,
    CLEANSE_25H         = 68623,

    FLASH_OF_LIGHT_10N  = 66113,
    FLASH_OF_LIGHT_10H  = 68009,
    FLASH_OF_LIGHT_25N  = 68008,
    FLASH_OF_LIGHT_25H  = 68010,

    HAND_OF_FREEDOM_10N = 66115,
    HAND_OF_FREEDOM_10H = 68757,
    HAND_OF_FREEDOM_25N = 68756,
    HAND_OF_FREEDOM_25H = 68758,

    HOLY_LIGHT_10N      = 66112,
    HOLY_LIGHT_10H      = 68012,
    HOLY_LIGHT_25N      = 68011,
    HOLY_LIGHT_25H      = 68013,

    HOLY_SHOCK_10N      = 66114,
    HOLY_SHOCK_10H      = 68015,
    HOLY_SHOCK_25N      = 68014,
    HOLY_SHOCK_25H      = 68016,


    //SHAMAN HEAL
    EARTH_SHIELD        = 66063,
    HEROISM             = 65983,
    HEX                 = 66054,

    CLEANSE_SPIRIT_10N  = 66056,
    CLEANSE_SPIRIT_10H  = 68628,
    CLEANSE_SPIRIT_25N  = 68627,
    CLEANSE_SPIRIT_25H  = 68629,

    EARTH_SHOCK_10N     = 65973,
    EARTH_SHOCK_10H     = 68101,
    EARTH_SHOCK_25N     = 68100,
    EARTH_SHOCK_25H     = 68102,

    LESSER_WAVE_10N     = 66055,
    LESSER_WAVE_10H     = 68116,
    LESSER_WAVE_25N     = 68115,
    LESSER_WAVE_25H     = 68117,

    RIPTIDE_10N         = 66053,
    RIPTIDE_10H         = 68119,
    RIPTIDE_25N         = 68118,
    RIPTIDE_25H         = 68120,



    //PRIEST HEALER
    PSYCHIC_SCREAM      = 65543,

    RENEW_10N           = 66177,
    RENEW_10H           = 68036,
    RENEW_25N           = 68035,
    RENEW_25H           = 68037,

    FLASH_HEAL_10N      = 66104,
    FLASH_HEAL_10H      = 68024,
    FLASH_HEAL_25N      = 68023,
    FLASH_HEAL_25H      = 68025,

    PENANCE_10N         = 66098,
    PENANCE_10H         = 68030,
    PENANCE_25N         = 68029,
    PENANCE_25H         = 68031,

    SHIELD_10N          = 66099,
    SHIELD_10H          = 68033,
    SHIELD_25N          = 68032,
    SHIELD_25H          = 68034,

    DISPEL_MAGIC_10N    = 65546,
    DISPEL_MAGIC_10H    = 68625,
    DISPEL_MAGIC_25N    = 68624,
    DISPEL_MAGIC_25H    = 68626,

    MANA_BURN_10N       = 66100,
    MANA_BURN_10H       = 68027,
    MANA_BURN_25N       = 68026,
    MANA_BURN_25H       = 68028,


};


#define SAY_KILL_H      RAND(SAY_KILL_H1, SAY_KILL_H2, SAY_KILL_H3, SAY_KILL_H4)
#define SAY_KILL_A      RAND(SAY_KILL_A1, SAY_KILL_A2, SAY_KILL_A3, SAY_KILL_A4)


#define REJUVENATION    RAID_MODE(REVUJENATION_10N, REVUJENATION_25N, REVUJENATION_10H, REVUJENATION_25H)
#define REGROWH         RAID_MODE(REGROWH_10N, REGROWH_25N, REGROWH_10H, REGROWH_25H)
#define LIFEBLOOM       RAID_MODE(LIFEBLOOM_10N, LIFEBLOOM_25N, LIFEBLOOM_10H, LIFEBLOOM_25H)
#define NOURISH         RAID_MODE(NOURISH_10N, NOURISH_25N, NOURISH_10H, NOURISH_25H)

#define CLEANSE         RAID_MODE(CLEANSE_10N, CLEANSE_25N, CLEANSE_10H, CLEANSE_25H)
#define HOLY_LIGHT      RAID_MODE(HOLY_LIGHT_10N, HOLY_LIGHT_25N, HOLY_LIGHT_10H, HOLY_LIGHT_25H)
#define FLASH_OF_LIGHT  RAID_MODE(FLASH_OF_LIGHT_10N, FLASH_OF_LIGHT_25N, FLASH_OF_LIGHT_10H, FLASH_OF_LIGHT_25H)
#define HOLY_SHOCK      RAID_MODE(HOLY_SHOCK_10N, HOLY_SHOCK_25N, HOLY_SHOCK_10H, HOLY_SHOCK_25H)
#define HAND_OF_FREEDOM RAID_MODE(HAND_OF_FREEDOM_10N, HAND_OF_FREEDOM_25N, HAND_OF_FREEDOM_10H, HAND_OF_FREEDOM_25H)

#define CLEASNE_SPIRIT  RAID_MODE(CLEANSE_SPIRIT_10N, CLEANSE_SPIRIT_25N, CLEASNSE_SPIRIT_10H, CLEANSE_SPIRIT_25H)
#define EARTH_SHOCK     RAID_MODE(EARTH_SHOCK_10N, EARTH_SHOCK_25N, EARTH_SHOCK_10H, EARTH_SHOCK_25H)
#define LESSER_WAVE     RAID_MODE(LESSER_WAVE_10N, LESSER_WAVE_25N, LESSER_WAVE_10H, LESSER_WAVE_25H)
#define RIPTIDE         RAID_MODE(RIPTIDE_10N, RIPTIDE_25N, RIPTIDE_10H, RIPTIDE_25H)

#define FLASH_HEAL      RAID_MODE(FLASH_HEAL_10N, FLASH_HEAL_25N, FLASH_HEAL_10H, FLASH_HEAL_25H)
#define PENANCE         RAID_MODE(PENANCE_10N, PENANCE_25N, PENANCE_10H, PENANCE_25H)
#define SHIELD          RAID_MODE(SHIELD_10N, SHIELD_25N, SHIELD_10H, SHIELD_25H)
#define DISPEL_MAGIC    RAID_MODE(DISPEL_MAGIC_10N, DISPEL_MAGIC_25N, DISPEL_MAGIC_10H, DISPEL_MAGIC_25H)
#define MANA_BUR        RAID_MODE(MANA_BURN_10N, MANA_BURN_25N, MANA_BURN_10H, MANA_BURN_25H)
#define RENEW           RAID_MODE(RENEW_10N, RENEW_25N, RENEW_10H, RENEW_25H)


typedef std::list<HostileReference*> ThreatList;

struct boss_faction_championAI : public ScriptedAI
{
    boss_faction_championAI(Creature* creature) : ScriptedAI(creature)
    {
        instance = creature->GetInstanceData();
        me->setFaction(16);
    }

    InstanceData* instance;
    std::map<uint32, uint32> cooldowns; //spell id, cooldown
    uint64 target;

    void Reset()
    {
        if (instance->GetBossState(DATA_FACTION_CHAMPIONS) != NOT_STARTED)
            instance->SetBossState(DATA_FACTION_CHAMPIONS, NOT_STARTED);
    }

    void JustReachedHome()
    {
        if (instance->GetBossState(DATA_FACTION_CHAMPIONS) != FAIL)
            instance->SetBossState(DATA_FACTION_CHAMPIONS, FAIL);
    }

    void KilledUnit(Unit* who)
    {
        uint32 team = instance->GetData(DATA_TEAM);

        if (team == ALLIANCE)
        {
            if (Creature* garrosh = ObjectAccessor::GetCreatureOrPetOrVehicle((*me), instance->GetData64(GAROSH_HELLSCREAM)))
                DoScriptText(SAY_KILL_A, garrosh);
        }
        else if (team == HORDE)
        {
            if (Creature* varian = ObjectAccessor::GetCreatureOrPetOrVehicle((*me), instance->GetData64(WARIAN_VRYNN)))
                DoScriptText(SAY_KILL_H, varian);
        }
    }


    void JustDied(Unit* who)
    {
        bool noOneAlive = true;

        for (int i = BOSS_CHAMPION_DK; i <= BOSS_CHAMPION_WAREK; ++i)
        {
            Creature* champion = ObjectAccessor::GetCreatureOrPetOrVehicle((*me), instance->GetData64(i));
            if (champion && champion->GetGUID() != me->GetGUID() && champion->isAlive())
                noOneAlive = false;
        }

        if (noOneAlive)
        {
            uint32 team = instance->GetData(DATA_TEAM);

            if (team == HORDE)
            {
                if (Creature* garrosh = ObjectAccessor::GetCreatureOrPetOrVehicle((*me), instance->GetData64(GAROSH_HELLSCREAM)))
                    DoScriptText(SAY_WIN_H, garrosh);
            }
            else if (team == ALLIANCE)
            {
                if (Creature* varian = ObjectAccessor::GetCreatureOrPetOrVehicle((*me), instance->GetData64(WARIAN_VRYNN)))
                    DoScriptText(SAY_WIN_A, varian);
            }

            instance->SetBossState(DATA_FACTION_CHAMPIONS, DONE);

            //summon Champions' Chace at center of the arena
            me->SummonGameObject(GO_CACHE, 563.800964, 140.557205, 393.957205, 4.700161, 0, 0, 0, 0, 0);
        }
    }




    uint32 GetCooldownForSpell(uint32 spellid)
    {
        if (cooldowns.empty())
            return 0;

        for (std::map<uint32, uint32>::const_iterator itr = cooldowns.begin(); itr != cooldowns.end(); ++itr)
        {
            if (itr->first == spellid)
                return itr->second;
        }

        return 0;
    }

    bool AddCooldown(uint32 spellid, uint32 cooldown)
    {
        std::map<uint32, uint32>::const_iterator itr = cooldowns.find(spellid);
        if (itr == cooldowns.end() && 0 != cooldown)
        {
            cooldowns.insert(std::make_pair(spellid, cooldown));
            return true;
        }
        else
            return false;
    }

    void UpdateCooldowns(const uint32 diff)
    {
        if (cooldowns.empty())
            return;

        std::map<uint32, uint32>::iterator itr = cooldowns.begin();

        while (itr != cooldowns.end())
        {
            if (itr->second > diff)
            {
                itr->second -= diff;
                ++itr;
            }
            else
            {
                std::map<uint32, uint32>::iterator next = itr;
                ++next;

                cooldowns.erase(itr);
                itr = next;
            }
        }
    }

    bool HasCooldown(uint32 spellid)
    {
        if (cooldowns.empty())
            return false;

        std::map<uint32, uint32>::const_iterator itr = cooldowns.find(spellid);
        if (itr == cooldowns.end())
            return false;
        else
            return true;
    }

    inline void AddGlobalCooldown()
    {
        cooldowns.insert(std::make_pair(1, 1000));
    }

    bool GlobalCooldown()
    {
        std::map<uint32, uint32>::const_iterator itr = cooldowns.find(1);
        if (itr == cooldowns.end())
            return false;
        else
            return true;
    }
};



struct toc_champion_healerAI : public boss_faction_championAI
{
    toc_champion_healerAI(Classes class_id, Creature* creature) : boss_faction_championAI(creature), m_class(class_id)
    { }

    Classes m_class;

    std::map<uint32, uint64> targets; //spell id, targets guid
    uint64 target;
    uint32 spell;
    uint32 cooldown;

    uint32 mp5_Timer;
    uint32 move_Timer;

    void AttackStart(Unit* who)
    {
        return;
    }

    void EnterCombat(Unit* who)
    {
        target = 0;
        spell = 0;
        cooldown = 0;

        mp5_Timer = 5000;
        move_Timer = 10000;

        if (!instance->GetBossState(DATA_FACTION_CHAMPIONS) != IN_PROGRESS)
            instance->SetBossState(DATA_FACTION_CHAMPIONS, IN_PROGRESS);

        DoZoneInCombat();

        for (int i = BOSS_CHAMPION_DK; i <= BOSS_CHAMPION_WAREK; ++i)
        {
            Creature* champion = ObjectAccessor::GetCreatureOrPetOrVehicle((*me), instance->GetData64(i));
            if (champion && champion->GetGUID() != me->GetGUID() && champion->isAlive() && !champion->getVictim())
                champion->AI()->AttackStart(SelectUnit(SELECT_TARGET_RANDOM, 0));
        }

        if (m_class == CLASS_SHAMAN && !me->HasAura(EARTH_SHIELD) && !HasCooldown(EARTH_SHIELD))
        {
            DoCast(me, EARTH_SHIELD);
            AddCooldown(EARTH_SHIELD, urand(15000, 30000));
            AddGlobalCooldown();
        }

        if (m_class == CLASS_PRIEST && !me->HasAura(SHIELD) && !HasCooldown(SHIELD))
        {
            DoCast(me, SHIELD);
            AddCooldown(SHIELD, urand(15000, 30000));
            AddGlobalCooldown();
        }
    }

    void DamageTaken(Unit* who, uint32& damage)
    {
        if (damage > urand(5000, 7000))
        {
            if (!me->hasUnitState(UNIT_STAT_CASTING))
                me->GetMotionMaster()->MoveFleeing(who);
        }

        if (GlobalCooldown())
            return;

        if ((me->hasUnitState(UNIT_STAT_STUNNED) || HealthBelowPct(30)) && !HasCooldown(TRINCKET))
        {
            if (getDifficulty() != RAID_DIFFICULTY_10MAN_HEROIC && getDifficulty() != RAID_DIFFICULTY_25MAN_HEROIC)
                return;

            DoCast(me, TRINCKET);
            AddCooldown(TRINCKET, 120000);
            return;
        }


        if (m_class == CLASS_DRUID && (me->hasUnitState(UNIT_STAT_STUNNED) || HealthBelowPct(30)) && !HasCooldown(BARKSKIN))
        {
            DoCast(me, BARKSKIN);
            AddCooldown(BARKSKIN, 60000);
            AddGlobalCooldown();
            return;
        }

        if (m_class == CLASS_PALADIN && HealthBelowPct(7) && !me->HasAura(DIVINE_SHIELD))
        {
            if (!HasCooldown(DIVINE_SHIELD) && !me->HasAura(HAND_OF_PROTECTION))
            {
                DoCast(me, DIVINE_SHIELD);
                AddCooldown(DIVINE_SHIELD, 300000);
                AddGlobalCooldown();
                return;
            }
            else if (!HasCooldown(HAND_OF_PROTECTION))
            {
                DoCast(me, HAND_OF_PROTECTION);
                AddCooldown(HAND_OF_PROTECTION, 300000);
                AddGlobalCooldown();
                return;
            }
        }

        if (m_class == CLASS_PALADIN && me->hasUnitState(UNIT_STAT_CONFUSED) && !HasCooldown(HAND_OF_FREEDOM))
        {
            DoCast(me, HAND_OF_FREEDOM);
            AddCooldown(HAND_OF_FREEDOM, 15000);
            AddGlobalCooldown();
            return;
        }

        if (m_class == CLASS_SHAMAN && !me->HasAura(EARTH_SHIELD) && !HasCooldown(EARTH_SHIELD))
        {
            DoCast(me, EARTH_SHIELD);
            AddCooldown(EARTH_SHIELD, urand(15000, 30000));
            AddGlobalCooldown();
        }

        if (m_class == CLASS_SHAMAN && damage > urand(5000, 8000) && !HasCooldown(HEX))
        {
            if (!spell && !target)
            {
                spell = HEX;
                target = who->GetGUID();
            }
        }

        if (m_class == CLASS_PRIEST && damage > urand(5000, 8000) && !HasCooldown(PSYCHIC_SCREAM))
        {
            SpellEntry const* spellinfo = GetSpellStore()->LookupEntry(PSYCHIC_SCREAM);
            SpellRangeEntry const* spellrange = sSpellRangeStore.LookupEntry(spellinfo->rangeIndex);
            float range = me->GetSpellMaxRangeForTarget(who, spellrange)-5;
            if (me->GetDistance2d(who) <= range)
            {
                DoCast(me, PSYCHIC_SCREAM);
                AddCooldown(PSYCHIC_SCREAM, 30000);
                AddGlobalCooldown();
            }
        }

        if (m_class == CLASS_PRIEST && !me->HasAura(SHIELD) && !HasCooldown(SHIELD))
        {
            DoCast(me, SHIELD);
            AddCooldown(SHIELD, urand(15000, 30000));
            AddGlobalCooldown();
        }
    }

    void UpdateAI(const uint32 diff)
    {
        if (!UpdateVictim())
            return;

        if (mp5_Timer < diff)
        {
            uint32 gainmana = me->GetMaxPower(POWER_MANA)*urand(3,5)/100; //3-5% mana every 5s
            me->SetPower(POWER_MANA, gainmana+me->GetPower(POWER_MANA) > me->GetMaxPower(POWER_MANA) ? me->GetMaxPower(POWER_MANA) : gainmana);

            mp5_Timer = 5000;
        } else mp5_Timer -= diff;

        UpdateCooldowns(diff);
        UpdateTargets();

        //if we are casting spell end here
        if (me->hasUnitState(UNIT_STAT_CASTING))
            return;

        if (move_Timer)
        {
            me->GetMotionMaster()->MoveRandom(10);
            move_Timer = 10000;
        } else move_Timer -= diff;


        if (target && spell)
        {
            if (Unit* pTarget = ObjectAccessor::GetUnit((*me), target))
            {
                if (pTarget == me)
                {
                    DoCast(me, spell);

                    //if spellcooldown != 0, use spellcooldown as cooldown, if is == 0, check recovery time, if == 0 too, use rand 10-15s
                    AddCooldown(spell,
                        cooldown == 0 ?
                            (GetSpellStore()->LookupEntry(spell)->RecoveryTime == 0 ?
                                urand(10000, 15000) : GetSpellStore()->LookupEntry(spell)->RecoveryTime)
                            : cooldown);

                    AddGlobalCooldown();
                    spell = 0;
                    target = 0;
                    cooldown = 0;
                    return;
                }

                if (SpellEntry const* spellinfo = GetSpellStore()->LookupEntry(spell))
                {
                    if (SpellRangeEntry const* srange = sSpellRangeStore.LookupEntry(spellinfo->rangeIndex))
                    {
                        if (me->GetDistance2d(pTarget) < me->GetSpellMaxRangeForTarget(pTarget, srange)-5 && !GlobalCooldown())
                        {
                            me->StopMoving();

                            DoCast(pTarget, spell);

                            AddCooldown(spell,
                                cooldown == 0 ?
                                (spellinfo->RecoveryTime == 0 ? urand(10000, 15000) : spellinfo->RecoveryTime) : cooldown);

                            AddGlobalCooldown();
                            spell = 0;
                            target = 0;
                            cooldown = 0;
                            return;
                        }
                        else
                            me->GetMotionMaster()->MoveChase(pTarget);
                    }//end if (range)
                    else if (!GlobalCooldown())
                    {
                        me->StopMoving();

                        DoCast(pTarget, spell);

                        AddCooldown(spell,
                                cooldown == 0 ?
                                (spellinfo->RecoveryTime == 0 ? urand(10000, 15000) : spellinfo->RecoveryTime) : cooldown);

                        AddGlobalCooldown();
                        spell = 0;
                        target = 0;
                        cooldown = 0;
                        return;
                    }
                }//end if (spell)
            }
        }

        if (!GlobalCooldown() && (!spell || !target))
        {
            if (m_class == CLASS_DRUID)
            {
                //first we try to cast lifebloom (5% hp), next regrowh (25% hp), nourish (60%) and at last rejuvenation (85%)
                if (!HasCooldown(LIFEBLOOM) && (target = GetTarget(LIFEBLOOM)))
                {
                    spell = LIFEBLOOM;
                    return;
                }

                if (!HasCooldown(REGROWH) && (target = GetTarget(REGROWH)))
                {
                    spell = REGROWH;
                    return;
                }

                if (!HasCooldown(NOURISH) && (target = GetTarget(NOURISH)))
                {
                    spell = NOURISH;
                    return;
                }

                if (!HasCooldown(REJUVENATION) && (target = GetTarget(REJUVENATION)))
                {
                    spell = REJUVENATION;
                    return;
                }
            }
            else if (m_class == CLASS_PALADIN)
            {
                if (!HasCooldown(HOLY_SHOCK) && (target = GetTarget(HOLY_SHOCK)))
                {
                    spell = HOLY_SHOCK;
                    cooldown = 6000;
                    return;
                }

                if (!HasCooldown(HOLY_LIGHT) && (target = GetTarget(HOLY_LIGHT)))
                {
                    spell = HOLY_LIGHT;
                    return;
                }

                if (!HasCooldown(FLASH_OF_LIGHT) && (target = GetTarget(FLASH_OF_LIGHT)))
                {
                    spell = FLASH_OF_LIGHT;
                    return;
                }
            }
            else if (m_class == CLASS_SHAMAN)
            {
                if (!HasCooldown(LESSER_WAVE) && (target = GetTarget(LESSER_WAVE)))
                {
                    spell = LESSER_WAVE;
                    return;
                }

                if (!HasCooldown(RIPTIDE) && (target = GetTarget(RIPTIDE)))
                {
                    spell = RIPTIDE;
                    return;
                }
            }
            else if (m_class == CLASS_PRIEST)
            {
                if (!HasCooldown(PENANCE) && (target = GetTarget(PENANCE)))
                {
                    spell = PENANCE;
                    cooldown = 5000;
                    return;
                }

                if (!HasCooldown(SHIELD) && (target = GetTarget(SHIELD)))
                {
                    spell = SHIELD;
                    cooldown = 15000;
                    return;
                }

                if (!HasCooldown(FLASH_HEAL) && (target = GetTarget(FLASH_HEAL)))
                {
                    spell = FLASH_HEAL;
                    return;
                }

                if (!HasCooldown(RENEW) && (target = GetTarget(RENEW)))
                {
                    spell = RENEW;
                    return;
                }
            }

        }//end if (!global cooldown)

    }//~~END UPDATE AI


    void UpdateTargets()
    {
        targets.clear();

        for (int i = BOSS_CHAMPION_DK; i <= BOSS_CHAMPION_WAREK; ++i)
        {
            Creature* champion = ObjectAccessor::GetCreatureOrPetOrVehicle((*me), instance->GetData64(i));
            if (!champion || !champion->isAlive())
                continue;

            //loading for druid healer
            if (m_class == CLASS_DRUID)
            {
                if ((champion->GetHealth()*100/champion->GetMaxHealth() <= 85 && champion->GetHealth()*100/champion->GetMaxHealth() > 60) && !champion->HasAura(REJUVENATION))
                    targets.insert(std::make_pair(REJUVENATION, champion->GetGUID()));

                if ((champion->GetHealth()*100/champion->GetMaxHealth() <= 60 && champion->GetHealth()*100/champion->GetMaxHealth() > 25) && (champion->HasAura(REJUVENATION) || champion->HasAura(REGROWH)))
                    targets.insert(std::make_pair(NOURISH, champion->GetGUID()));

                if (champion->GetHealth()*100/champion->GetMaxHealth() <= 25)
                    targets.insert(std::make_pair(REGROWH, champion->GetGUID()));

                if (champion->GetHealth()*100/champion->GetMaxHealth() <= 10 && !(champion->GetAura(LIFEBLOOM) && champion->GetAura(LIFEBLOOM)->GetStackAmount() < 3))
                    targets.insert(std::make_pair(LIFEBLOOM, champion->GetGUID()));
            }

            //loading for paladin healer
            if (m_class == CLASS_PALADIN)
            {
                if (champion->GetHealth()*100/champion->GetMaxHealth() <= 85 && champion->GetHealth()*100/champion->GetMaxHealth() > 40)
                    targets.insert(std::make_pair(FLASH_OF_LIGHT, champion->GetGUID()));

                if (champion->GetHealth()*100/champion->GetMaxHealth() <= 40)
                    targets.insert(std::make_pair(HOLY_LIGHT, champion->GetGUID()));

                if (champion->GetHealth()*100/champion->GetMaxHealth() <= 50)
                    targets.insert(std::make_pair(HOLY_SHOCK, champion->GetGUID()));
            }


            //loading for shaman healer
            if (m_class == CLASS_SHAMAN)
            {
                if (champion->GetHealth()*100/champion->GetMaxHealth() <= 90 && champion->GetHealth()*100/champion->GetMaxHealth() > 80)
                    targets.insert(std::make_pair(RIPTIDE, champion->GetGUID()));

                if (champion->GetHealth()*100/champion->GetMaxHealth() <= 80)
                    targets.insert(std::make_pair(LESSER_WAVE, champion->GetGUID()));

                if (champion->GetHealth()*100/champion->GetMaxHealth() <= 15 && !me->HasAura(HEROISM) && !HasCooldown(HEROISM))
                {
                    DoCast(me, HEROISM);
                    AddCooldown(HEROISM, 300000);
                    AddGlobalCooldown();
                }
            }


            //loading for priest healer
            if (m_class == CLASS_PRIEST)
            {
                if (champion->GetHealth()*100/champion->GetMaxHealth() <= 90 && !champion->HasAura(RENEW))
                    targets.insert(std::make_pair(RENEW, champion->GetGUID()));

                if (champion->GetHealth()*100/champion->GetMaxHealth() <= 80)
                {
                    if (!champion->HasAura(SHIELD))
                        targets.insert(std::make_pair(SHIELD, champion->GetGUID()));

                    if (champion->GetHealth()*100/champion->GetMaxHealth() > 40)
                        targets.insert(std::make_pair(SHIELD, champion->GetGUID()));
                    else
                        targets.insert(std::make_pair(PENANCE, champion->GetGUID()));
                }
            }
        }
    }

    uint64 GetTarget(uint32 spellid)
    {
        if (targets.empty())
            return 0;

        std::vector<uint64> cele;
        uint64 cel = 0;

        for (std::map<uint32, uint64>::iterator itr = targets.begin(); itr != targets.end(); ++itr)
        {
            if (itr->first == spellid)
                cele.push_back(itr->second);
        }


        if (cele.empty())
            return 0;

        uint32 minHealth = ObjectAccessor::GetCreatureOrPetOrVehicle((*me), cele[0])->GetHealth();
        cel = cele[0];

        for (int i = 0; i<cele.size(); ++i)
        {
            if (ObjectAccessor::GetCreatureOrPetOrVehicle((*me), cele[i])->GetHealth() < minHealth)
            {
                minHealth = ObjectAccessor::GetCreatureOrPetOrVehicle((*me), cele[i])->GetHealth();
                cel = cele[i];
            }
        }

        return cel;
    }
};

struct toc_champion_melee_dpsAI : public boss_faction_championAI
{
    toc_champion_melee_dpsAI(Classes class_id, Creature* creature) : boss_faction_championAI(creature), m_class(class_id)
    { }

    Classes m_class;

    uint64 target;
    uint32 spell;

    void EnterCombat(Unit* who)
    {
        if (!instance->GetBossState(DATA_FACTION_CHAMPIONS) != IN_PROGRESS)
            instance->SetBossState(DATA_FACTION_CHAMPIONS, IN_PROGRESS);

        DoZoneInCombat();

        for (int i = BOSS_CHAMPION_DK; i <= BOSS_CHAMPION_WAREK; ++i)
        {
            Creature* champion = ObjectAccessor::GetCreatureOrPetOrVehicle((*me), instance->GetData64(i));
            if (champion && champion->GetGUID() != me->GetGUID() && champion->isAlive() && !champion->getVictim())
                champion->AI()->AttackStart(SelectUnit(SELECT_TARGET_RANDOM, 0));
        }
    }


    void DamageTaken(Unit* who, uint32& damage)
    {
        if (GlobalCooldown())
            return;

        if ((me->hasUnitState(UNIT_STAT_STUNNED) || HealthBelowPct(30)) && !HasCooldown(TRINCKET))
        {
            if (getDifficulty() != RAID_DIFFICULTY_10MAN_HEROIC && getDifficulty() != RAID_DIFFICULTY_25MAN_HEROIC)
                return;

            DoCast(me, TRINCKET);
            AddCooldown(TRINCKET, 120000);
            return;
        }
    }

    void UpdateAI(const uint32 diff)
    {
        if (!UpdateVictim())
            return;

        UpdateCooldowns(diff);
        UpdateTarget();


        DoMeleeAttackIfReady();
    }


    void UpdateTarget()
    {
        uint32 maxattackers = 0;
        ThreatList const& list = me->getThreatManager().getThreatList();
        for (ThreatList::const_iterator itr = list.begin(); itr != list.end(); ++itr)
        {
            uint32 actual = 0;

            Unit* player = ObjectAccessor::GetUnit((*me), (*itr)->getUnitGuid());
            if (!player || !player->isAlive() || player->GetTypeId() != TYPEID_PLAYER)
                continue;

            for (int i = BOSS_CHAMPION_DK; i <= BOSS_CHAMPION_WAREK; ++i)
            {
                Creature* champion = ObjectAccessor::GetCreatureOrPetOrVehicle((*me), instance->GetData64(i));
                if (!champion || !champion->isAlive())
                    continue;

                if (champion->isAttackingPlayer() && champion->getVictim() == player)
                    ++actual;
            }//end for (champions)

            if (actual > maxattackers && actual >= 3)
            {
                maxattackers = actual;
                target = player->GetGUID();
            }
        }//end for (threat list)

        if (!maxattackers)
            me->AI()->AttackStart(SelectUnit(SELECT_TARGET_RANDOM, 0));
    }
};

struct toc_champion_range_dpsAI : public boss_faction_championAI
{
    toc_champion_range_dpsAI(Classes class_id, Creature* creature) : boss_faction_championAI(creature), m_class(class_id)
    { }

    Classes m_class;

    void EnterCombat(Unit* who)
    {
        if (!instance->GetBossState(DATA_FACTION_CHAMPIONS) != IN_PROGRESS)
            instance->SetBossState(DATA_FACTION_CHAMPIONS, IN_PROGRESS);

        DoZoneInCombat();

        for (int i = BOSS_CHAMPION_DK; i <= BOSS_CHAMPION_WAREK; ++i)
        {
            Creature* champion = ObjectAccessor::GetCreatureOrPetOrVehicle((*me), instance->GetData64(i));
            if (champion && champion->GetGUID() != me->GetGUID() && champion->isAlive() && !champion->getVictim())
                champion->AI()->AttackStart(SelectUnit(SELECT_TARGET_RANDOM, 0));
        }
    }

    void UpdateAI(const uint32 diff)
    {
        if (!UpdateVictim())
            return;

        UpdateCooldowns(diff);
    }
};





CreatureAI* GetAI_boss_champion_druid_healer(Creature* creature)
{
    return new toc_champion_healerAI(CLASS_DRUID, creature);
}

CreatureAI* GetAI_boss_champion_paladin_healer(Creature* creature)
{
    return new toc_champion_healerAI(CLASS_PALADIN, creature);
}

CreatureAI* GetAI_boss_champion_priest_healer(Creature* creature)
{
    return new toc_champion_healerAI(CLASS_PRIEST, creature);
}

CreatureAI* GetAI_boss_champion_shaman_healer(Creature* creature)
{
    return new toc_champion_healerAI(CLASS_SHAMAN, creature);
}



CreatureAI* GetAI_boss_champion_death_knight(Creature* creature)
{
    return new toc_champion_melee_dpsAI(CLASS_DEATH_KNIGHT, creature);
}

CreatureAI* GetAI_boss_champion_paladin_dps(Creature* creature)
{
    return new toc_champion_melee_dpsAI(CLASS_PALADIN, creature);
}

CreatureAI* GetAI_boss_champion_rogue(Creature* creature)
{
    return new toc_champion_melee_dpsAI(CLASS_ROGUE, creature);
}

CreatureAI* GetAI_boss_champion_shaman_dps(Creature* creature)
{
    return new toc_champion_melee_dpsAI(CLASS_SHAMAN, creature);
}

CreatureAI* GetAI_boss_champion_warrior(Creature* creature)
{
    return new toc_champion_melee_dpsAI(CLASS_WARRIOR, creature);
}



CreatureAI* GetAI_boss_champion_druid_dps(Creature* creature)
{
    return new toc_champion_range_dpsAI(CLASS_DRUID, creature);
}

CreatureAI* GetAI_boss_champion_mage(Creature* creature)
{
    return new toc_champion_range_dpsAI(CLASS_MAGE, creature);
}

CreatureAI* GetAI_boss_champion_hunter(Creature* creature)
{
    return new toc_champion_range_dpsAI(CLASS_HUNTER, creature);
}

CreatureAI* GetAI_boss_champion_priest_dps(Creature* creature)
{
    return new toc_champion_range_dpsAI(CLASS_PRIEST, creature);
}

CreatureAI* GetAI_boss_champion_warlock(Creature* creature)
{
    return new toc_champion_range_dpsAI(CLASS_WARLOCK, creature);
}




void AddSC_boss_faction_champions()
{
    Script* newscript;

    //DK
    newscript = new Script;
    newscript->Name = "boss_champion_death_knight";
    newscript->GetAI = &GetAI_boss_champion_death_knight;
    newscript->RegisterSelf();

    //DRUID BALANCE
    newscript = new Script;
    newscript->Name = "boss_champion_druid_dps";
    newscript->GetAI = &GetAI_boss_champion_druid_dps;
    newscript->RegisterSelf();

    //DRUID HEALER
    newscript = new Script;
    newscript->Name = "boss_champion_druid_healer";
    newscript->GetAI = &GetAI_boss_champion_druid_healer;
    newscript->RegisterSelf();

    //PALADIN DPS
    newscript = new Script;
    newscript->Name = "boss_champion_paladin_dps";
    newscript->GetAI = &GetAI_boss_champion_paladin_dps;
    newscript->RegisterSelf();

    //PALADIN HOLY
    newscript = new Script;
    newscript->Name = "boss_champion_paladin_healer";
    newscript->GetAI = &GetAI_boss_champion_paladin_healer;
    newscript->RegisterSelf();

    //MAGE
    newscript = new Script;
    newscript->Name = "boss_champion_mage";
    newscript->GetAI = &GetAI_boss_champion_mage;
    newscript->RegisterSelf();

    //HUNTER
    newscript = new Script;
    newscript->Name = "boss_champion_hunter";
    newscript->GetAI = &GetAI_boss_champion_hunter;
    newscript->RegisterSelf();

    //RESTO SHAMAN
    newscript = new Script;
    newscript->Name = "boss_champion_shaman_healer";
    newscript->GetAI = &GetAI_boss_champion_shaman_healer;
    newscript->RegisterSelf();

    //ENH SHAMAN
    newscript = new Script;
    newscript->Name = "boss_champion_shaman_dps";
    newscript->GetAI = &GetAI_boss_champion_shaman_dps;
    newscript->RegisterSelf();

    //WARLOCK
    newscript = new Script;
    newscript->Name = "boss_champion_warlock";
    newscript->GetAI = &GetAI_boss_champion_warlock;
    newscript->RegisterSelf();

    //WARRIOR
    newscript = new Script;
    newscript->Name = "boss_champion_warrior";
    newscript->GetAI = &GetAI_boss_champion_warrior;
    newscript->RegisterSelf();

    //ROUGE
    newscript = new Script;
    newscript->Name = "boss_champion_rogue";
    newscript->GetAI = &GetAI_boss_champion_rogue;
    newscript->RegisterSelf();

    //SHADOW PRIEST
    newscript = new Script;
    newscript->Name = "boss_champion_priest_dps";
    newscript->GetAI = &GetAI_boss_champion_priest_dps;
    newscript->RegisterSelf();

    //HOLY PRIEST
    newscript = new Script;
    newscript->Name = "boss_champion_priest_healer";
    newscript->GetAI = &GetAI_boss_champion_priest_healer;
    newscript->RegisterSelf();
}*/







///HORDE CHAMPIONS
#include "ScriptPCH.h"
#include "trial_of_the_crusader.h"

#define    SPELL_PVP_TRINKET                65547 

/********************************/
/* Gorgrim Shadowcleave - 34458 */
/* Death Knight                 */
/********************************/

#define    SPELL_CHAINS_OF_ICE                66020
#define    SPELL_DEATH_GRIG                66017
#define    SPELL_ICEBOUND_FORTITUDE        66023
#define    SPELL_STRANGULATE                66018
/*
#define    SPELL_DEATH_COIL_10N            66019 
#define    SPELL_DEATH_COIL_10H            67930 
#define    SPELL_DEATH_COIL_25N            67929
#define    SPELL_DEATH_COIL_25H            67931
#define    SPELL_FROST_STRIKE_10N            66047 
#define    SPELL_FROST_STRIKE_10H            67936 
#define    SPELL_FROST_STRIKE_25N            67935
#define    SPELL_FROST_STRIKE_25H            67937
#define    SPELL_ICY_TOUCH_10N                66021
#define    SPELL_ICY_TOUCH_10H                67939
#define    SPELL_ICY_TOUCH_25N                67938
#define    SPELL_ICY_TOUCH_25H                67940
*/
#define    SPELL_DEATH_COIL                RAID_MODE(66019,67929,67930,67931)
#define    SPELL_FROST_STRIKE                RAID_MODE(66047,67935,67936,67937)
#define    SPELL_ICY_TOUCH                    RAID_MODE(66021,67938,67939,67940)

struct boss_gorgrim_shadowcleaveAI : public ScriptedAI
{
    boss_gorgrim_shadowcleaveAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
    }

    ScriptedInstance* m_pInstance;
    bool m_bIsRegularMode;
    bool IsHeroic;
    //uint32 m_uiPvPTrinket_Timer;
    uint32 m_uiChainsofIce_Timer;
    uint32 m_uiDeathGrip_Timer;
    uint32 m_uiIceboundFortitude_Timer;
    uint32 m_uiStrangulate_Timer;
    uint32 m_uiDeathCoil_Timer;
    uint32 m_uiFrostStrike_Timer;
    uint32 m_uiIcyTouch_Timer;

    void Reset()
    {
        me->SetRespawnDelay(1);
        //m_uiPvPTrinket_Timer = 12000;
        m_uiChainsofIce_Timer = 20000;
        m_uiDeathGrip_Timer = 5000;
        m_uiIceboundFortitude_Timer = 15000;
        m_uiDeathCoil_Timer = 10000;
        m_uiStrangulate_Timer = 30000;
        m_uiFrostStrike_Timer = 8000;
        m_uiIcyTouch_Timer = 25000;
    }

    void Aggro(Unit* pWho)
    {
        if (!m_pInstance)
            return;

        if (m_pInstance->GetBossState(DATA_FACTION_CHAMPIONS) == DONE)
            me->ForcedDespawn();
        else
            m_pInstance->SetBossState(DATA_FACTION_CHAMPIONS, IN_PROGRESS);
    }

    void JustDied(Unit* pKiller)
    {
        if(!m_pInstance)
            return;

        if(!me->FindNearestCreature(34458, 200, true)
        && !me->FindNearestCreature(34451, 200, true)
        && !me->FindNearestCreature(34459, 200, true)
        && !me->FindNearestCreature(34448, 200, true)
        && !me->FindNearestCreature(34449, 200, true)
        && !me->FindNearestCreature(34445, 200, true)
        && !me->FindNearestCreature(34456, 200, true)
        && !me->FindNearestCreature(34447, 200, true)
        && !me->FindNearestCreature(34441, 200, true)
        && !me->FindNearestCreature(34454, 200, true)
        && !me->FindNearestCreature(34455, 200, true)
        && !me->FindNearestCreature(34444, 200, true)
        && !me->FindNearestCreature(34450, 200, true)
        && !me->FindNearestCreature(34453, 200, true))
        {
                m_pInstance->SetBossState(DATA_FACTION_CHAMPIONS, DONE);
        }
    }

    void JustReachedHome()
    {
        m_pInstance->SetData(RESET_TO_FIGHT, DATA_FACTION_CHAMPIONS);
    }

    void KilledUnit(Unit* who)
    {
        if (who->GetTypeId() == TYPEID_PLAYER)
            m_pInstance->SetData(UPDATE_DEATHS_COUNT, 0);
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!UpdateVictim())
            return;
            
        /*if (m_uiPvPTrinket_Timer < uiDiff)
        {
            DoCast(me, SPELL_PVP_TRINKET);
                
            m_uiPvPTrinket_Timer = 120000;
        }
        else 
            m_uiPvPTrinket_Timer -= uiuiDiff;*/

        if (m_uiChainsofIce_Timer < uiDiff)
        {
            if (Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM,0))
                DoCast(pTarget, SPELL_CHAINS_OF_ICE);
            
            m_uiChainsofIce_Timer = 45000;
                
        }else 
            m_uiChainsofIce_Timer -= uiDiff;

        if (m_uiDeathGrip_Timer < uiDiff)
        {
            if (Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM,0))
                DoCast(pTarget, SPELL_DEATH_GRIG);
            
            m_uiDeathGrip_Timer = 45000;
        }else 
            m_uiDeathGrip_Timer -= uiDiff;

        if (m_uiIceboundFortitude_Timer < uiDiff)
        {
            DoCast(me, SPELL_ICEBOUND_FORTITUDE);
            
            m_uiIceboundFortitude_Timer = 60000;
            
        }else 
            m_uiIceboundFortitude_Timer -= uiDiff;

        if (m_uiStrangulate_Timer < uiDiff)
        {
            if (Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM,0))
                DoCast(pTarget, SPELL_STRANGULATE);
            
            m_uiStrangulate_Timer = 120000;
                
        }else 
            m_uiStrangulate_Timer -= uiDiff;

        if (m_uiDeathCoil_Timer < uiDiff)
        {
            DoCast(me->getVictim(), SPELL_DEATH_COIL);
            
            m_uiDeathCoil_Timer = 10000;
            
        }else 
            m_uiDeathCoil_Timer -= uiDiff;
        
        if (m_uiFrostStrike_Timer < uiDiff)
        {
            DoCast(me->getVictim(), SPELL_FROST_STRIKE);
            
            m_uiFrostStrike_Timer = 10000;
            
        }else 
            m_uiFrostStrike_Timer -= uiDiff;

        if (m_uiIcyTouch_Timer < uiDiff)
        {
            DoCast(me->getVictim(), SPELL_ICY_TOUCH);
                
            m_uiIcyTouch_Timer = 20000;
                
        }else 
            m_uiIcyTouch_Timer -= uiDiff;

        DoMeleeAttackIfReady();
    }

};

/****************************/
/* Birana Stormhoof - 34451 */
/* Druid    Balance               */
/****************************/

#define    SPELL_BARKSKIN                    65860
#define    SPELL_CYCLONE                    65859
#define    SPELL_ENTANGLING_ROOTS            65857
#define    SPELL_FAERIE_FIRE                65863
#define    SPELL_FORCE_OF_NATURE            65861
/*
#define    SPELL_INSECT_SWARM_10N            65855
#define    SPELL_INSECT_SWARM_10H            67942
#define    SPELL_INSECT_SWARM_25N            67941 
#define    SPELL_INSECT_SWARM_25H            67943
#define    SPELL_MOONFIRE_10N                65856 
#define    SPELL_MOONFIRE_10H                67945
#define    SPELL_MOONFIRE_25N                67944 
#define    SPELL_MOONFIRE_25H                67946
#define    SPELL_STARFIRE_10N                65854 
#define    SPELL_STARFIRE_10H                67948
#define    SPELL_STARFIRE_25N                67947 
#define    SPELL_STARFIRE_25H                67949
#define    SPELL_WRATH_10N                    65862 
#define    SPELL_WRATH_10H                    67952
#define    SPELL_WRATH_25N                    67951 
#define    SPELL_WRATH_25H                     67953
*/
#define    SPELL_WRATH                        RAID_MODE(65862,67951,67952,67953)
#define    SPELL_STARFIRE                    RAID_MODE(65854,67947,67948,67949)
#define    SPELL_MOONFIRE                    RAID_MODE(65856,67944,67945,67946)
#define    SPELL_INSECT_SWARM                RAID_MODE(65855,67941,67942,67943)

struct boss_birana_stormhoofAI : public ScriptedAI
{
    boss_birana_stormhoofAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
    }

    ScriptedInstance* m_pInstance;
    bool m_bIsRegularMode;
    uint32 m_uiBarkskin_Timer;
    uint32 m_uiCyclone_Timer;
    uint32 m_uiEntanglingRoots_Timer;
    //uint32 m_uiPvPTrinket_Timer;
    uint32 m_uiFaerieFire_Timer;
    uint32 m_uiForceofNature_Timer;
    uint32 m_uiInsectSwarm_Timer;
    uint32 m_uiMoonfire_Timer;
    uint32 m_uiStarfire_Timer;
    uint32 m_uiWrath_Timer;

    void Reset()
    {
        me->SetRespawnDelay(1);
        m_uiBarkskin_Timer = 1000;
        m_uiCyclone_Timer = 25000;
        m_uiEntanglingRoots_Timer = 35000;
        //m_uiPvPTrinket_Timer = 12000;
        m_uiFaerieFire_Timer = 10000;
        m_uiForceofNature_Timer = 60000;
        m_uiInsectSwarm_Timer = 20000;
        m_uiMoonfire_Timer = 7000;
        m_uiStarfire_Timer = 15000;
        m_uiWrath_Timer = 28000;
    }

    void Aggro(Unit* pWho)
    {
        if (!m_pInstance)
            return;

        if (m_pInstance->GetBossState(DATA_FACTION_CHAMPIONS) == DONE)
            me->ForcedDespawn();
        else
            m_pInstance->SetBossState(DATA_FACTION_CHAMPIONS, IN_PROGRESS);
    }

    void JustDied(Unit* pKiller)
    {
        if(!m_pInstance)
            return;

        if(!me->FindNearestCreature(34458, 200, true)
        && !me->FindNearestCreature(34451, 200, true)
        && !me->FindNearestCreature(34459, 200, true)
        && !me->FindNearestCreature(34448, 200, true)
        && !me->FindNearestCreature(34449, 200, true)
        && !me->FindNearestCreature(34445, 200, true)
        && !me->FindNearestCreature(34456, 200, true)
        && !me->FindNearestCreature(34447, 200, true)
        && !me->FindNearestCreature(34441, 200, true)
        && !me->FindNearestCreature(34454, 200, true)
        && !me->FindNearestCreature(34455, 200, true)
        && !me->FindNearestCreature(34444, 200, true)
        && !me->FindNearestCreature(34450, 200, true)
        && !me->FindNearestCreature(34453, 200, true))
        {
                m_pInstance->SetBossState(DATA_FACTION_CHAMPIONS, DONE);
        }
    }

    void JustReachedHome()
    {
        m_pInstance->SetData(RESET_TO_FIGHT, DATA_FACTION_CHAMPIONS);
    }

    void KilledUnit(Unit* who)
    {
        if (who->GetTypeId() == TYPEID_PLAYER)
            m_pInstance->SetData(UPDATE_DEATHS_COUNT, 0);
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!UpdateVictim())
            return;
        
        if (m_uiFaerieFire_Timer < uiDiff)
        {
            DoCast(me->getVictim(), SPELL_FAERIE_FIRE);
            
            m_uiFaerieFire_Timer = 15000;
            
        }else 
            m_uiFaerieFire_Timer -= uiDiff;

        if (m_uiForceofNature_Timer < uiDiff)
        {
            DoCast(me->getVictim(), SPELL_FORCE_OF_NATURE);
                
            m_uiForceofNature_Timer = 60000;
                
        }else
            m_uiForceofNature_Timer -= uiDiff;
        
        if (m_uiInsectSwarm_Timer < uiDiff)
        {
            DoCast(me->getVictim(), SPELL_INSECT_SWARM);
                
            m_uiInsectSwarm_Timer = 25000;
                
        }else 
            m_uiInsectSwarm_Timer -= uiDiff;

        if (m_uiMoonfire_Timer < uiDiff)
        {
            DoCast(me->getVictim(), SPELL_MOONFIRE);
                
            m_uiMoonfire_Timer = 7000;
                
        }else 
            m_uiMoonfire_Timer -= uiDiff;
        
        if (m_uiStarfire_Timer < uiDiff)
        {
            DoCast(me->getVictim(), SPELL_STARFIRE);
                
            m_uiStarfire_Timer = 20000;
                
        }else 
            m_uiStarfire_Timer -= uiDiff;
        
        if (m_uiWrath_Timer < uiDiff)
        {
            DoCast(me->getVictim(), SPELL_WRATH);
            
            m_uiWrath_Timer = 20000;
                
        }else 
            m_uiWrath_Timer -= uiDiff;
        
        if (m_uiCyclone_Timer < uiDiff)
        {
            if (Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM,0))
                DoCast(pTarget, SPELL_CYCLONE);
                
            m_uiCyclone_Timer = 30000;
                
        }else 
            m_uiCyclone_Timer -= uiDiff;

        if (m_uiBarkskin_Timer < uiDiff)
        {
            DoCast(me, SPELL_BARKSKIN);
            
            m_uiBarkskin_Timer = 35000;
                
        }else 
            m_uiBarkskin_Timer -= uiDiff;
        
        if (m_uiEntanglingRoots_Timer < uiDiff)
        {
            DoCast(me->getVictim(), SPELL_ENTANGLING_ROOTS);
                
            m_uiEntanglingRoots_Timer = 30000;
                
        }else 
            m_uiEntanglingRoots_Timer -= uiDiff;

        /*if (m_uiPvPTrinket_Timer < uiDiff)
        {
            DoCast(me, SPELL_PVP_TRINKET);
            
            m_uiPvPTrinket_Timer = 120000;
                
        }else 
            m_uiPvPTrinket_Timer -= uiDiff;*/
        
        DoMeleeAttackIfReady();
    }
};

/*************************/
/* Erin Misthoof - 34459 */
/* Druid  Restoration               */
/*************************/

#define    SPELL_THORNS                    66068
#define SPELL_BARKSKIN                    65860
#define SPELL_NATURE_GRASP                66071
/*
#define    SPELL_NOURISH_10N                66066
#define    SPELL_NOURISH_10H                67966
#define    SPELL_NOURISH_25N                67965 
#define    SPELL_NOURISH_25H                67967
#define    SPELL_REGROWTH_10N                66067 
#define    SPELL_REGROWTH_10H                67969
#define    SPELL_REGROWTH_25N                67968
#define    SPELL_REGROWTH_25H                67970
#define    SPELL_REJUVENATION_10N            66065 
#define    SPELL_REJUVENATION_10H            67972
#define    SPELL_REJUVENATION_25N            67971 
#define    SPELL_REJUVENATION_25H            67973
#define    SPELL_TRANQUILITY_10N            66086
#define    SPELL_TRANQUILITY_10H            67975
#define    SPELL_TRANQUILITY_25N            67974 
#define    SPELL_TRANQUILITY_25H            67976
#define SPELL_LIFEBLOOM_10N                66093
#define SPELL_LIFEBLOOM_10H               67958
#define SPELL_LIFEBLOOM_25N               67957
#define SPELL_LIFEBLOOM_25H               67959
*/
#define    SPELL_NOURISH                    RAID_MODE(66066,67965,67966,67967)
#define    SPELL_REGROWTH                    RAID_MODE(66067,67968,67969,67970)
#define    SPELL_REJUVENATION                RAID_MODE(66065,67971,67972,67973)
#define    SPELL_TRANQUILITY                RAID_MODE(66086,67974,67975,67976)
#define SPELL_LIFEBLOOM                    RAID_MODE(66093,67957,67958,67959)

struct boss_erin_misthoofAI : public ScriptedAI
{
    boss_erin_misthoofAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
    }

    ScriptedInstance* m_pInstance;
    bool m_bIsRegularMode;
    //uint32 m_uiPvPTrinket_Timer;
    uint32 m_uiBarkskin_Timer;
    uint32 m_uiThorns_Timer;
    uint32 m_uiLifebloom_Timer;
    uint32 m_uiNourish_Timer;
    uint32 m_uiRegrowth_Timer;
    uint32 m_uiRejuvenation_Timer;
    uint32 m_uiTranquility_Timer;
    uint32 m_uiNatureGrasp_Timer;

    void Reset()
    {
        me->SetRespawnDelay(1);
        m_uiBarkskin_Timer = 1000;
        m_uiThorns_Timer = 3000;
        m_uiLifebloom_Timer = 5000;
        //m_uiPvPTrinket_Timer = 12000;
        m_uiNourish_Timer = 8000;
        m_uiRegrowth_Timer = 6000;
        m_uiRejuvenation_Timer = 45000;
        m_uiTranquility_Timer = 50000;
        m_uiNatureGrasp_Timer = urand(40000,80000);
    }

    void Aggro(Unit* pWho)
    {
        if (!m_pInstance)
            return;
        if (m_pInstance->GetBossState(DATA_FACTION_CHAMPIONS) == DONE)
            me->ForcedDespawn();
        else
            m_pInstance->SetBossState(DATA_FACTION_CHAMPIONS, IN_PROGRESS);
    }

    void JustDied(Unit* pKiller)
    {
        if(!m_pInstance)
            return;

        if(!me->FindNearestCreature(34458, 200, true)
        && !me->FindNearestCreature(34451, 200, true)
        && !me->FindNearestCreature(34459, 200, true)
        && !me->FindNearestCreature(34448, 200, true)
        && !me->FindNearestCreature(34449, 200, true)
        && !me->FindNearestCreature(34445, 200, true)
        && !me->FindNearestCreature(34456, 200, true)
        && !me->FindNearestCreature(34447, 200, true)
        && !me->FindNearestCreature(34441, 200, true)
        && !me->FindNearestCreature(34454, 200, true)
        && !me->FindNearestCreature(34455, 200, true)
        && !me->FindNearestCreature(34444, 200, true)
        && !me->FindNearestCreature(34450, 200, true)
        && !me->FindNearestCreature(34453, 200, true))
        {
                m_pInstance->SetBossState(DATA_FACTION_CHAMPIONS, DONE);
        }
    }

    void JustReachedHome()
    {
        m_pInstance->SetData(RESET_TO_FIGHT, DATA_FACTION_CHAMPIONS);
    }

    void KilledUnit(Unit* who)
    {
        if (who->GetTypeId() == TYPEID_PLAYER)
            m_pInstance->SetData(UPDATE_DEATHS_COUNT, 0);
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!UpdateVictim())
            return;
            
        if (m_uiBarkskin_Timer < uiDiff)
        {
            DoCast(me, SPELL_BARKSKIN);
            
            m_uiBarkskin_Timer = 35000;
            
        }else 
            m_uiBarkskin_Timer -= uiDiff;

        /*if (m_uiPvPTrinketTimer < uiDiff)
        {
            DoCast(me, SPELL_PVP_TRINKET);
            
            m_uiPvPTrinketTimer = 120000;
            
        }else 
            m_uiPvPTrinketTimer -= uiDiff;*/
        
        if (m_uiNatureGrasp_Timer < uiDiff)
        {
            DoCast(me, SPELL_NATURE_GRASP);
            
            m_uiNatureGrasp_Timer = urand(40000,80000);
            
        }else 
            m_uiNatureGrasp_Timer -= uiDiff;
        
        if (m_uiThorns_Timer < uiDiff)
        {           
            DoCast(me, SPELL_THORNS);
            
            m_uiThorns_Timer = 30000;
   
        }else 
            m_uiThorns_Timer -= uiDiff;

        if (m_uiLifebloom_Timer < uiDiff)
        {
            if(Unit* pTarget = DoSelectLowestHpFriendly(200, 1))
                DoCast(pTarget, SPELL_LIFEBLOOM);
                
            m_uiLifebloom_Timer = 10000;
                
        }else 
            m_uiLifebloom_Timer -= uiDiff;

        if (m_uiNourish_Timer < uiDiff)
        {
            if(Unit* pTarget = DoSelectLowestHpFriendly(200, 1))
                DoCast(pTarget, SPELL_NOURISH);
            
            m_uiNourish_Timer = 20000;
                
        }else 
            m_uiNourish_Timer -= uiDiff;

        if (m_uiRegrowth_Timer < uiDiff)
        {
            if(Unit* pTarget = DoSelectLowestHpFriendly(200, 1))
                DoCast(pTarget, SPELL_REGROWTH);
            
            m_uiRegrowth_Timer = 15000;
                
        }else 
            m_uiRegrowth_Timer -= uiDiff;

        if (m_uiRejuvenation_Timer < uiDiff)
        {
            if(Unit* pTarget = DoSelectLowestHpFriendly(200, 1))
                DoCast(pTarget, SPELL_REJUVENATION);
            
            m_uiRejuvenation_Timer = 45000;
            
        }else 
            m_uiRejuvenation_Timer -= uiDiff;

        if (m_uiTranquility_Timer < uiDiff)
        {
            if(Unit* pTarget = DoSelectLowestHpFriendly(200, 1))
                DoCast(pTarget, SPELL_TRANQUILITY);
            
            m_uiTranquility_Timer = 600000;
                
        }else 
            m_uiTranquility_Timer -= uiDiff;

        
        DoMeleeAttackIfReady();
    }
};

/************************/
/* Ruj'kah - 34448      */
/* Hunter               */
/************************/

#define    SPELL_DETERRENCE                65871
#define    SPELL_CALL_PET                    67777
#define    SPELL_FROST_TRAP                65880
#define    SPELL_WING_CLIP                    66207
#define    SPELL_DISENGAGE                    65869 
#define    SPELL_WYVERN_STING                65877 
#define    SPELL_STEADY_SHOT                65867
#define    SPELL_EXPLOSIVE_SHOT            RAID_MODE(65866,67983,67984,67985)
#define    SPELL_SHOOT                        RAID_MODE(65868,67988,67989,67990)
#define    SPELL_AIMED_SHOT                RAID_MODE(65883,67977,67978,67979)

struct boss_rujkahAI : public ScriptedAI
{
    boss_rujkahAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
    }

    ScriptedInstance* m_pInstance;
    bool m_bIsRegularMode;
    //uint32 m_uiPvPTrinket_Timer;
    uint32 m_uiDeterrence_Timer;
    uint32 m_uiCallPet_Timer;
    uint32 m_uiFrostTrap_Timer;
    uint32 m_uiExplosiveShot_Timer;
    uint32 m_uiAimedShot_Timer;
    uint32 m_uiWingClip_Timer;
    uint32 m_uiDisengage_Timer;
    uint32 m_uiShoot_Timer;
    uint32 m_uiWyvernSting_Timer;
    uint32 m_uiSteadyShot_Timer;
    
    void Reset()
    {
        m_uiDeterrence_Timer = 30000;
        m_uiCallPet_Timer = 1000;
        m_uiFrostTrap_Timer = 3000;
        //m_uiPvPTrinket_Timer = 12000;
        m_uiExplosiveShot_Timer = 10000;
        m_uiAimedShot_Timer = 8000;
        m_uiWingClip_Timer = 15000;
        m_uiDisengage_Timer = 30000;
        m_uiShoot_Timer = 5000;
        m_uiWyvernSting_Timer = 20000;
        m_uiSteadyShot_Timer = 7000;
    }

    void Aggro(Unit* pWho)
    {
        if (!m_pInstance)
            return;
 
        if (m_pInstance->GetBossState(DATA_FACTION_CHAMPIONS) == DONE)
            me->ForcedDespawn();
        else
            m_pInstance->SetBossState(DATA_FACTION_CHAMPIONS, IN_PROGRESS);
    }

    void JustDied(Unit* pKiller)
    {
        if(!m_pInstance)
            return;

        if(!me->FindNearestCreature(34458, 200, true)
        && !me->FindNearestCreature(34451, 200, true)
        && !me->FindNearestCreature(34459, 200, true)
        && !me->FindNearestCreature(34448, 200, true)
        && !me->FindNearestCreature(34449, 200, true)
        && !me->FindNearestCreature(34445, 200, true)
        && !me->FindNearestCreature(34456, 200, true)
        && !me->FindNearestCreature(34447, 200, true)
        && !me->FindNearestCreature(34441, 200, true)
        && !me->FindNearestCreature(34454, 200, true)
        && !me->FindNearestCreature(34455, 200, true)
        && !me->FindNearestCreature(34444, 200, true)
        && !me->FindNearestCreature(34450, 200, true)
        && !me->FindNearestCreature(34453, 200, true))
        {
                m_pInstance->SetBossState(DATA_FACTION_CHAMPIONS, DONE);
        }
    }

    void JustReachedHome()
    {
        m_pInstance->SetData(RESET_TO_FIGHT, DATA_FACTION_CHAMPIONS);
    }

    void KilledUnit(Unit* who)
    {
        if (who->GetTypeId() == TYPEID_PLAYER)
            m_pInstance->SetData(UPDATE_DEATHS_COUNT, 0);
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!UpdateVictim())
            return;
        
        if (m_uiDeterrence_Timer < uiDiff)
        {
            DoCast(me, SPELL_DETERRENCE);
            
            m_uiDeterrence_Timer = 90000;
                
        }else 
            m_uiDeterrence_Timer -= uiDiff;

        if (m_uiCallPet_Timer < uiDiff)
        {
            DoCast(me->getVictim(), SPELL_CALL_PET);
            
            m_uiCallPet_Timer = 600000;
                
        }else 
            m_uiCallPet_Timer -= uiDiff;

        if (m_uiFrostTrap_Timer < uiDiff)
        {
            DoCast(me->getVictim(), SPELL_FROST_TRAP);
                
            m_uiFrostTrap_Timer = 30000;
                
        }else 
            m_uiFrostTrap_Timer -= uiDiff;

        /*if (m_uiPvPTrinket_Timer < uiDiff)
        {
            DoCast(me, SPELL_PvPTrinket);
            
            m_uiPvPTrinket_Timer = 120000;
            
        }else 
            m_uiPvPTrinket_Timer -= uiDiff;*/

        if (m_uiWingClip_Timer < uiDiff)
        {
            DoCast(me->getVictim(), SPELL_WING_CLIP);
                
            m_uiWingClip_Timer = 12000;
                
        }else 
            m_uiWingClip_Timer -= uiDiff;

        if (m_uiDisengage_Timer < uiDiff)
        {
            DoCast(me, SPELL_DISENGAGE);
                
            m_uiDisengage_Timer = 30000;
                
        }else 
            m_uiDisengage_Timer -= uiDiff;

        if (m_uiWyvernSting_Timer < uiDiff)
        {
            if (Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM,0))
                DoCast(pTarget, SPELL_WYVERN_STING);
                
            m_uiWyvernSting_Timer = 60000;
                
        }else 
            m_uiWyvernSting_Timer -= uiDiff;

        if (m_uiExplosiveShot_Timer < uiDiff)
        {
            DoCast(me->getVictim(), SPELL_EXPLOSIVE_SHOT);
            
            m_uiExplosiveShot_Timer = 12000;
            
        }else 
            m_uiExplosiveShot_Timer -= uiDiff;

        if (m_uiAimedShot_Timer < uiDiff)
        {
            DoCast(me->getVictim(), SPELL_AIMED_SHOT);
                
            m_uiAimedShot_Timer = 15000;
                
        }else 
            m_uiAimedShot_Timer -= uiDiff;

        if (m_uiShoot_Timer < uiDiff)
        {
            DoCast(me->getVictim(), SPELL_SHOOT);
                
            m_uiShoot_Timer = 7000;
            
        }else 
            m_uiShoot_Timer -= uiDiff;
            
        if (m_uiSteadyShot_Timer < uiDiff)
        {
            DoCast(me->getVictim(), SPELL_STEADY_SHOT);
                
            m_uiSteadyShot_Timer = 17000;
            
        }else 
            m_uiSteadyShot_Timer -= uiDiff;
        
        DoMeleeAttackIfReady();
    }
};



/********************************/
/* Hunter's Pet - 35610  */
/* Cat                        */
/********************************/
/*

#define    SPELL_CLAW                    RAID_MODE(67793,67980,67981,67982)

struct mob_catAI : public ScriptedAI
{
    mob_catAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
    }

    ScriptedInstance* m_pInstance;
    bool m_bIsRegularMode;
    uint32 m_uiClaw_Timer;
    
    void Reset()
    {
        m_uiClaw_Timer = 5000;
    }

    void Aggro(Unit* pWho)
    {
    }

    void JustDied(Unit* pKiller)
    {
        if(!m_pInstance)
            return;
    }
    
    void UpdateAI(const uint32 uiDiff)
    {
        if (!UpdateVictim())
            return;
            
        if (m_uiClaw_Timer < uiDiff)
        {
            DoCast(me->getVictim(), SPELL_CLAW);
                
            m_uiClaw_Timer = 5000;
            
        }else 
            m_uiClaw_Timer -= uiDiff;
        
        DoMeleeAttackIfReady();
    }
    
};

/**********************************/
/* Ginselle Blightslinger - 34449 */
/* Mage                           */
/**********************************/

struct boss_ginselle_blightslingerAI : public ScriptedAI
{
    boss_ginselle_blightslingerAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
    }

    ScriptedInstance* m_pInstance;
    bool m_bIsRegularMode;

    void Reset()
    {
    }

    void Aggro(Unit* pWho)
    {
    }

    void JustDied(Unit* pKiller)
    {
        if(!m_pInstance)
            return;

        if(!me->FindNearestCreature(34458, 200, true)
        && !me->FindNearestCreature(34451, 200, true)
        && !me->FindNearestCreature(34459, 200, true)
        && !me->FindNearestCreature(34448, 200, true)
        && !me->FindNearestCreature(34449, 200, true)
        && !me->FindNearestCreature(34445, 200, true)
        && !me->FindNearestCreature(34456, 200, true)
        && !me->FindNearestCreature(34447, 200, true)
        && !me->FindNearestCreature(34441, 200, true)
        && !me->FindNearestCreature(34454, 200, true)
        && !me->FindNearestCreature(34455, 200, true)
        && !me->FindNearestCreature(34444, 200, true)
        && !me->FindNearestCreature(34450, 200, true)
        && !me->FindNearestCreature(34453, 200, true))
        {
                m_pInstance->SetBossState(DATA_FACTION_CHAMPIONS, DONE);
        }
    }

    void JustReachedHome()
    {
        m_pInstance->SetData(RESET_TO_FIGHT, DATA_FACTION_CHAMPIONS);
    }

    void KilledUnit(Unit* who)
    {
        if (who->GetTypeId() == TYPEID_PLAYER)
            m_pInstance->SetData(UPDATE_DEATHS_COUNT, 0);
    }

    void UpdateAI(const uint32 diff)
    {
        if (!UpdateVictim())
            return;
        
        DoMeleeAttackIfReady();
    }
};

/******************************/
/* Liandra Suncaller - 34445  */
/* Paladin                    */
/******************************/

struct boss_liandra_suncallerAI : public ScriptedAI
{
    boss_liandra_suncallerAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
    }

    ScriptedInstance* m_pInstance;
    bool m_bIsRegularMode;

    void Reset()
    {
    }

    void Aggro(Unit* pWho)
    {
    }

    void JustDied(Unit* pKiller)
    {
        if(!m_pInstance)
            return;

        if(!me->FindNearestCreature(34458, 200, true)
        && !me->FindNearestCreature(34451, 200, true)
        && !me->FindNearestCreature(34459, 200, true)
        && !me->FindNearestCreature(34448, 200, true)
        && !me->FindNearestCreature(34449, 200, true)
        && !me->FindNearestCreature(34445, 200, true)
        && !me->FindNearestCreature(34456, 200, true)
        && !me->FindNearestCreature(34447, 200, true)
        && !me->FindNearestCreature(34441, 200, true)
        && !me->FindNearestCreature(34454, 200, true)
        && !me->FindNearestCreature(34455, 200, true)
        && !me->FindNearestCreature(34444, 200, true)
        && !me->FindNearestCreature(34450, 200, true)
        && !me->FindNearestCreature(34453, 200, true))
        {
                m_pInstance->SetBossState(DATA_FACTION_CHAMPIONS, DONE);
        }
    }

    void JustReachedHome()
    {
        m_pInstance->SetData(RESET_TO_FIGHT, DATA_FACTION_CHAMPIONS);
    }

    void KilledUnit(Unit* who)
    {
        if (who->GetTypeId() == TYPEID_PLAYER)
            m_pInstance->SetData(UPDATE_DEATHS_COUNT, 0);
    }

    void UpdateAI(const uint32 diff)
    {
        if (!UpdateVictim())
            return;
        
        DoMeleeAttackIfReady();
    }
};

/********************************/
/* Malithas Brightblade - 34456 */
/* Paladin                      */
/********************************/

struct boss_malithas_brightbladeAI : public ScriptedAI
{
    boss_malithas_brightbladeAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
    }

    ScriptedInstance* m_pInstance;
    bool m_bIsRegularMode;

    void Reset()
    {
    }

    void Aggro(Unit* pWho)
    {
    }

    void JustDied(Unit* pKiller)
    {
        if(!m_pInstance)
            return;

        if(!me->FindNearestCreature(34458, 200, true)
        && !me->FindNearestCreature(34451, 200, true)
        && !me->FindNearestCreature(34459, 200, true)
        && !me->FindNearestCreature(34448, 200, true)
        && !me->FindNearestCreature(34449, 200, true)
        && !me->FindNearestCreature(34445, 200, true)
        && !me->FindNearestCreature(34456, 200, true)
        && !me->FindNearestCreature(34447, 200, true)
        && !me->FindNearestCreature(34441, 200, true)
        && !me->FindNearestCreature(34454, 200, true)
        && !me->FindNearestCreature(34455, 200, true)
        && !me->FindNearestCreature(34444, 200, true)
        && !me->FindNearestCreature(34450, 200, true)
        && !me->FindNearestCreature(34453, 200, true))
        {
                m_pInstance->SetBossState(DATA_FACTION_CHAMPIONS, DONE);
        }
    }

    void JustReachedHome()
    {
        m_pInstance->SetData(RESET_TO_FIGHT, DATA_FACTION_CHAMPIONS);
    }

    void KilledUnit(Unit* who)
    {
        if (who->GetTypeId() == TYPEID_PLAYER)
            m_pInstance->SetData(UPDATE_DEATHS_COUNT, 0);
    }

    void UpdateAI(const uint32 diff)
    {
        if (!UpdateVictim())
            return;
        
        DoMeleeAttackIfReady();
    }
};

/*****************************/
/* Caiphus the Stern - 34447 */
/* Priest                    */
/*****************************/

struct boss_caiphus_the_sternAI : public ScriptedAI
{
    boss_caiphus_the_sternAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
    }

    ScriptedInstance* m_pInstance;
    bool m_bIsRegularMode;

    void Reset()
    {
    }

    void Aggro(Unit* pWho)
    {
    }

    void JustDied(Unit* pKiller)
    {
        if(!m_pInstance)
            return;

        if(!me->FindNearestCreature(34458, 200, true)
        && !me->FindNearestCreature(34451, 200, true)
        && !me->FindNearestCreature(34459, 200, true)
        && !me->FindNearestCreature(34448, 200, true)
        && !me->FindNearestCreature(34449, 200, true)
        && !me->FindNearestCreature(34445, 200, true)
        && !me->FindNearestCreature(34456, 200, true)
        && !me->FindNearestCreature(34447, 200, true)
        && !me->FindNearestCreature(34441, 200, true)
        && !me->FindNearestCreature(34454, 200, true)
        && !me->FindNearestCreature(34455, 200, true)
        && !me->FindNearestCreature(34444, 200, true)
        && !me->FindNearestCreature(34450, 200, true)
        && !me->FindNearestCreature(34453, 200, true))
        {
                m_pInstance->SetBossState(DATA_FACTION_CHAMPIONS, DONE);
        }
    }

    void JustReachedHome()
    {
        m_pInstance->SetData(RESET_TO_FIGHT, DATA_FACTION_CHAMPIONS);
    }

    void KilledUnit(Unit* who)
    {
        if (who->GetTypeId() == TYPEID_PLAYER)
            m_pInstance->SetData(UPDATE_DEATHS_COUNT, 0);
    }

    void UpdateAI(const uint32 diff)
    {
        if (!UpdateVictim())
            return;
        
        DoMeleeAttackIfReady();
    }
};

/*********************************/
/* Vivienne Blackwhisper - 34441 */
/* Priest                        */
/*********************************/

struct boss_vivienne_blackwhisperAI : public ScriptedAI
{
    boss_vivienne_blackwhisperAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
    }

    ScriptedInstance* m_pInstance;
    bool m_bIsRegularMode;

    void Reset()
    {
    }

    void Aggro(Unit* pWho)
    {
    }

    void JustDied(Unit* pKiller)
    {
        if(!m_pInstance)
            return;

        if(!me->FindNearestCreature(34458, 200, true)
        && !me->FindNearestCreature(34451, 200, true)
        && !me->FindNearestCreature(34459, 200, true)
        && !me->FindNearestCreature(34448, 200, true)
        && !me->FindNearestCreature(34449, 200, true)
        && !me->FindNearestCreature(34445, 200, true)
        && !me->FindNearestCreature(34456, 200, true)
        && !me->FindNearestCreature(34447, 200, true)
        && !me->FindNearestCreature(34441, 200, true)
        && !me->FindNearestCreature(34454, 200, true)
        && !me->FindNearestCreature(34455, 200, true)
        && !me->FindNearestCreature(34444, 200, true)
        && !me->FindNearestCreature(34450, 200, true)
        && !me->FindNearestCreature(34453, 200, true))
        {
                m_pInstance->SetBossState(DATA_FACTION_CHAMPIONS, DONE);
        }
    }

    void JustReachedHome()
    {
        m_pInstance->SetData(RESET_TO_FIGHT, DATA_FACTION_CHAMPIONS);
    }

    void KilledUnit(Unit* who)
    {
        if (who->GetTypeId() == TYPEID_PLAYER)
            m_pInstance->SetData(UPDATE_DEATHS_COUNT, 0);
    }

    void UpdateAI(const uint32 diff)
    {
        if (!UpdateVictim())
            return;
        
        DoMeleeAttackIfReady();
    }
};

/************************/
/* Maz'dinah - 34454    */
/* Rogue                */
/************************/

#define    SPELL_BLADE_FLURRY                65956
#define    SPELL_BLIND                        65960
#define    SPELL_CLOAK_OF_SHADOWS            65961
#define    SPELL_HEMORRHAGE                65954
#define    SPELL_EVISCERATE_10N            65957
#define    SPELL_EVISCERATE_10H            68095
#define    SPELL_EVISCERATE_25N            68094
#define    SPELL_EVISCERATE_25H            68096
#define    SPELL_FAN_OF_KNIVES_10N            65955
#define    SPELL_FAN_OF_KNIVES_10H            68098
#define    SPELL_FAN_OF_KNIVES_25N            68097 
#define    SPELL_FAN_OF_KNIVES_25H            68099
#define    SPELL_SHADOWSTEP                66178

struct boss_mazdinahAI : public ScriptedAI
{
    boss_mazdinahAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
    }

    ScriptedInstance* m_pInstance;
    bool m_bIsRegularMode;
    //uint32 PvPTrinket_Timer;
    uint32 m_uiBladeFlurry_Timer;
    uint32 m_uiBlind_Timer;
    uint32 m_uiCloakofShadows_Timer;
    uint32 m_uiHemorrhage_Timer;
    uint32 m_uiEviscerate_Timer;
    uint32 m_uiFanofKnives_Timer;
    uint32 m_uiShadowstep_Timer;

    void EnterEvadeMode()
    {
    }

    void Aggro(Unit* pWho)
    {
        if (!m_pInstance)
            return;
            
        if (m_pInstance->GetBossState(DATA_FACTION_CHAMPIONS) == DONE)
            me->ForcedDespawn();
        else
            m_pInstance->SetBossState(DATA_FACTION_CHAMPIONS, IN_PROGRESS);
    }

    void JustDied(Unit* pKiller)
    {
        if(!m_pInstance)
            return;

        if(!me->FindNearestCreature(34458, 200, true)
        && !me->FindNearestCreature(34451, 200, true)
        && !me->FindNearestCreature(34459, 200, true)
        && !me->FindNearestCreature(34448, 200, true)
        && !me->FindNearestCreature(34449, 200, true)
        && !me->FindNearestCreature(34445, 200, true)
        && !me->FindNearestCreature(34456, 200, true)
        && !me->FindNearestCreature(34447, 200, true)
        && !me->FindNearestCreature(34441, 200, true)
        && !me->FindNearestCreature(34454, 200, true)
        && !me->FindNearestCreature(34455, 200, true)
        && !me->FindNearestCreature(34444, 200, true)
        && !me->FindNearestCreature(34450, 200, true)
        && !me->FindNearestCreature(34453, 200, true))
        {
                m_pInstance->SetBossState(DATA_FACTION_CHAMPIONS, DONE);
        }
    }

    void JustReachedHome()
    {
        m_pInstance->SetData(RESET_TO_FIGHT, DATA_FACTION_CHAMPIONS);
    }

    void KilledUnit(Unit* who)
    {
        if (who->GetTypeId() == TYPEID_PLAYER)
            m_pInstance->SetData(UPDATE_DEATHS_COUNT, 0);
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!UpdateVictim())
            return;
            
        /*if (m_uiPvPTrinket_Timer < uiDiff)
        {
            DoCast(me, SPELL_PVP_TRINKET);
            
            m_uiPvPTrinket_Timer = 120000;
            
        }else 
            m_uiPvPTrinket_Timer -= uiDiff;*/

        if (m_uiBladeFlurry_Timer < uiDiff)
        {
            DoCast(me, SPELL_BLADE_FLURRY);
            
            m_uiBladeFlurry_Timer = 120000;
            
        }else 
            m_uiBladeFlurry_Timer -= uiDiff;

        if (m_uiBlind_Timer < uiDiff)
        {
            DoCast(me, SPELL_BLIND);
                
            m_uiBlind_Timer = 120000;
            
        }else 
            m_uiBlind_Timer -= uiDiff;

        if (m_uiCloakofShadows_Timer < uiDiff)
        {
            DoCast(me, SPELL_CLOAK_OF_SHADOWS);
            
            m_uiCloakofShadows_Timer = 90000;
            
        }else 
            m_uiCloakofShadows_Timer -= uiDiff;

        if (m_uiHemorrhage_Timer < uiDiff)
        {
            DoCast(me->getVictim(), SPELL_HEMORRHAGE);
                
            m_uiHemorrhage_Timer = 30000;
            
        }else 
            m_uiHemorrhage_Timer -= uiDiff;

        if (m_uiEviscerate_Timer < uiDiff)
        {
            DoCast(me->getVictim(), RAID_MODE(SPELL_EVISCERATE_10N,SPELL_EVISCERATE_25N,SPELL_EVISCERATE_10H,SPELL_EVISCERATE_25H));
            
            m_uiEviscerate_Timer = 30000;
            
        }else 
            m_uiEviscerate_Timer -= uiDiff;

        if (m_uiFanofKnives_Timer < uiDiff)
        {
            DoCast(me->getVictim(), RAID_MODE(SPELL_FAN_OF_KNIVES_10N,SPELL_FAN_OF_KNIVES_25N,SPELL_FAN_OF_KNIVES_10H,SPELL_FAN_OF_KNIVES_25H));
                
            m_uiFanofKnives_Timer = 10000;
            
        }else 
            m_uiFanofKnives_Timer -= uiDiff;

        if (m_uiShadowstep_Timer < uiDiff)
        {
            DoCast(me->getVictim(), SPELL_SHADOWSTEP);
            
            m_uiShadowstep_Timer = 30000;
            
        }else 
            m_uiShadowstep_Timer -= uiDiff;
        
        DoMeleeAttackIfReady();
    }
};

/***************************/
/* Broln Stouthorn - 34455 */
/* Shaman                  */
/***************************/

struct boss_broln_stouthornAI : public ScriptedAI
{
    boss_broln_stouthornAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
    }

    ScriptedInstance* m_pInstance;
    bool m_bIsRegularMode;

    void EnterEvadeMode()
    {
    }

    void Aggro(Unit* pWho)
    {
    }

    void JustDied(Unit* pKiller)
    {
        if(!m_pInstance)
            return;

        if(!me->FindNearestCreature(34458, 200, true)
        && !me->FindNearestCreature(34451, 200, true)
        && !me->FindNearestCreature(34459, 200, true)
        && !me->FindNearestCreature(34448, 200, true)
        && !me->FindNearestCreature(34449, 200, true)
        && !me->FindNearestCreature(34445, 200, true)
        && !me->FindNearestCreature(34456, 200, true)
        && !me->FindNearestCreature(34447, 200, true)
        && !me->FindNearestCreature(34441, 200, true)
        && !me->FindNearestCreature(34454, 200, true)
        && !me->FindNearestCreature(34455, 200, true)
        && !me->FindNearestCreature(34444, 200, true)
        && !me->FindNearestCreature(34450, 200, true)
        && !me->FindNearestCreature(34453, 200, true))
        {
                m_pInstance->SetBossState(DATA_FACTION_CHAMPIONS, DONE);
        }
    }

    void JustReachedHome()
    {
        m_pInstance->SetData(RESET_TO_FIGHT, DATA_FACTION_CHAMPIONS);
    }

    void KilledUnit(Unit* who)
    {
        if (who->GetTypeId() == TYPEID_PLAYER)
            m_pInstance->SetData(UPDATE_DEATHS_COUNT, 0);
    }

    void UpdateAI(const uint32 diff)
    {
        if (!UpdateVictim())
            return;
        
        DoMeleeAttackIfReady();
    }
};

/************************/
/* Thrakgar - 34444     */
/* Shaman               */
/************************/

struct boss_thrakgarAI : public ScriptedAI
{
    boss_thrakgarAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
    }

    ScriptedInstance* m_pInstance;
    bool m_bIsRegularMode;

    void Reset()
    {
    }

    void Aggro(Unit* pWho)
    {
    }

    void JustDied(Unit* pKiller)
    {
        if(!m_pInstance)
            return;

        if(!me->FindNearestCreature(34458, 200, true)
        && !me->FindNearestCreature(34451, 200, true)
        && !me->FindNearestCreature(34459, 200, true)
        && !me->FindNearestCreature(34448, 200, true)
        && !me->FindNearestCreature(34449, 200, true)
        && !me->FindNearestCreature(34445, 200, true)
        && !me->FindNearestCreature(34456, 200, true)
        && !me->FindNearestCreature(34447, 200, true)
        && !me->FindNearestCreature(34441, 200, true)
        && !me->FindNearestCreature(34454, 200, true)
        && !me->FindNearestCreature(34455, 200, true)
        && !me->FindNearestCreature(34444, 200, true)
        && !me->FindNearestCreature(34450, 200, true)
        && !me->FindNearestCreature(34453, 200, true))
        {
                m_pInstance->SetBossState(DATA_FACTION_CHAMPIONS, DONE);
        }
    }

    void JustReachedHome()
    {
        m_pInstance->SetData(RESET_TO_FIGHT, DATA_FACTION_CHAMPIONS);
    }

    void KilledUnit(Unit* who)
    {
        if (who->GetTypeId() == TYPEID_PLAYER)
            m_pInstance->SetData(UPDATE_DEATHS_COUNT, 0);
    }

    void UpdateAI(const uint32 diff)
    {
        if (!UpdateVictim())
            return;
        
        DoMeleeAttackIfReady();
    }
};

/*************************/
/* Harkzog - 34450       */
/* Warlock               */
/*************************/

struct boss_harkzogAI : public ScriptedAI
{
    boss_harkzogAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
    }

    ScriptedInstance* m_pInstance;
    bool m_bIsRegularMode;

    void Reset()
    {
    }

    void Aggro(Unit* pWho)
    {
    }

    void JustDied(Unit* pKiller)
    {
        if(!m_pInstance)
            return;

        if(!me->FindNearestCreature(34458, 200, true)
        && !me->FindNearestCreature(34451, 200, true)
        && !me->FindNearestCreature(34459, 200, true)
        && !me->FindNearestCreature(34448, 200, true)
        && !me->FindNearestCreature(34449, 200, true)
        && !me->FindNearestCreature(34445, 200, true)
        && !me->FindNearestCreature(34456, 200, true)
        && !me->FindNearestCreature(34447, 200, true)
        && !me->FindNearestCreature(34441, 200, true)
        && !me->FindNearestCreature(34454, 200, true)
        && !me->FindNearestCreature(34455, 200, true)
        && !me->FindNearestCreature(34444, 200, true)
        && !me->FindNearestCreature(34450, 200, true)
        && !me->FindNearestCreature(34453, 200, true))
        {
                m_pInstance->SetBossState(DATA_FACTION_CHAMPIONS, DONE);
        }
    }

    void JustReachedHome()
    {
        m_pInstance->SetData(RESET_TO_FIGHT, DATA_FACTION_CHAMPIONS);
    }

    void KilledUnit(Unit* who)
    {
        if (who->GetTypeId() == TYPEID_PLAYER)
            m_pInstance->SetData(UPDATE_DEATHS_COUNT, 0);
    }

    void UpdateAI(const uint32 diff)
    {
        if (!UpdateVictim())
            return;
        
        DoMeleeAttackIfReady();
    }
};

/********************************/
/* Narrhok Steelbreaker - 34453 */
/* Warrior                      */
/********************************/

struct boss_narrhok_steelbreakerAI : public ScriptedAI
{
    boss_narrhok_steelbreakerAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
    }

    ScriptedInstance* m_pInstance;
    bool m_bIsRegularMode;

    void Reset()
    {
    }

    void Aggro(Unit* pWho)
    {
    }

    void JustDied(Unit* pKiller)
    {
        if(!m_pInstance)
            return;

        if(!me->FindNearestCreature(34458, 200, true)
        && !me->FindNearestCreature(34451, 200, true)
        && !me->FindNearestCreature(34459, 200, true)
        && !me->FindNearestCreature(34448, 200, true)
        && !me->FindNearestCreature(34449, 200, true)
        && !me->FindNearestCreature(34445, 200, true)
        && !me->FindNearestCreature(34456, 200, true)
        && !me->FindNearestCreature(34447, 200, true)
        && !me->FindNearestCreature(34441, 200, true)
        && !me->FindNearestCreature(34454, 200, true)
        && !me->FindNearestCreature(34455, 200, true)
        && !me->FindNearestCreature(34444, 200, true)
        && !me->FindNearestCreature(34450, 200, true)
        && !me->FindNearestCreature(34453, 200, true))
        {
                m_pInstance->SetBossState(DATA_FACTION_CHAMPIONS, DONE);
        }
    }

    void JustReachedHome()
    {
        m_pInstance->SetData(RESET_TO_FIGHT, DATA_FACTION_CHAMPIONS);
    }

    void KilledUnit(Unit* who)
    {
        if (who->GetTypeId() == TYPEID_PLAYER)
            m_pInstance->SetData(UPDATE_DEATHS_COUNT, 0);
    }

    void UpdateAI(const uint32 diff)
    {
        if (!UpdateVictim())
            return;
        
        DoMeleeAttackIfReady();
    }
};

/***************************************************************/

CreatureAI* GetAI_boss_gorgrim_shadowcleave(Creature* pCreature)
{
    return new boss_gorgrim_shadowcleaveAI(pCreature);
}

CreatureAI* GetAI_boss_birana_stormhoof(Creature* pCreature)
{
    return new boss_birana_stormhoofAI(pCreature);
}

CreatureAI* GetAI_boss_erin_misthoof(Creature* pCreature)
{
    return new boss_erin_misthoofAI(pCreature);
}

CreatureAI* GetAI_boss_rujkah(Creature* pCreature)
{
    return new boss_rujkahAI(pCreature);
}
/*
CreatureAI* GetAI_mob_cat(Creature* pCreature)
{
    return new mob_catAI(pCreature);
}
*/
CreatureAI* GetAI_boss_ginselle_blightslinger(Creature* pCreature)
{
    return new boss_ginselle_blightslingerAI(pCreature);
}

CreatureAI* GetAI_boss_liandra_suncaller(Creature* pCreature)
{
    return new boss_liandra_suncallerAI(pCreature);
}

CreatureAI* GetAI_boss_malithas_brightblader(Creature* pCreature)
{
    return new boss_malithas_brightbladeAI(pCreature);
}

CreatureAI* GetAI_boss_caiphus_the_stern(Creature* pCreature)
{
    return new boss_caiphus_the_sternAI(pCreature);
}

CreatureAI* GetAI_boss_vivienne_blackwhisper(Creature* pCreature)
{
    return new boss_vivienne_blackwhisperAI(pCreature);
}

CreatureAI* GetAI_boss_mazdinah(Creature* pCreature)
{
    return new boss_mazdinahAI(pCreature);
}

CreatureAI* GetAI_boss_broln_stouthorn(Creature* pCreature)
{
    return new boss_broln_stouthornAI(pCreature);
}

CreatureAI* GetAI_boss_thrakgar(Creature* pCreature)
{
    return new boss_thrakgarAI(pCreature);
}

CreatureAI* GetAI_boss_harkzog(Creature* pCreature)
{
    return new boss_harkzogAI(pCreature);
}

CreatureAI* GetAI_boss_narrhok_steelbreaker(Creature* pCreature)
{
    return new boss_narrhok_steelbreakerAI(pCreature);
}

void AddSC_boss_tc_horde_champions()
{
    Script* NewScript;

    NewScript = new Script;
    NewScript->Name = "boss_gorgrim_shadowcleave";
    NewScript->GetAI = &GetAI_boss_gorgrim_shadowcleave;
    NewScript->RegisterSelf();

    NewScript = new Script;
    NewScript->Name = "boss_birana_stormhoof";
    NewScript->GetAI = &GetAI_boss_birana_stormhoof;
    NewScript->RegisterSelf();

    NewScript = new Script;
    NewScript->Name = "boss_erin_misthoof";
    NewScript->GetAI = &GetAI_boss_erin_misthoof;
    NewScript->RegisterSelf();

    NewScript = new Script;
    NewScript->Name = "boss_rujkah";
    NewScript->GetAI = &GetAI_boss_rujkah;
    NewScript->RegisterSelf();
/*
    NewScript = new Script;
    NewScript->Name = "mob_cat";
    NewScript->GetAI = &GetAI_mob_cat;
    NewScript->RegisterSelf();
*/    
    NewScript = new Script;
    NewScript->Name = "boss_ginselle_blightslinger";
    NewScript->GetAI = &GetAI_boss_ginselle_blightslinger;
    NewScript->RegisterSelf();

    NewScript = new Script;
    NewScript->Name = "boss_liandra_suncaller";
    NewScript->GetAI = &GetAI_boss_liandra_suncaller;
    NewScript->RegisterSelf();

    NewScript = new Script;
    NewScript->Name = "boss_malithas_brightblader";
    NewScript->GetAI = &GetAI_boss_malithas_brightblader;
    NewScript->RegisterSelf();

    NewScript = new Script;
    NewScript->Name = "boss_caiphus_the_stern";
    NewScript->GetAI = &GetAI_boss_caiphus_the_stern;
    NewScript->RegisterSelf();

    NewScript = new Script;
    NewScript->Name = "boss_vivienne_blackwhisper";
    NewScript->GetAI = &GetAI_boss_vivienne_blackwhisper;
    NewScript->RegisterSelf();

    NewScript = new Script;
    NewScript->Name = "boss_mazdinah";
    NewScript->GetAI = &GetAI_boss_mazdinah;
    NewScript->RegisterSelf();

    NewScript = new Script;
    NewScript->Name = "boss_broln_stouthorn";
    NewScript->GetAI = &GetAI_boss_broln_stouthorn;
    NewScript->RegisterSelf();

    NewScript = new Script;
    NewScript->Name = "boss_thrakgar";
    NewScript->GetAI = &GetAI_boss_thrakgar;
    NewScript->RegisterSelf();

    NewScript = new Script;
    NewScript->Name = "boss_harkzog";
    NewScript->GetAI = &GetAI_boss_harkzog;
    NewScript->RegisterSelf();

    NewScript = new Script;
    NewScript->Name = "boss_narrhok_steelbreaker";
    NewScript->GetAI = &GetAI_boss_narrhok_steelbreaker;
    NewScript->RegisterSelf();
}







///ALLIANCE CHAMPIONS

/********************************/
/* Tyrius Duskblade - 34461     */
/* Death Knight                 */
/********************************/

#define    SPELL_CHAINS_OF_ICE                66020
#define    SPELL_DEATH_GRIG                66017
#define    SPELL_ICEBOUND_FORTITUDE        66023
#define    SPELL_STRANGULATE                66018
/*
#define    SPELL_DEATH_COIL_10N            66019 
#define    SPELL_DEATH_COIL_10H            67930 
#define    SPELL_DEATH_COIL_25N            67929
#define    SPELL_DEATH_COIL_25H            67931
#define    SPELL_FROST_STRIKE_10N            66047 
#define    SPELL_FROST_STRIKE_10H            67936 
#define    SPELL_FROST_STRIKE_25N            67935
#define    SPELL_FROST_STRIKE_25H            67937
#define    SPELL_ICY_TOUCH_10N                66021
#define    SPELL_ICY_TOUCH_10H                67939
#define    SPELL_ICY_TOUCH_25N                67938
#define    SPELL_ICY_TOUCH_25H                67940
*/
#define    SPELL_DEATH_COIL                RAID_MODE(66019,67929,67930,67931)
#define    SPELL_FROST_STRIKE                RAID_MODE(66047,67935,67936,67937)
#define    SPELL_ICY_TOUCH                    RAID_MODE(66021,67938,67939,67940)

struct boss_tyrius_duskbladeAI : public ScriptedAI
{
    boss_tyrius_duskbladeAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
    }

    ScriptedInstance* m_pInstance;
    bool m_bIsRegularMode;
    bool IsHeroic;
    //uint32 m_uiPvPTrinket_Timer;
    uint32 m_uiChainsofIce_Timer;
    uint32 m_uiDeathGrip_Timer;
    uint32 m_uiIceboundFortitude_Timer;
    uint32 m_uiStrangulate_Timer;
    uint32 m_uiDeathCoil_Timer;
    uint32 m_uiFrostStrike_Timer;
    uint32 m_uiIcyTouch_Timer;

    void Reset()
    {
        me->SetRespawnDelay(1);
        //m_uiPvPTrinket_Timer = 12000;
        m_uiChainsofIce_Timer = 20000;
        m_uiDeathGrip_Timer = 5000;
        m_uiIceboundFortitude_Timer = 15000;
        m_uiDeathCoil_Timer = 10000;
        m_uiStrangulate_Timer = 30000;
        m_uiFrostStrike_Timer = 8000;
        m_uiIcyTouch_Timer = 25000;
    }

    void Aggro(Unit* pWho)
    {
        if (!m_pInstance)
            return;

        if (m_pInstance->GetBossState(DATA_FACTION_CHAMPIONS) == DONE)
            me->ForcedDespawn();
        else
            m_pInstance->SetBossState(DATA_FACTION_CHAMPIONS, IN_PROGRESS);
    }

    void JustDied(Unit* pKiller)
    {
        if(!m_pInstance)
            return;

        if(!me->FindNearestCreature(34461, 200, true)
        && !me->FindNearestCreature(34460, 200, true)
        && !me->FindNearestCreature(34469, 200, true)
        && !me->FindNearestCreature(34467, 200, true)
        && !me->FindNearestCreature(34468, 200, true)
        && !me->FindNearestCreature(34465, 200, true)
        && !me->FindNearestCreature(34471, 200, true)
        && !me->FindNearestCreature(34466, 200, true)
        && !me->FindNearestCreature(34473, 200, true)
        && !me->FindNearestCreature(34472, 200, true)
        && !me->FindNearestCreature(34463, 200, true)
        && !me->FindNearestCreature(34470, 200, true)
        && !me->FindNearestCreature(34474, 200, true)
        && !me->FindNearestCreature(34475, 200, true))
        {
            m_pInstance->SetBossState(DATA_FACTION_CHAMPIONS, DONE);
        }
    }

    void JustReachedHome()
    {
        m_pInstance->SetData(RESET_TO_FIGHT, DATA_FACTION_CHAMPIONS);
    }

    void KilledUnit(Unit* who)
    {
        if (who->GetTypeId() == TYPEID_PLAYER)
            m_pInstance->SetData(UPDATE_DEATHS_COUNT, 0);
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!UpdateVictim())
            return;
            
        /*if (m_uiPvPTrinket_Timer < uiDiff)
        {
            DoCast(me, SPELL_PVP_TRINKET);
                
            m_uiPvPTrinket_Timer = 120000;
        }
        else 
            m_uiPvPTrinket_Timer -= uiuiDiff;*/

        if (m_uiChainsofIce_Timer < uiDiff)
        {
            if (Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM,0))
                DoCast(pTarget, SPELL_CHAINS_OF_ICE);
            
            m_uiChainsofIce_Timer = 45000;
                
        }else 
            m_uiChainsofIce_Timer -= uiDiff;

        if (m_uiDeathGrip_Timer < uiDiff)
        {
            if (Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM,0))
                DoCast(pTarget, SPELL_DEATH_GRIG);
            
            m_uiDeathGrip_Timer = 45000;
        }else 
            m_uiDeathGrip_Timer -= uiDiff;

        if (m_uiIceboundFortitude_Timer < uiDiff)
        {
            DoCast(me, SPELL_ICEBOUND_FORTITUDE);
            
            m_uiIceboundFortitude_Timer = 60000;
            
        }else 
            m_uiIceboundFortitude_Timer -= uiDiff;

        if (m_uiStrangulate_Timer < uiDiff)
        {
            if (Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM,0))
                DoCast(pTarget, SPELL_STRANGULATE);
            
            m_uiStrangulate_Timer = 120000;
                
        }else 
            m_uiStrangulate_Timer -= uiDiff;

        if (m_uiDeathCoil_Timer < uiDiff)
        {
            DoCast(me->getVictim(), SPELL_DEATH_COIL);
            
            m_uiDeathCoil_Timer = 10000;
            
        }else 
            m_uiDeathCoil_Timer -= uiDiff;
        
        if (m_uiFrostStrike_Timer < uiDiff)
        {
            DoCast(me->getVictim(), SPELL_FROST_STRIKE);
            
            m_uiFrostStrike_Timer = 10000;
            
        }else 
            m_uiFrostStrike_Timer -= uiDiff;

        if (m_uiIcyTouch_Timer < uiDiff)
        {
            DoCast(me->getVictim(), SPELL_ICY_TOUCH);
                
            m_uiIcyTouch_Timer = 20000;
                
        }else 
            m_uiIcyTouch_Timer -= uiDiff;

        DoMeleeAttackIfReady();
    }
};

/********************************/
/* Kavina Grovesong - 34460     */
/* Druid Balance                */
/********************************/

#define    SPELL_BARKSKIN                    65860
#define    SPELL_CYCLONE                    65859
#define    SPELL_ENTANGLING_ROOTS            65857
#define    SPELL_FAERIE_FIRE                65863
#define    SPELL_FORCE_OF_NATURE            65861
/*
#define    SPELL_INSECT_SWARM_10N            65855
#define    SPELL_INSECT_SWARM_10H            67942
#define    SPELL_INSECT_SWARM_25N            67941 
#define    SPELL_INSECT_SWARM_25H            67943
#define    SPELL_MOONFIRE_10N                65856 
#define    SPELL_MOONFIRE_10H                67945
#define    SPELL_MOONFIRE_25N                67944 
#define    SPELL_MOONFIRE_25H                67946
#define    SPELL_STARFIRE_10N                65854 
#define    SPELL_STARFIRE_10H                67948
#define    SPELL_STARFIRE_25N                67947 
#define    SPELL_STARFIRE_25H                67949
#define    SPELL_WRATH_10N                    65862 
#define    SPELL_WRATH_10H                    67952
#define    SPELL_WRATH_25N                    67951 
#define    SPELL_WRATH_25H                     67953
*/
#define    SPELL_WRATH                        RAID_MODE(65862,67951,67952,67953)
#define    SPELL_STARFIRE                    RAID_MODE(65854,67947,67948,67949)
#define    SPELL_MOONFIRE                    RAID_MODE(65856,67944,67945,67946)
#define    SPELL_INSECT_SWARM                RAID_MODE(65855,67941,67942,67943)

struct boss_kavina_grovesongAI : public ScriptedAI
{
    boss_kavina_grovesongAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
    }

    ScriptedInstance* m_pInstance;
    bool m_bIsRegularMode;
    uint32 m_uiBarkskin_Timer;
    uint32 m_uiCyclone_Timer;
    uint32 m_uiEntanglingRoots_Timer;
    //uint32 m_uiPvPTrinket_Timer;
    uint32 m_uiFaerieFire_Timer;
    uint32 m_uiForceofNature_Timer;
    uint32 m_uiInsectSwarm_Timer;
    uint32 m_uiMoonfire_Timer;
    uint32 m_uiStarfire_Timer;
    uint32 m_uiWrath_Timer;
    
    void Reset()
    {
        me->SetRespawnDelay(1);
        m_uiBarkskin_Timer = 1000;
        m_uiCyclone_Timer = 25000;
        m_uiEntanglingRoots_Timer = 35000;
        //m_uiPvPTrinket_Timer = 12000;
        m_uiFaerieFire_Timer = 10000;
        m_uiForceofNature_Timer = 60000;
        m_uiInsectSwarm_Timer = 20000;
        m_uiMoonfire_Timer = 7000;
        m_uiStarfire_Timer = 15000;
        m_uiWrath_Timer = 28000;
    }

    void Aggro(Unit* pWho)
    {
        if (!m_pInstance)
            return;

        if (m_pInstance->GetBossState(DATA_FACTION_CHAMPIONS) == DONE)
            me->ForcedDespawn();
        else
            m_pInstance->SetBossState(DATA_FACTION_CHAMPIONS, IN_PROGRESS);
    }

    void JustDied(Unit* pKiller)
    {
        if(!m_pInstance)
            return;

        if(!me->FindNearestCreature(34461, 200, true)
        && !me->FindNearestCreature(34460, 200, true)
        && !me->FindNearestCreature(34469, 200, true)
        && !me->FindNearestCreature(34467, 200, true)
        && !me->FindNearestCreature(34468, 200, true)
        && !me->FindNearestCreature(34465, 200, true)
        && !me->FindNearestCreature(34471, 200, true)
        && !me->FindNearestCreature(34466, 200, true)
        && !me->FindNearestCreature(34473, 200, true)
        && !me->FindNearestCreature(34472, 200, true)
        && !me->FindNearestCreature(34463, 200, true)
        && !me->FindNearestCreature(34470, 200, true)
        && !me->FindNearestCreature(34474, 200, true)
        && !me->FindNearestCreature(34475, 200, true))
        {
            m_pInstance->SetBossState(DATA_FACTION_CHAMPIONS, DONE);
        }
    }

    void JustReachedHome()
    {
        m_pInstance->SetData(RESET_TO_FIGHT, DATA_FACTION_CHAMPIONS);
    }

    void KilledUnit(Unit* who)
    {
        if (who->GetTypeId() == TYPEID_PLAYER)
            m_pInstance->SetData(UPDATE_DEATHS_COUNT, 0);
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!UpdateVictim())
            return;
        
        if (m_uiFaerieFire_Timer < uiDiff)
        {
            DoCast(me->getVictim(), SPELL_FAERIE_FIRE);
            
            m_uiFaerieFire_Timer = 15000;
            
        }else 
            m_uiFaerieFire_Timer -= uiDiff;

        if (m_uiForceofNature_Timer < uiDiff)
        {
            DoCast(me->getVictim(), SPELL_FORCE_OF_NATURE);
                
            m_uiForceofNature_Timer = 60000;
                
        }else
            m_uiForceofNature_Timer -= uiDiff;
        
        if (m_uiInsectSwarm_Timer < uiDiff)
        {
            DoCast(me->getVictim(), SPELL_INSECT_SWARM);
                
            m_uiInsectSwarm_Timer = 25000;
                
        }else 
            m_uiInsectSwarm_Timer -= uiDiff;

        if (m_uiMoonfire_Timer < uiDiff)
        {
            DoCast(me->getVictim(), SPELL_MOONFIRE);
                
            m_uiMoonfire_Timer = 7000;
                
        }else 
            m_uiMoonfire_Timer -= uiDiff;
        
        if (m_uiStarfire_Timer < uiDiff)
        {
            DoCast(me->getVictim(), SPELL_STARFIRE);
                
            m_uiStarfire_Timer = 20000;
                
        }else 
            m_uiStarfire_Timer -= uiDiff;
        
        if (m_uiWrath_Timer < uiDiff)
        {
            DoCast(me->getVictim(), SPELL_WRATH);
            
            m_uiWrath_Timer = 20000;
                
        }else 
            m_uiWrath_Timer -= uiDiff;
        
        if (m_uiCyclone_Timer < uiDiff)
        {
            if (Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM,0))
                DoCast(pTarget, SPELL_CYCLONE);
                
            m_uiCyclone_Timer = 30000;
                
        }else 
            m_uiCyclone_Timer -= uiDiff;

        if (m_uiBarkskin_Timer < uiDiff)
        {
            DoCast(me, SPELL_BARKSKIN);
            
            m_uiBarkskin_Timer = 35000;
                
        }else 
            m_uiBarkskin_Timer -= uiDiff;
        
        if (m_uiEntanglingRoots_Timer < uiDiff)
        {
            DoCast(me->getVictim(), SPELL_ENTANGLING_ROOTS);
                
            m_uiEntanglingRoots_Timer = 30000;
                
        }else 
            m_uiEntanglingRoots_Timer -= uiDiff;

        /*if (m_uiPvPTrinket_Timer < uiDiff)
        {
            DoCast(me, SPELL_PVP_TRINKET);
            
            m_uiPvPTrinket_Timer = 120000;
                
        }else 
            m_uiPvPTrinket_Timer -= uiDiff;*/
        
        DoMeleeAttackIfReady();
    }
};
/********************************/
/* Melador Valestrider - 34469  */
/* Druid  Restoration           */
/********************************/

#define    SPELL_THORNS                    66068
#define SPELL_BARKSKIN                    65860
#define SPELL_NATURE_GRASP                66071
/*
#define    SPELL_NOURISH_10N                66066
#define    SPELL_NOURISH_10H                67966
#define    SPELL_NOURISH_25N                67965 
#define    SPELL_NOURISH_25H                67967
#define    SPELL_REGROWTH_10N                66067 
#define    SPELL_REGROWTH_10H                67969
#define    SPELL_REGROWTH_25N                67968
#define    SPELL_REGROWTH_25H                67970
#define    SPELL_REJUVENATION_10N            66065 
#define    SPELL_REJUVENATION_10H            67972
#define    SPELL_REJUVENATION_25N            67971 
#define    SPELL_REJUVENATION_25H            67973
#define    SPELL_TRANQUILITY_10N            66086
#define    SPELL_TRANQUILITY_10H            67975
#define    SPELL_TRANQUILITY_25N            67974 
#define    SPELL_TRANQUILITY_25H            67976
#define SPELL_LIFEBLOOM_10N                66093
#define SPELL_LIFEBLOOM_10H               67958
#define SPELL_LIFEBLOOM_25N               67957
#define SPELL_LIFEBLOOM_25H               67959
*/
#define    SPELL_NOURISH                    RAID_MODE(66066,67965,67966,67967)
#define    SPELL_REGROWTH                    RAID_MODE(66067,67968,67969,67970)
#define    SPELL_REJUVENATION                RAID_MODE(66065,67971,67972,67973)
#define    SPELL_TRANQUILITY                RAID_MODE(66086,67974,67975,67976)
#define SPELL_LIFEBLOOM                    RAID_MODE(66093,67957,67958,67959)

struct boss_melador_valestriderAI : public ScriptedAI
{
    boss_melador_valestriderAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
    }

    ScriptedInstance* m_pInstance;
    bool m_bIsRegularMode;
    //uint32 m_uiPvPTrinket_Timer;
    uint32 m_uiBarkskin_Timer;
    uint32 m_uiThorns_Timer;
    uint32 m_uiLifebloom_Timer;
    uint32 m_uiNourish_Timer;
    uint32 m_uiRegrowth_Timer;
    uint32 m_uiRejuvenation_Timer;
    uint32 m_uiTranquility_Timer;
    uint32 m_uiNatureGrasp_Timer;
        
    void Reset()
    {
        me->SetRespawnDelay(1);
        m_uiBarkskin_Timer = 1000;
        m_uiThorns_Timer = 3000;
        m_uiLifebloom_Timer = 5000;
        //m_uiPvPTrinket_Timer = 12000;
        m_uiNourish_Timer = 8000;
        m_uiRegrowth_Timer = 6000;
        m_uiRejuvenation_Timer = 45000;
        m_uiTranquility_Timer = 50000;
        m_uiNatureGrasp_Timer = urand(40000,80000);
    }

    void Aggro(Unit* pWho)
    {
        if (!m_pInstance)
            return;
        if (m_pInstance->GetBossState(DATA_FACTION_CHAMPIONS) == DONE)
            me->ForcedDespawn();
        else
            m_pInstance->SetBossState(DATA_FACTION_CHAMPIONS, IN_PROGRESS);
    }

    void JustDied(Unit* pKiller)
    {
        if(!m_pInstance)
            return;

        if(!me->FindNearestCreature(34461, 200, true)
        && !me->FindNearestCreature(34460, 200, true)
        && !me->FindNearestCreature(34469, 200, true)
        && !me->FindNearestCreature(34467, 200, true)
        && !me->FindNearestCreature(34468, 200, true)
        && !me->FindNearestCreature(34465, 200, true)
        && !me->FindNearestCreature(34471, 200, true)
        && !me->FindNearestCreature(34466, 200, true)
        && !me->FindNearestCreature(34473, 200, true)
        && !me->FindNearestCreature(34472, 200, true)
        && !me->FindNearestCreature(34463, 200, true)
        && !me->FindNearestCreature(34470, 200, true)
        && !me->FindNearestCreature(34474, 200, true)
        && !me->FindNearestCreature(34475, 200, true))
        {
            m_pInstance->SetBossState(DATA_FACTION_CHAMPIONS, DONE);
        }
    }

    void JustReachedHome()
    {
        m_pInstance->SetData(RESET_TO_FIGHT, DATA_FACTION_CHAMPIONS);
    }

    void KilledUnit(Unit* who)
    {
        if (who->GetTypeId() == TYPEID_PLAYER)
            m_pInstance->SetData(UPDATE_DEATHS_COUNT, 0);
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!UpdateVictim())
            return;
            
        if (m_uiBarkskin_Timer < uiDiff)
        {
            DoCast(me, SPELL_BARKSKIN);
            
            m_uiBarkskin_Timer = 35000;
            
        }else 
            m_uiBarkskin_Timer -= uiDiff;

        /*if (m_uiPvPTrinketTimer < uiDiff)
        {
            DoCast(me, SPELL_PVP_TRINKET);
            
            m_uiPvPTrinketTimer = 120000;
            
        }else 
            m_uiPvPTrinketTimer -= uiDiff;*/
        
        if (m_uiNatureGrasp_Timer < uiDiff)
        {
            DoCast(me, SPELL_NATURE_GRASP);
            
            m_uiNatureGrasp_Timer = urand(40000,80000);
            
        }else 
            m_uiNatureGrasp_Timer -= uiDiff;
        
        if (m_uiThorns_Timer < uiDiff)
        {           
            DoCast(me, SPELL_THORNS);
            
            m_uiThorns_Timer = 30000;
   
        }else 
            m_uiThorns_Timer -= uiDiff;

        if (m_uiLifebloom_Timer < uiDiff)
        {
            if(Unit* pTarget = DoSelectLowestHpFriendly(200, 1))
                DoCast(pTarget, SPELL_LIFEBLOOM);
                
            m_uiLifebloom_Timer = 10000;
                
        }else 
            m_uiLifebloom_Timer -= uiDiff;

        if (m_uiNourish_Timer < uiDiff)
        {
            if(Unit* pTarget = DoSelectLowestHpFriendly(200, 1))
                DoCast(pTarget, SPELL_NOURISH);
            
            m_uiNourish_Timer = 20000;
                
        }else 
            m_uiNourish_Timer -= uiDiff;

        if (m_uiRegrowth_Timer < uiDiff)
        {
            if(Unit* pTarget = DoSelectLowestHpFriendly(200, 1))
                DoCast(pTarget, SPELL_REGROWTH);
            
            m_uiRegrowth_Timer = 15000;
                
        }else 
            m_uiRegrowth_Timer -= uiDiff;

        if (m_uiRejuvenation_Timer < uiDiff)
        {
            if(Unit* pTarget = DoSelectLowestHpFriendly(200, 1))
                DoCast(pTarget, SPELL_REJUVENATION);
            
            m_uiRejuvenation_Timer = 45000;
            
        }else 
            m_uiRejuvenation_Timer -= uiDiff;

        if (m_uiTranquility_Timer < uiDiff)
        {
            if(Unit* pTarget = DoSelectLowestHpFriendly(200, 1))
                DoCast(pTarget, SPELL_TRANQUILITY);
            
            m_uiTranquility_Timer = 600000;
                
        }else 
            m_uiTranquility_Timer -= uiDiff;

        
        DoMeleeAttackIfReady();
    }
};
/********************************/
/* Alyssia Moonstalker - 34467  */
/* Hunter                       */
/********************************/

#define    SPELL_DETERRENCE                65871
#define    SPELL_CALL_PET                    67777
#define    SPELL_FROST_TRAP                65880
#define    SPELL_WING_CLIP                    66207
#define    SPELL_DISENGAGE                    65869 
#define    SPELL_WYVERN_STING                65877 
#define    SPELL_STEADY_SHOT                65867
#define    SPELL_EXPLOSIVE_SHOT            RAID_MODE(65866,67983,67984,67985)
#define    SPELL_SHOOT                        RAID_MODE(65868,67988,67989,67990)
#define    SPELL_AIMED_SHOT                RAID_MODE(65883,67977,67978,67979)

struct boss_alyssia_moonstalkerAI : public ScriptedAI
{
    boss_alyssia_moonstalkerAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
    }

    ScriptedInstance* m_pInstance;
    bool m_bIsRegularMode;
    //uint32 m_uiPvPTrinket_Timer;
    uint32 m_uiDeterrence_Timer;
    uint32 m_uiCallPet_Timer;
    uint32 m_uiFrostTrap_Timer;
    uint32 m_uiExplosiveShot_Timer;
    uint32 m_uiAimedShot_Timer;
    uint32 m_uiWingClip_Timer;
    uint32 m_uiDisengage_Timer;
    uint32 m_uiShoot_Timer;
    uint32 m_uiWyvernSting_Timer;
    uint32 m_uiSteadyShot_Timer;

    void Reset()
    {
        m_uiDeterrence_Timer = 30000;
        m_uiCallPet_Timer = 1000;
        m_uiFrostTrap_Timer = 3000;
        //m_uiPvPTrinket_Timer = 12000;
        m_uiExplosiveShot_Timer = 10000;
        m_uiAimedShot_Timer = 8000;
        m_uiWingClip_Timer = 15000;
        m_uiDisengage_Timer = 30000;
        m_uiShoot_Timer = 5000;
        m_uiWyvernSting_Timer = 20000;
        m_uiSteadyShot_Timer = 7000;
    }

    void Aggro(Unit* pWho)
    {
        if (!m_pInstance)
            return;
 
        if (m_pInstance->GetBossState(DATA_FACTION_CHAMPIONS) == DONE)
            me->ForcedDespawn();
        else
            m_pInstance->SetBossState(DATA_FACTION_CHAMPIONS, IN_PROGRESS);
    }

    void JustDied(Unit* pKiller)
    {
        if(!m_pInstance)
            return;

        if(!me->FindNearestCreature(34461, 200, true)
        && !me->FindNearestCreature(34460, 200, true)
        && !me->FindNearestCreature(34469, 200, true)
        && !me->FindNearestCreature(34467, 200, true)
        && !me->FindNearestCreature(34468, 200, true)
        && !me->FindNearestCreature(34465, 200, true)
        && !me->FindNearestCreature(34471, 200, true)
        && !me->FindNearestCreature(34466, 200, true)
        && !me->FindNearestCreature(34473, 200, true)
        && !me->FindNearestCreature(34472, 200, true)
        && !me->FindNearestCreature(34463, 200, true)
        && !me->FindNearestCreature(34470, 200, true)
        && !me->FindNearestCreature(34474, 200, true)
        && !me->FindNearestCreature(34475, 200, true))
        {
            m_pInstance->SetBossState(DATA_FACTION_CHAMPIONS, DONE);
        }
    }

    void JustReachedHome()
    {
        m_pInstance->SetData(RESET_TO_FIGHT, DATA_FACTION_CHAMPIONS);
    }

    void KilledUnit(Unit* who)
    {
        if (who->GetTypeId() == TYPEID_PLAYER)
            m_pInstance->SetData(UPDATE_DEATHS_COUNT, 0);
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!UpdateVictim())
            return;
        
        if (m_uiDeterrence_Timer < uiDiff)
        {
            DoCast(me, SPELL_DETERRENCE);
            
            m_uiDeterrence_Timer = 90000;
                
        }else 
            m_uiDeterrence_Timer -= uiDiff;

        if (m_uiCallPet_Timer < uiDiff)
        {
            DoCast(me->getVictim(), SPELL_CALL_PET);
            
            m_uiCallPet_Timer = 600000;
                
        }else 
            m_uiCallPet_Timer -= uiDiff;

        if (m_uiFrostTrap_Timer < uiDiff)
        {
            DoCast(me->getVictim(), SPELL_FROST_TRAP);
                
            m_uiFrostTrap_Timer = 30000;
                
        }else 
            m_uiFrostTrap_Timer -= uiDiff;

        /*if (m_uiPvPTrinket_Timer < uiDiff)
        {
            DoCast(me, SPELL_PvPTrinket);
            
            m_uiPvPTrinket_Timer = 120000;
            
        }else 
            m_uiPvPTrinket_Timer -= uiDiff;*/

        if (m_uiWingClip_Timer < uiDiff)
        {
            DoCast(me->getVictim(), SPELL_WING_CLIP);
                
            m_uiWingClip_Timer = 12000;
                
        }else 
            m_uiWingClip_Timer -= uiDiff;

        if (m_uiDisengage_Timer < uiDiff)
        {
            DoCast(me, SPELL_DISENGAGE);
                
            m_uiDisengage_Timer = 30000;
                
        }else 
            m_uiDisengage_Timer -= uiDiff;

        if (m_uiWyvernSting_Timer < uiDiff)
        {
            if (Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM,0))
                DoCast(pTarget, SPELL_WYVERN_STING);
                
            m_uiWyvernSting_Timer = 60000;
                
        }else 
            m_uiWyvernSting_Timer -= uiDiff;

        if (m_uiExplosiveShot_Timer < uiDiff)
        {
            DoCast(me->getVictim(), SPELL_EXPLOSIVE_SHOT);
            
            m_uiExplosiveShot_Timer = 12000;
            
        }else 
            m_uiExplosiveShot_Timer -= uiDiff;

        if (m_uiAimedShot_Timer < uiDiff)
        {
            DoCast(me->getVictim(), SPELL_AIMED_SHOT);
                
            m_uiAimedShot_Timer = 15000;
                
        }else 
            m_uiAimedShot_Timer -= uiDiff;

        if (m_uiShoot_Timer < uiDiff)
        {
            DoCast(me->getVictim(), SPELL_SHOOT);
                
            m_uiShoot_Timer = 7000;
            
        }else 
            m_uiShoot_Timer -= uiDiff;
            
        if (m_uiSteadyShot_Timer < uiDiff)
        {
            DoCast(me->getVictim(), SPELL_STEADY_SHOT);
                
            m_uiSteadyShot_Timer = 17000;
            
        }else 
            m_uiSteadyShot_Timer -= uiDiff;
        
        DoMeleeAttackIfReady();
    }
};

/********************************/
/* Hunter's Pet - 35610  */
/* Cat                        */
/********************************/

#define    SPELL_CLAW                    RAID_MODE(67793,67980,67981,67982)

struct mob_catAI : public ScriptedAI
{
    mob_catAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
    }

    ScriptedInstance* m_pInstance;
    bool m_bIsRegularMode;
    uint32 m_uiClaw_Timer;
    
    void Reset()
    {
        m_uiClaw_Timer = 5000;
    }

    void Aggro(Unit* pWho)
    {
    }

    void JustDied(Unit* pKiller)
    {
        if(!m_pInstance)
            return;
    }

    void KilledUnit(Unit* who)
    {
        if (who->GetTypeId() == TYPEID_PLAYER)
            m_pInstance->SetData(UPDATE_DEATHS_COUNT, 0);
    }
    
    void UpdateAI(const uint32 uiDiff)
    {
        if (!UpdateVictim())
            return;
            
        if (m_uiClaw_Timer < uiDiff)
        {
            DoCast(me->getVictim(), SPELL_CLAW);
                
            m_uiClaw_Timer = 5000;
            
        }else 
            m_uiClaw_Timer -= uiDiff;
        
        DoMeleeAttackIfReady();
    }
    
};

/********************************/
/* Noozle Whizzlestick - 34468  */
/* Mage                         */
/********************************/

struct boss_noozle_whizzlestickAI : public ScriptedAI
{
    boss_noozle_whizzlestickAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
    }

    ScriptedInstance* m_pInstance;
    bool m_bIsRegularMode;

    void Reset()
    {
    }

    void Aggro(Unit* pWho)
    {
    }

    void JustDied(Unit* pKiller)
    {
        if(!m_pInstance)
            return;

        if(!me->FindNearestCreature(34461, 200, true)
        && !me->FindNearestCreature(34460, 200, true)
        && !me->FindNearestCreature(34469, 200, true)
        && !me->FindNearestCreature(34467, 200, true)
        && !me->FindNearestCreature(34468, 200, true)
        && !me->FindNearestCreature(34465, 200, true)
        && !me->FindNearestCreature(34471, 200, true)
        && !me->FindNearestCreature(34466, 200, true)
        && !me->FindNearestCreature(34473, 200, true)
        && !me->FindNearestCreature(34472, 200, true)
        && !me->FindNearestCreature(34463, 200, true)
        && !me->FindNearestCreature(34470, 200, true)
        && !me->FindNearestCreature(34474, 200, true)
        && !me->FindNearestCreature(34475, 200, true))
        {
            m_pInstance->SetBossState(DATA_FACTION_CHAMPIONS, DONE);
        }
    }

    void JustReachedHome()
    {
        m_pInstance->SetData(RESET_TO_FIGHT, DATA_FACTION_CHAMPIONS);
    }

    void KilledUnit(Unit* who)
    {
        if (who->GetTypeId() == TYPEID_PLAYER)
            m_pInstance->SetData(UPDATE_DEATHS_COUNT, 0);
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!UpdateVictim())
            return;
        
        DoMeleeAttackIfReady();
    }
};
/********************************/
/* Velanaa - 34465              */
/* Paladin                      */
/********************************/

struct boss_velanaaAI : public ScriptedAI
{
    boss_velanaaAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
    }

    ScriptedInstance* m_pInstance;
    bool m_bIsRegularMode;

    void Reset()
    {
    }

    void Aggro(Unit* pWho)
    {
    }

    void JustDied(Unit* pKiller)
    {
        if(!m_pInstance)
            return;

        if(!me->FindNearestCreature(34461, 200, true)
        && !me->FindNearestCreature(34460, 200, true)
        && !me->FindNearestCreature(34469, 200, true)
        && !me->FindNearestCreature(34467, 200, true)
        && !me->FindNearestCreature(34468, 200, true)
        && !me->FindNearestCreature(34465, 200, true)
        && !me->FindNearestCreature(34471, 200, true)
        && !me->FindNearestCreature(34466, 200, true)
        && !me->FindNearestCreature(34473, 200, true)
        && !me->FindNearestCreature(34472, 200, true)
        && !me->FindNearestCreature(34463, 200, true)
        && !me->FindNearestCreature(34470, 200, true)
        && !me->FindNearestCreature(34474, 200, true)
        && !me->FindNearestCreature(34475, 200, true))
        {
            m_pInstance->SetBossState(DATA_FACTION_CHAMPIONS, DONE);
        }
    }

    void JustReachedHome()
    {
        m_pInstance->SetData(RESET_TO_FIGHT, DATA_FACTION_CHAMPIONS);
    }

    void KilledUnit(Unit* who)
    {
        if (who->GetTypeId() == TYPEID_PLAYER)
            m_pInstance->SetData(UPDATE_DEATHS_COUNT, 0);
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!UpdateVictim())
            return;
        
        DoMeleeAttackIfReady();
    }
};
/********************************/
/* Baelnor Lightbearer - 34471  */
/* Paladin                      */
/********************************/

struct boss_baelnor_lightbearerAI : public ScriptedAI
{
    boss_baelnor_lightbearerAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
    }

    ScriptedInstance* m_pInstance;
    bool m_bIsRegularMode;

    void Reset()
    {
    }

    void Aggro(Unit* pWho)
    {
    }

    void JustDied(Unit* pKiller)
    {
        if(!m_pInstance)
            return;

        if(!me->FindNearestCreature(34461, 200, true)
        && !me->FindNearestCreature(34460, 200, true)
        && !me->FindNearestCreature(34469, 200, true)
        && !me->FindNearestCreature(34467, 200, true)
        && !me->FindNearestCreature(34468, 200, true)
        && !me->FindNearestCreature(34465, 200, true)
        && !me->FindNearestCreature(34471, 200, true)
        && !me->FindNearestCreature(34466, 200, true)
        && !me->FindNearestCreature(34473, 200, true)
        && !me->FindNearestCreature(34472, 200, true)
        && !me->FindNearestCreature(34463, 200, true)
        && !me->FindNearestCreature(34470, 200, true)
        && !me->FindNearestCreature(34474, 200, true)
        && !me->FindNearestCreature(34475, 200, true))
        {
            m_pInstance->SetBossState(DATA_FACTION_CHAMPIONS, DONE);
        }
    }

    void JustReachedHome()
    {
        m_pInstance->SetData(RESET_TO_FIGHT, DATA_FACTION_CHAMPIONS);
    }

    void KilledUnit(Unit* who)
    {
        if (who->GetTypeId() == TYPEID_PLAYER)
            m_pInstance->SetData(UPDATE_DEATHS_COUNT, 0);
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!UpdateVictim())
            return;
        
        DoMeleeAttackIfReady();
    }
};
/********************************/
/* Anthar Forgemender - 34466   */
/* Priest                       */
/********************************/

struct boss_anthar_forgemenderAI : public ScriptedAI
{
    boss_anthar_forgemenderAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
    }

    ScriptedInstance* m_pInstance;
    bool m_bIsRegularMode;

    void Reset()
    {
    }

    void Aggro(Unit* pWho)
    {
    }

    void JustDied(Unit* pKiller)
    {
        if(!m_pInstance)
            return;

        if(!me->FindNearestCreature(34461, 200, true)
        && !me->FindNearestCreature(34460, 200, true)
        && !me->FindNearestCreature(34469, 200, true)
        && !me->FindNearestCreature(34467, 200, true)
        && !me->FindNearestCreature(34468, 200, true)
        && !me->FindNearestCreature(34465, 200, true)
        && !me->FindNearestCreature(34471, 200, true)
        && !me->FindNearestCreature(34466, 200, true)
        && !me->FindNearestCreature(34473, 200, true)
        && !me->FindNearestCreature(34472, 200, true)
        && !me->FindNearestCreature(34463, 200, true)
        && !me->FindNearestCreature(34470, 200, true)
        && !me->FindNearestCreature(34474, 200, true)
        && !me->FindNearestCreature(34475, 200, true))
        {
            m_pInstance->SetBossState(DATA_FACTION_CHAMPIONS, DONE);
        }
    }

    void JustReachedHome()
    {
        m_pInstance->SetData(RESET_TO_FIGHT, DATA_FACTION_CHAMPIONS);
    }

    void KilledUnit(Unit* who)
    {
        if (who->GetTypeId() == TYPEID_PLAYER)
            m_pInstance->SetData(UPDATE_DEATHS_COUNT, 0);
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!UpdateVictim())
            return;
        
        DoMeleeAttackIfReady();
    }
};
/********************************/
/* Brienna Nightfell - 34473    */
/* Priest                       */
/********************************/

struct boss_brienna_nightfellAI : public ScriptedAI
{
    boss_brienna_nightfellAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
    }

    ScriptedInstance* m_pInstance;
    bool m_bIsRegularMode;

    void Reset()
    {
    }

    void Aggro(Unit* pWho)
    {
    }

    void JustDied(Unit* pKiller)
    {
        if(!m_pInstance)
            return;

        if(!me->FindNearestCreature(34461, 200, true)
        && !me->FindNearestCreature(34460, 200, true)
        && !me->FindNearestCreature(34469, 200, true)
        && !me->FindNearestCreature(34467, 200, true)
        && !me->FindNearestCreature(34468, 200, true)
        && !me->FindNearestCreature(34465, 200, true)
        && !me->FindNearestCreature(34471, 200, true)
        && !me->FindNearestCreature(34466, 200, true)
        && !me->FindNearestCreature(34473, 200, true)
        && !me->FindNearestCreature(34472, 200, true)
        && !me->FindNearestCreature(34463, 200, true)
        && !me->FindNearestCreature(34470, 200, true)
        && !me->FindNearestCreature(34474, 200, true)
        && !me->FindNearestCreature(34475, 200, true))
        {
            m_pInstance->SetBossState(DATA_FACTION_CHAMPIONS, DONE);
        }
    }

    void JustReachedHome()
    {
        m_pInstance->SetData(RESET_TO_FIGHT, DATA_FACTION_CHAMPIONS);
    }

    void KilledUnit(Unit* who)
    {
        if (who->GetTypeId() == TYPEID_PLAYER)
            m_pInstance->SetData(UPDATE_DEATHS_COUNT, 0);
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!UpdateVictim())
            return;
        
        DoMeleeAttackIfReady();
    }
};
/********************************/
/* Irieth Shadowstep - 34472    */
/* Rogue                        */
/********************************/

#define    SPELL_BLADE_FLURRY                65956
#define    SPELL_BLIND                        65960
#define    SPELL_CLOAK_OF_SHADOWS            65961
#define    SPELL_HEMORRHAGE                65954
/*
#define    SPELL_EVISCERATE_10N            65957
#define    SPELL_EVISCERATE_10H            68095
#define    SPELL_EVISCERATE_25N            68094
#define    SPELL_EVISCERATE_25H            68096
#define    SPELL_FAN_OF_KNIVES_10N            65955
#define    SPELL_FAN_OF_KNIVES_10H            68098
#define    SPELL_FAN_OF_KNIVES_25N            68097 
#define    SPELL_FAN_OF_KNIVES_25H            68099
*/
#define    SPELL_SHADOWSTEP                66178
#define    SPELL_FAN_OF_KNIVES                RAID_MODE(65955,68097,68098,68099)
#define    SPELL_EVISCERATE                RAID_MODE(65957,68094,68095,68096)

struct boss_irieth_shadowstepeAI : public ScriptedAI
{
    boss_irieth_shadowstepeAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
    }

    ScriptedInstance* m_pInstance;
    bool m_bIsRegularMode;
    //uint32 PvPTrinket_Timer;
    uint32 m_uiBladeFlurry_Timer;
    uint32 m_uiBlind_Timer;
    uint32 m_uiCloakofShadows_Timer;
    uint32 m_uiHemorrhage_Timer;
    uint32 m_uiEviscerate_Timer;
    uint32 m_uiFanofKnives_Timer;
    uint32 m_uiShadowstep_Timer;
    
    void Reset()
    {
        me->SetRespawnDelay(1);
        //PvPTrinket_Timer = 12000;
        m_uiBladeFlurry_Timer = 15000;
        m_uiBlind_Timer = 27000;
        m_uiCloakofShadows_Timer = 30000;
        m_uiHemorrhage_Timer = 20000;
        m_uiEviscerate_Timer = 25000;
        m_uiFanofKnives_Timer = 10000;
        m_uiShadowstep_Timer = 7000;
    }

    
    void Aggro(Unit* pWho)
    {
        if (!m_pInstance)
            return;
            
        if (m_pInstance->GetBossState(DATA_FACTION_CHAMPIONS) == DONE)
            me->ForcedDespawn();
        else
            m_pInstance->SetBossState(DATA_FACTION_CHAMPIONS, IN_PROGRESS);
    }

    void JustDied(Unit* pKiller)
    {
        if(!m_pInstance)
            return;

        if(!me->FindNearestCreature(34461, 200, true)
        && !me->FindNearestCreature(34460, 200, true)
        && !me->FindNearestCreature(34469, 200, true)
        && !me->FindNearestCreature(34467, 200, true)
        && !me->FindNearestCreature(34468, 200, true)
        && !me->FindNearestCreature(34465, 200, true)
        && !me->FindNearestCreature(34471, 200, true)
        && !me->FindNearestCreature(34466, 200, true)
        && !me->FindNearestCreature(34473, 200, true)
        && !me->FindNearestCreature(34472, 200, true)
        && !me->FindNearestCreature(34463, 200, true)
        && !me->FindNearestCreature(34470, 200, true)
        && !me->FindNearestCreature(34474, 200, true)
        && !me->FindNearestCreature(34475, 200, true))
        {
            m_pInstance->SetBossState(DATA_FACTION_CHAMPIONS, DONE);
        }
    }

    void JustReachedHome()
    {
        m_pInstance->SetData(RESET_TO_FIGHT, DATA_FACTION_CHAMPIONS);
    }

    void KilledUnit(Unit* who)
    {
        if (who->GetTypeId() == TYPEID_PLAYER)
            m_pInstance->SetData(UPDATE_DEATHS_COUNT, 0);
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!UpdateVictim())
            return;
            
        /*if (m_uiPvPTrinket_Timer < uiDiff)
        {
            DoCast(me, SPELL_PVP_TRINKET);
            
            m_uiPvPTrinket_Timer = 120000;
            
        }else 
            m_uiPvPTrinket_Timer -= uiDiff;*/

        if (m_uiBladeFlurry_Timer < uiDiff)
        {
            DoCast(me, SPELL_BLADE_FLURRY);
            
            m_uiBladeFlurry_Timer = 120000;
            
        }else 
            m_uiBladeFlurry_Timer -= uiDiff;

        if (m_uiBlind_Timer < uiDiff)
        {
            DoCast(me, SPELL_BLIND);
                
            m_uiBlind_Timer = 120000;
            
        }else 
            m_uiBlind_Timer -= uiDiff;

        if (m_uiCloakofShadows_Timer < uiDiff)
        {
            DoCast(me, SPELL_CLOAK_OF_SHADOWS);
            
            m_uiCloakofShadows_Timer = 90000;
            
        }else 
            m_uiCloakofShadows_Timer -= uiDiff;

        if (m_uiHemorrhage_Timer < uiDiff)
        {
            DoCast(me->getVictim(), SPELL_HEMORRHAGE);
                
            m_uiHemorrhage_Timer = 30000;
            
        }else 
            m_uiHemorrhage_Timer -= uiDiff;

        if (m_uiEviscerate_Timer < uiDiff)
        {
            DoCast(me->getVictim(), SPELL_EVISCERATE);
            
            m_uiEviscerate_Timer = 30000;
            
        }else 
            m_uiEviscerate_Timer -= uiDiff;

        if (m_uiFanofKnives_Timer < uiDiff)
        {
            DoCast(me->getVictim(), SPELL_FAN_OF_KNIVES);
                
            m_uiFanofKnives_Timer = 10000;
            
        }else 
            m_uiFanofKnives_Timer -= uiDiff;

        if (m_uiShadowstep_Timer < uiDiff)
        {
            DoCast(me->getVictim(), SPELL_SHADOWSTEP);
            
            m_uiShadowstep_Timer = 30000;
            
        }else 
            m_uiShadowstep_Timer -= uiDiff;
        
        DoMeleeAttackIfReady();
    }
};
/********************************/
/* Shaabad - 34463              */
/* Shaman                       */
/********************************/

struct boss_shaabadAI : public ScriptedAI
{
    boss_shaabadAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
    }

    ScriptedInstance* m_pInstance;
    bool m_bIsRegularMode;

    void Reset()
    {
    }

    void Aggro(Unit* pWho)
    {
    }

    void JustDied(Unit* pKiller)
    {
        if(!m_pInstance)
            return;

        if(!me->FindNearestCreature(34461, 200, true)
        && !me->FindNearestCreature(34460, 200, true)
        && !me->FindNearestCreature(34469, 200, true)
        && !me->FindNearestCreature(34467, 200, true)
        && !me->FindNearestCreature(34468, 200, true)
        && !me->FindNearestCreature(34465, 200, true)
        && !me->FindNearestCreature(34471, 200, true)
        && !me->FindNearestCreature(34466, 200, true)
        && !me->FindNearestCreature(34473, 200, true)
        && !me->FindNearestCreature(34472, 200, true)
        && !me->FindNearestCreature(34463, 200, true)
        && !me->FindNearestCreature(34470, 200, true)
        && !me->FindNearestCreature(34474, 200, true)
        && !me->FindNearestCreature(34475, 200, true))
        {
            m_pInstance->SetBossState(DATA_FACTION_CHAMPIONS, DONE);
        }
    }

    void JustReachedHome()
    {
        m_pInstance->SetData(RESET_TO_FIGHT, DATA_FACTION_CHAMPIONS);
    }

    void KilledUnit(Unit* who)
    {
        if (who->GetTypeId() == TYPEID_PLAYER)
            m_pInstance->SetData(UPDATE_DEATHS_COUNT, 0);
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!UpdateVictim())
            return;
        
        DoMeleeAttackIfReady();
    }
};
/********************************/
/* Saamul - 34470               */
/* Shaman                       */
/********************************/

struct boss_saamulAI : public ScriptedAI
{
    boss_saamulAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
    }

    ScriptedInstance* m_pInstance;
    bool m_bIsRegularMode;

    void Reset()
    {
    }

    void Aggro(Unit* pWho)
    {
    }

    void JustDied(Unit* pKiller)
    {
        if(!m_pInstance)
            return;

        if(!me->FindNearestCreature(34461, 200, true)
        && !me->FindNearestCreature(34460, 200, true)
        && !me->FindNearestCreature(34469, 200, true)
        && !me->FindNearestCreature(34467, 200, true)
        && !me->FindNearestCreature(34468, 200, true)
        && !me->FindNearestCreature(34465, 200, true)
        && !me->FindNearestCreature(34471, 200, true)
        && !me->FindNearestCreature(34466, 200, true)
        && !me->FindNearestCreature(34473, 200, true)
        && !me->FindNearestCreature(34472, 200, true)
        && !me->FindNearestCreature(34463, 200, true)
        && !me->FindNearestCreature(34470, 200, true)
        && !me->FindNearestCreature(34474, 200, true)
        && !me->FindNearestCreature(34475, 200, true))
        {
            m_pInstance->SetBossState(DATA_FACTION_CHAMPIONS, DONE);
        }
    }

    void JustReachedHome()
    {
        m_pInstance->SetData(RESET_TO_FIGHT, DATA_FACTION_CHAMPIONS);
    }

    void KilledUnit(Unit* who)
    {
        if (who->GetTypeId() == TYPEID_PLAYER)
            m_pInstance->SetData(UPDATE_DEATHS_COUNT, 0);
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!UpdateVictim())
            return;
        
        DoMeleeAttackIfReady();
    }
};
/********************************/
/* Serissa Grimdabbler - 34474  */
/* Warlock                      */
/********************************/

struct boss_serissa_grimdabblerAI : public ScriptedAI
{
    boss_serissa_grimdabblerAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
    }

    ScriptedInstance* m_pInstance;
    bool m_bIsRegularMode;

    void Reset()
    {
    }

    void Aggro(Unit* pWho)
    {
    }

    void JustDied(Unit* pKiller)
    {
        if(!m_pInstance)
            return;

        if(!me->FindNearestCreature(34461, 200, true)
        && !me->FindNearestCreature(34460, 200, true)
        && !me->FindNearestCreature(34469, 200, true)
        && !me->FindNearestCreature(34467, 200, true)
        && !me->FindNearestCreature(34468, 200, true)
        && !me->FindNearestCreature(34465, 200, true)
        && !me->FindNearestCreature(34471, 200, true)
        && !me->FindNearestCreature(34466, 200, true)
        && !me->FindNearestCreature(34473, 200, true)
        && !me->FindNearestCreature(34472, 200, true)
        && !me->FindNearestCreature(34463, 200, true)
        && !me->FindNearestCreature(34470, 200, true)
        && !me->FindNearestCreature(34474, 200, true)
        && !me->FindNearestCreature(34475, 200, true))
        {
            m_pInstance->SetBossState(DATA_FACTION_CHAMPIONS, DONE);
        }
    }

    void JustReachedHome()
    {
        m_pInstance->SetData(RESET_TO_FIGHT, DATA_FACTION_CHAMPIONS);
    }

    void KilledUnit(Unit* who)
    {
        if (who->GetTypeId() == TYPEID_PLAYER)
            m_pInstance->SetData(UPDATE_DEATHS_COUNT, 0);
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!UpdateVictim())
            return;
        
        DoMeleeAttackIfReady();
    }
};
/********************************/
/* Shocuul - 34475              */
/* Warrior                      */
/********************************/

struct boss_shocuulAI : public ScriptedAI
{
    boss_shocuulAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
    }

    ScriptedInstance* m_pInstance;
    bool m_bIsRegularMode;

    void Reset()
    {
    }

    void Aggro(Unit* pWho)
    {
    }

    void JustDied(Unit* pKiller)
    {
        if(!m_pInstance)
            return;

        if(!me->FindNearestCreature(34461, 200, true)
        && !me->FindNearestCreature(34460, 200, true)
        && !me->FindNearestCreature(34469, 200, true)
        && !me->FindNearestCreature(34467, 200, true)
        && !me->FindNearestCreature(34468, 200, true)
        && !me->FindNearestCreature(34465, 200, true)
        && !me->FindNearestCreature(34471, 200, true)
        && !me->FindNearestCreature(34466, 200, true)
        && !me->FindNearestCreature(34473, 200, true)
        && !me->FindNearestCreature(34472, 200, true)
        && !me->FindNearestCreature(34463, 200, true)
        && !me->FindNearestCreature(34470, 200, true)
        && !me->FindNearestCreature(34474, 200, true)
        && !me->FindNearestCreature(34475, 200, true))
        {
            m_pInstance->SetBossState(DATA_FACTION_CHAMPIONS, DONE);
        }
    }

    void JustReachedHome()
    {
        m_pInstance->SetData(RESET_TO_FIGHT, DATA_FACTION_CHAMPIONS);
    }

    void KilledUnit(Unit* who)
    {
        if (who->GetTypeId() == TYPEID_PLAYER)
            m_pInstance->SetData(UPDATE_DEATHS_COUNT, 0);
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!UpdateVictim())
            return;
        
        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_boss_tyrius_duskblade(Creature* pCreature)
{
    return new boss_tyrius_duskbladeAI(pCreature);
}

CreatureAI* GetAI_boss_kavina_grovesong(Creature* pCreature)
{
    return new boss_kavina_grovesongAI(pCreature);
}

CreatureAI* GetAI_boss_melador_valestrider(Creature* pCreature)
{
    return new boss_melador_valestriderAI(pCreature);
}

CreatureAI* GetAI_boss_alyssia_moonstalker(Creature* pCreature)
{
    return new boss_alyssia_moonstalkerAI(pCreature);
}

CreatureAI* GetAI_mob_cat(Creature* pCreature)
{
    return new mob_catAI(pCreature);
}

CreatureAI* GetAI_boss_noozle_whizzlestick(Creature* pCreature)
{
    return new boss_noozle_whizzlestickAI(pCreature);
}

CreatureAI* GetAI_boss_velanaa(Creature* pCreature)
{
    return new boss_velanaaAI(pCreature);
}

CreatureAI* GetAI_boss_baelnor_lightbearer(Creature* pCreature)
{
    return new boss_baelnor_lightbearerAI(pCreature);
}

CreatureAI* GetAI_boss_anthar_forgemender(Creature* pCreature)
{
    return new boss_anthar_forgemenderAI(pCreature);
}

CreatureAI* GetAI_boss_brienna_nightfell(Creature* pCreature)
{
    return new boss_brienna_nightfellAI(pCreature);
}

CreatureAI* GetAI_boss_irieth_shadowstepe(Creature* pCreature)
{
    return new boss_irieth_shadowstepeAI(pCreature);
}

CreatureAI* GetAI_boss_shaabad(Creature* pCreature)
{
    return new boss_shaabadAI(pCreature);
}

CreatureAI* GetAI_boss_saamul(Creature* pCreature)
{
    return new boss_saamulAI(pCreature);
}

CreatureAI* GetAI_boss_serissa_grimdabbler(Creature* pCreature)
{
    return new boss_serissa_grimdabblerAI(pCreature);
}

CreatureAI* GetAI_boss_shocuul(Creature* pCreature)
{
    return new boss_shocuulAI(pCreature);
}

void AddSC_boss_tc_alliance_champions()
{
    Script* NewScript;

    NewScript = new Script;
    NewScript->Name = "boss_tyrius_duskblade";
    NewScript->GetAI = &GetAI_boss_tyrius_duskblade;
    NewScript->RegisterSelf();

    NewScript = new Script;
    NewScript->Name = "boss_kavina_grovesong";
    NewScript->GetAI = &GetAI_boss_kavina_grovesong;
    NewScript->RegisterSelf();

    NewScript = new Script;
    NewScript->Name = "boss_melador_valestrider";
    NewScript->GetAI = &GetAI_boss_melador_valestrider;
    NewScript->RegisterSelf();

    NewScript = new Script;
    NewScript->Name = "boss_alyssia_moonstalker";
    NewScript->GetAI = &GetAI_boss_alyssia_moonstalker;
    NewScript->RegisterSelf();
    
    NewScript = new Script;
    NewScript->Name = "mob_cat";
    NewScript->GetAI = &GetAI_mob_cat;
    NewScript->RegisterSelf();

    NewScript = new Script;
    NewScript->Name = "boss_noozle_whizzlestick";
    NewScript->GetAI = &GetAI_boss_noozle_whizzlestick;
    NewScript->RegisterSelf();

    NewScript = new Script;
    NewScript->Name = "boss_velanaa";
    NewScript->GetAI = &GetAI_boss_velanaa;
    NewScript->RegisterSelf();

    NewScript = new Script;
    NewScript->Name = "boss_baelnor_lightbearer";
    NewScript->GetAI = &GetAI_boss_baelnor_lightbearer;
    NewScript->RegisterSelf();

    NewScript = new Script;
    NewScript->Name = "boss_anthar_forgemender";
    NewScript->GetAI = &GetAI_boss_anthar_forgemender;
    NewScript->RegisterSelf();

    NewScript = new Script;
    NewScript->Name = "boss_brienna_nightfell";
    NewScript->GetAI = &GetAI_boss_brienna_nightfell;
    NewScript->RegisterSelf();

    NewScript = new Script;
    NewScript->Name = "boss_irieth_shadowstepe";
    NewScript->GetAI = &GetAI_boss_irieth_shadowstepe;
    NewScript->RegisterSelf();

    NewScript = new Script;
    NewScript->Name = "boss_shaabad";
    NewScript->GetAI = &GetAI_boss_shaabad;
    NewScript->RegisterSelf();

    NewScript = new Script;
    NewScript->Name = "boss_saamul";
    NewScript->GetAI = &GetAI_boss_saamul;
    NewScript->RegisterSelf();

    NewScript = new Script;
    NewScript->Name = "boss_serissa_grimdabbler";
    NewScript->GetAI = &GetAI_boss_serissa_grimdabbler;
    NewScript->RegisterSelf();

    NewScript = new Script;
    NewScript->Name = "boss_shocuul";
    NewScript->GetAI = &GetAI_boss_shocuul;
    NewScript->RegisterSelf();
}