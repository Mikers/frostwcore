/*
 * Copyright (C) 2010 Dj_Stels <djstels@mail.ru>
 */

/*
* TODO:
* - handle snobold's fire bomb, [DONE]
* - fix acidmaw's paralitic toxin, [NOT DONE]
* - fix jormungars "static" phase also burrow break and adds, [DONE/DONE/NOT DONE]
* - fix icehowl charge and also add "on stun's remove" speed buff,
* - fix jaraxxus' adds (sisters and volcans), [+/- DONE]
* - write/rewrite champions, [+/- DONE]
* - fix valkyr's timers to prevent begining event while casting spell, [DONE]
* - handle "Powering Up"'s effect (stacking on absorbing dmg), [+/- DONE]
* - [visual] handle model changes effect of Light/Dark Essence, [NOT DONE]
* - summon Anub's adds, [DONE]
* - handle Anub's leeching swarm spells effect, [NOT DONE]
* - handle Anub's spike, [NOT DONE]
* - add missing cache after defeating Anub, [DONE]
*
* - ACHIEVEMENTS. [DONE]
*/

#include "ScriptPCH.h"
#include "trial_of_the_crusader.h"

enum Says
{
    SAY_BEASTS_GORMOK       = -1760000,
    SAY_BEASTS_JORMUNGARS   = -1760001,
    SAY_BEASTS_ICEHOWL      = -1760002,

    SAY_JARAXXUS_INTRO_1    = -1760004,
    SAY_JARAXXUS_INTRO_2    = -1760005,
    SAY_JARAXXUS_INTRO_3    = -1760006,
    SAY_JARAXXUS_INTRO_4    = -1760007,
    SAY_JARAXXUS_INTRO_5    = -1760008,
    SAY_JARAXXUS_INTRO_6    = -1760009,
    SAY_JARAXXUS_INTRO_7    = -1760010,

    SAY_JARAXXUS_OUTRO_1    = -1760018,
    SAY_JARAXXUS_OUTRO_2    = -1760019,
    SAY_JARAXXUS_OUTRO_3    = -1760020,
    SAY_JARAXXUS_OUTRO_4    = -1760021,

    SAY_CHAMPIONS_INTROH_1  = -1760022,
    SAY_CHAMPIONS_INTROA_1  = -1760022,
    SAY_CHAMPIONS_INTROA_2  = -1760023,
    SAY_CHAMPIONS_INTROH_2  = -1760024,
    SAY_CHAMPIONS_INTROH_3  = -1760025,
    SAY_CHAMPIONS_INTROA_3  = -1760025,
    SAY_CHAMPIONS_INTROA_4  = -1760026,
    SAY_CHAMPIONS_INTROH_4  = -1760027,

    SAY_CHAMPIONS_OUTRO     = -1760039,

    SAY_TWINS_INTRO_1       = -1760040,
    SAY_TWINS_INTRO_2       = -1760041,

    SAY_TWINS_OUTRO         = -1760058,

    SAY_ANUB_INTRO_1        = -1760059,
    SAY_ANUB_INTRO_2        = -1760060,
    SAY_ANUB_INTRO_3        = -1760061,
    SAY_ANUB_INTRO_4        = -1760062,
    SAY_ANUB_INTRO_5        = -1760063,

    SAY_ANUB_OUTRO          = -1760071
};

Position positionSpawnBeasts        = { 563.449036, 221.046951, 394.696320, 4.753102 };
Position positionSpawnBeastsLeft    = { 556.771118, 221.083862, 394.696320, 4.753102 };
Position positionSpawnBeastsRight   = { 569.916931, 221.011200, 394.696320, 4.753102 };
Position positionMoveBeasts         = { 563.783936, 172.178909, 394.436584, 4.728253 };
Position positionMoveBeastsLeft     = { 554.333557, 175.043610, 394.803589, 4.438710 };
Position positionMoveBeastsRight    = { 574.216431, 174.672394, 394.802795, 4.670400 };
Position positionCenter             = { 563.800964, 140.557205, 393.957205, 4.700161 };
Position positionTirionRelocate     = { 690.230408, 141.717117, 142.148895, 6.148393 };
Position positionPortalSpawn        = { 677.135498, 130.135345, 142.123535, 6.128760 };
Position positionGnomEnter          = { 564.215942, 148.305939, 394.039246, 4.666639 };
Position positionJaraxxusSummon     = { 563.767639, 128.735519, 394.039215, 1.535515 };


Position AllyChampionsEnter[10]  =
{
    { 616.278076, 137.326508, 395.243225, 3.045343 },
    { 616.613098, 140.796371, 395.247955, 3.045343 },
    { 613.833984, 144.433746, 395.237885, 3.049270 },
    { 612.967957, 135.079758, 395.241821, 3.049270 },
    { 611.324707, 137.977295, 395.247955, 3.061051 },
    { 611.448120, 141.866608, 395.247711, 3.147445 },
    { 615.436157, 139.114532, 395.259827, 3.119956 },
    { 617.680786, 131.650848, 395.220215, 3.061051 },
    { 616.449768, 148.894180, 395.229095, 3.072832 },
    { 622.792908, 139.316803, 395.260101, 3.147445 }
};

Position HordeChampionsEnter[10] =
{
    { 511.680023, 141.800217, 395.239777, 6.056552 },
    { 511.073547, 138.317688, 395.251678, 6.115457 },
    { 513.268250, 144.702560, 395.236938, 6.146870 },
    { 512.882202, 134.244919, 395.234497, 6.256824 },
    { 516.797974, 135.115753, 395.255585, 0.012908 },
    { 517.336060, 140.881577, 395.254211, 0.041182 },
    { 515.247925, 138.992340, 395.258514, 0.017611 },
    { 507.589478, 139.128632, 395.259857, 0.041170 },
    { 512.324036, 130.595093, 395.238464, 0.204556 },
    { 517.693970, 145.195480, 395.259247, 0.072586 }
};

struct toc_tirion_fordringAI : public ScriptedAI
{
    toc_tirion_fordringAI(Creature* creature) : ScriptedAI(creature)
    {
        Instance = creature->GetInstanceData();
        Reset();
    }

    InstanceData* Instance;
    bool started;

    bool gormokDefeted;
    bool jormungarsDefeted;

    uint32 boss_nr;

    uint32 text_nr;
    uint32 timer;

    bool openGate;
    uint32 gateTimer;
    uint32 heroBeastsTimer;

    void Reset()
    {
        started = false;
        gormokDefeted = false;
        jormungarsDefeted = false;
        boss_nr = 0;
        text_nr = 0;
        timer = 5000;
        openGate = false;
        gateTimer = 5000;
        heroBeastsTimer = 180000;
    }

    void UpdateAI(const uint32 diff)
    {
        if (!Instance)
            return;

        if (!started && boss_nr == 1)
            heroBeastsTimer = 180000;

        if (openGate)
        {
            if (gateTimer < diff)
            {
                Instance->DoUseDoorOrButton(Instance->GetData64(MAIN_GATE));
                openGate = false;
                gateTimer = 5000;
            } else gateTimer -= diff;
        }

        if (started && (getDifficulty() == 2 || getDifficulty() == 3) && boss_nr == 1)
        {
            if (!gormokDefeted)
            {
                if (heroBeastsTimer < diff)
                {
                    gormokDefeted = true;
                    heroBeastsTimer = 180000;
                } else heroBeastsTimer -= diff;
            }
            else if (!jormungarsDefeted)
            {
                if (heroBeastsTimer < diff)
                {
                    jormungarsDefeted = true;
                    heroBeastsTimer = 180000;
                } else heroBeastsTimer -= diff;
            }
        }

        UpdateBosses();

        if (started)
        {
            if (boss_nr == 0)
                boss_nr = 1;
            if (text_nr == 0)
                text_nr = 1;

            switch (boss_nr)
            {
            case 1:
                //beasts introes
                if (text_nr == 1)
                {
                    if (timer < diff)
                    {
                        ++text_nr;
                        timer = 8000;

                        me->MonsterYell(SAY_BEASTS_GORMOK, LANG_UNIVERSAL, 0);
                        Instance->DoUseDoorOrButton(Instance->GetData64(MAIN_GATE));
                        openGate = true;
                        if (Creature* gormok = me->GetMap()->SummonCreature(NPC_GORMOK, positionSpawnBeasts))
                        {
                            gormok->GetMotionMaster()->MovePoint(0, positionMoveBeasts);
                            gormok->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                            gormok->SetReactState(REACT_PASSIVE);
                        }
                    } else timer -= diff;
                }

                if (text_nr == 2)
                {
                    if (timer < diff)
                    {
                        ++text_nr;
                        timer = 5000;
                        if (Creature* gormok = ObjectAccessor::GetCreatureOrPetOrVehicle((*me), Instance->GetData64(BOSS_GORMOK)))
                        {
                            gormok->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                            gormok->SetReactState(REACT_AGGRESSIVE);
                            if (Unit* target = GetRandomPlayerFromMap())
                                gormok->AI()->AttackStart(target);
                        }
                    } else timer -= diff;
                }

                if (gormokDefeted && text_nr == 3)
                {
                    if (timer < diff)
                    {
                        ++text_nr;
                        timer = 8000;

                        DoScriptText(SAY_BEASTS_JORMUNGARS, me);
                        Instance->DoUseDoorOrButton(Instance->GetData64(MAIN_GATE));
                        openGate = true;
                        if (Creature* dreadscale = me->GetMap()->SummonCreature(NPC_DREADSCALE, positionSpawnBeasts))
                        {
                            dreadscale->GetMotionMaster()->MovePoint(0, positionMoveBeasts);
                            dreadscale->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                            dreadscale->SetReactState(REACT_PASSIVE);
                        }
                        if (Creature* acidmaw = me->GetMap()->SummonCreature(NPC_ACIDMAW, positionSpawnBeastsLeft))
                        {
                            acidmaw->GetMotionMaster()->MovePoint(0, positionMoveBeastsLeft);
                            acidmaw->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                            acidmaw->SetReactState(REACT_PASSIVE);
                        }
                    } else timer -= diff;
                }

                if (text_nr == 4)
                {
                    if (timer < diff)
                    {
                        ++text_nr;
                        timer = 5000;
                        if (Creature* acidmaw = ObjectAccessor::GetCreatureOrPetOrVehicle((*me), Instance->GetData64(BOSS_ACIDMAW)))
                        {
                            acidmaw->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                            acidmaw->SetReactState(REACT_AGGRESSIVE);
                            if (Unit* target = GetRandomPlayerFromMap())
                                acidmaw->AI()->AttackStart(target);
                        }
                        if (Creature* dreadscale = ObjectAccessor::GetCreatureOrPetOrVehicle((*me), Instance->GetData64(BOSS_DREADSCALE)))
                        {
                            dreadscale->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                            dreadscale->SetReactState(REACT_AGGRESSIVE);
                            if (Unit* target = GetRandomPlayerFromMap())
                                dreadscale->AI()->AttackStart(target);
                        }
                    } else timer -= diff;
                }

                if (jormungarsDefeted && text_nr == 5)
                {
                    if (timer < diff)
                    {
                        ++text_nr;
                        timer = 8000;

                        DoScriptText(SAY_BEASTS_ICEHOWL, me);
                        Instance->DoUseDoorOrButton(Instance->GetData64(MAIN_GATE));
                        openGate = true;
                        if (Creature* icehowl = me->GetMap()->SummonCreature(NPC_ICEHOWL, positionSpawnBeasts))
                        {
                            icehowl->GetMotionMaster()->MovePoint(0, positionMoveBeasts);
                            icehowl->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                            icehowl->SetReactState(REACT_PASSIVE);
                        }

                        break;

                    } else timer -= diff;
                }

                if (text_nr == 6)
                {
                    if (timer < diff)
                    {
                        ++text_nr;
                        timer = 5000;
                        if (Creature* icehowl = ObjectAccessor::GetCreatureOrPetOrVehicle((*me), Instance->GetData64(BOSS_ICEHOWL)))
                        {
                            icehowl->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                            icehowl->SetReactState(REACT_AGGRESSIVE);
                            if (Unit* target = GetRandomPlayerFromMap())
                                icehowl->AI()->AttackStart(target);
                        }
                    }else timer -= diff;
                }

                break;

            case 2:
                //beasts outro
                if (timer < diff)
                {
                    switch (text_nr)
                    {
                    case 1:
                        if (Creature* gadajacy = ObjectAccessor::GetCreatureOrPetOrVehicle((*me), Instance->GetData64(GADAJACY)))
                        {
                            if (!gadajacy->isAlive())
                                gadajacy->Respawn(true);

                            gadajacy->SetVisibility(VISIBILITY_ON);
                        }

                        ++boss_nr;//switch to next boss' intro and wait for player (started == true)
                        text_nr=0;
                        timer = 5000;
                        started = false;
                        break;
                    }
                } else timer -= diff;
                break;

            case 3:
                //Jaraxxus intro
                if (timer < diff)
                {
                    switch (text_nr)
                    {
                    case 1:
                        DoScriptText(SAY_JARAXXUS_INTRO_1, me);

                        for (int i=BOSS_GORMOK; i<=BOSS_ICEHOWL; ++i)
                        {
                            if (Creature* boss = ObjectAccessor::GetCreatureOrPetOrVehicle((*me), Instance->GetData64(i)))
                                boss->ForcedDespawn();
                        }

                        if (GameObject* go = me->GetMap()->GetGameObject(Instance->GetData64(CHAMPIONS_CACHE)))
                            go->Delete();

                        ++text_nr;
                        timer = 10000;
                        break;

                    case 2:
                        if (Creature* gnomLock = ObjectAccessor::GetCreatureOrPetOrVehicle((*me), Instance->GetData64(GNOM_WARLOCK)))
                        {
                            if (!gnomLock->isAlive())
                                gnomLock->Respawn(true);

                            gnomLock->SetVisibility(VISIBILITY_ON);
                            gnomLock->NearTeleportTo(positionSpawnBeasts.GetPositionX(), positionSpawnBeasts.GetPositionY(), positionSpawnBeasts.GetPositionZ(), positionSpawnBeasts.GetOrientation());
                            gnomLock->GetMotionMaster()->MovePoint(0, positionGnomEnter);
                            Instance->DoUseDoorOrButton(Instance->GetData64(MAIN_GATE));
                            openGate = true;
                        }
                        ++text_nr;
                        timer = 11000;
                        break;

                    case 3:
                        if (Creature* gnomLock = ObjectAccessor::GetCreatureOrPetOrVehicle((*me), Instance->GetData64(GNOM_WARLOCK)))
                        {
                            DoScriptText(SAY_JARAXXUS_INTRO_2, gnomLock);
                            gnomLock->HandleEmoteCommand(EMOTE_ONESHOT_BOW);
                        }
                        ++text_nr;
                        timer = 11000;
                        break;
                        
                    case 4:
                        if (Creature* gnomLock = ObjectAccessor::GetCreatureOrPetOrVehicle((*me), Instance->GetData64(GNOM_WARLOCK)))
                            DoScriptText(SAY_JARAXXUS_INTRO_3, gnomLock);

                        ++text_nr;
                        timer = 6000;
                        break;

                    case 5:
                        if (Creature* jaraxxus = me->GetMap()->SummonCreature(NPC_LORD_JARAXXUS, positionJaraxxusSummon))
                        {
                            jaraxxus->SetReactState(REACT_PASSIVE);
                            jaraxxus->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                            jaraxxus->AttackStop();
                        }
                        ++text_nr;
                        timer = 1000;
                        break;

                    case 6:
                        if (Creature* gnomLock = ObjectAccessor::GetCreatureOrPetOrVehicle((*me), Instance->GetData64(GNOM_WARLOCK)))
                            DoScriptText(SAY_JARAXXUS_INTRO_4, gnomLock);  

                        ++text_nr;
                        timer = 12000;
                        break;

                    case 7:
                        if (Creature* jaraxxus = ObjectAccessor::GetCreatureOrPetOrVehicle((*me), Instance->GetData64(BOSS_JARAXXUS)))
                            DoScriptText(SAY_JARAXXUS_INTRO_5, jaraxxus);

                        ++text_nr;
                        timer = 7000;
                        break;

                    case 8:
                        if (Creature* gnomLock = ObjectAccessor::GetCreatureOrPetOrVehicle((*me), Instance->GetData64(GNOM_WARLOCK)))
                            DoScriptText(SAY_JARAXXUS_INTRO_6, gnomLock);

                        ++text_nr;
                        timer = 1000;
                        break;

                    case 9:
                        if (Creature* jaraxxus = ObjectAccessor::GetCreatureOrPetOrVehicle((*me), Instance->GetData64(BOSS_JARAXXUS)))
                            if (Creature* gnomLock = ObjectAccessor::GetCreatureOrPetOrVehicle((*me), Instance->GetData64(GNOM_WARLOCK)))
                            {
                                jaraxxus->CastSpell(gnomLock, 66528, false);
                                jaraxxus->Kill(gnomLock);
                            }

                        ++text_nr;
                        timer = 2500;
                        break;

                    case 10:
                        DoScriptText(SAY_JARAXXUS_INTRO_7, me);
                        if (Creature* jaraxxus = ObjectAccessor::GetCreatureOrPetOrVehicle((*me), Instance->GetData64(BOSS_JARAXXUS)))
                            jaraxxus->SetFacingToObject(me);

                        ++text_nr;
                        timer = 5500;
                        break;

                    case 11:
                        if (Creature* jaraxxus = ObjectAccessor::GetCreatureOrPetOrVehicle((*me), Instance->GetData64(BOSS_JARAXXUS)))
                        {
                            jaraxxus->SetReactState(REACT_AGGRESSIVE);
                            jaraxxus->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                            if (Unit* target = GetRandomPlayerFromMap())
                            {
                                jaraxxus->AI()->EnterCombat(target);
                                jaraxxus->AI()->AttackStart(target);
                            }
                        }
                        ++text_nr;
                        timer = 5000;
                        break;
                    }
                } else timer -= diff;
                break;

            case 4:
                //Jaraxxus outro
                if (timer < diff)
                {
                    switch (text_nr)
                    {
                    case 1:
                        DoScriptText(SAY_JARAXXUS_OUTRO_1, me);

                        ++text_nr;
                        timer = 14000;
                        break;

                    case 2:
                        if (Creature* garosh = ObjectAccessor::GetCreatureOrPetOrVehicle((*me), Instance->GetData64(GAROSH_HELLSCREAM)))
                        {
                            DoScriptText(SAY_JARAXXUS_OUTRO_2, garosh);
                            ++text_nr;
                            timer = 7000;
                        }
                        break;

                    case 3:
                        if (Creature* vrynn = ObjectAccessor::GetCreatureOrPetOrVehicle((*me), Instance->GetData64(WARIAN_VRYNN)))
                        {
                            DoScriptText(SAY_JARAXXUS_OUTRO_3, vrynn);
                            ++text_nr;
                            timer = 7000;
                        }
                        break;

                    case 4:
                        DoScriptText(SAY_JARAXXUS_OUTRO_4, me);

                        if (Creature* gadajacy = ObjectAccessor::GetCreatureOrPetOrVehicle((*me), Instance->GetData64(GADAJACY)))
                        {
                            if (!gadajacy->isAlive())
                                gadajacy->Respawn(true);

                            gadajacy->SetVisibility(VISIBILITY_ON);
                        }

                        ++boss_nr;
                        text_nr=0;
                        timer = 5000;
                        started = false;
                        break;
                    }
                } else timer -= diff;
                break;

            case 5:
                //champios intro
                if (uint32 team = Instance->GetData(DATA_TEAM))
                {
                    switch (team)
                    {
                    case ALLIANCE:
                        if (timer < diff)
                        {
                            switch (text_nr)
                            {
                            case 1:
                                DoScriptText(SAY_CHAMPIONS_INTROA_1, me);

                                for (int i=BOSS_JARAXXUS; i<=BOSS_JARAXXUS; ++i)
                                {
                                    if (Creature* boss = ObjectAccessor::GetCreatureOrPetOrVehicle((*me), Instance->GetData64(i)))
                                        boss->ForcedDespawn();
                                }

                                if (Creature* gnomLock = ObjectAccessor::GetCreatureOrPetOrVehicle((*me), Instance->GetData64(GNOM_WARLOCK)))
                                    gnomLock->SetVisibility(VISIBILITY_OFF);

                                ++text_nr;
                                timer = 12000;
                                break;

                            case 2:
                                if (Creature* garosh = ObjectAccessor::GetCreatureOrPetOrVehicle((*me), Instance->GetData64(GAROSH_HELLSCREAM)))
                                {
                                    DoScriptText(SAY_CHAMPIONS_INTROA_2, garosh);
                                    ++text_nr;
                                    timer = 7000;
                                }
                                break;

                            case 3:
                                DoScriptText(SAY_CHAMPIONS_INTROA_3, me);
                                SummonChampions();
                                ++text_nr;
                                timer = 4000;
                                break;

                            case 4:
                                if (Creature* garosh = ObjectAccessor::GetCreatureOrPetOrVehicle((*me), Instance->GetData64(GAROSH_HELLSCREAM)))
                                {
                                    DoScriptText(SAY_CHAMPIONS_INTROA_4, garosh);
                                    ++text_nr;
                                    timer = 6000;
                                }
                                break;
                            }
                        } else timer -= diff;
                        break;

                    case HORDE:
                        //ladujemy dialogi dla hordy
                        if (timer < diff)
                        {
                            switch (text_nr)
                            {
                            case 1:
                                DoScriptText(SAY_CHAMPIONS_INTROH_1, me);

                                for (int i=BOSS_JARAXXUS; i<=BOSS_JARAXXUS; ++i)
                                {
                                    if (Creature* boss = ObjectAccessor::GetCreatureOrPetOrVehicle((*me), Instance->GetData64(i)))
                                        boss->ForcedDespawn();
                                }

                                ++text_nr;
                                timer = 12000;
                                break;

                            case 2:
                                if (Creature* vrynn = ObjectAccessor::GetCreatureOrPetOrVehicle((*me), Instance->GetData64(WARIAN_VRYNN)))
                                {
                                    DoScriptText(SAY_CHAMPIONS_INTROH_2, vrynn);
                                    ++text_nr;
                                    timer = 7000;
                                }
                                break;

                            case 3:
                                DoScriptText(SAY_CHAMPIONS_INTROH_3, me);
                                SummonChampions();
                                ++text_nr;
                                timer = 4000;
                                break;

                            case 4:
                                if (Creature* vrynn = ObjectAccessor::GetCreatureOrPetOrVehicle((*me), Instance->GetData64(WARIAN_VRYNN)))
                                {
                                    DoScriptText(SAY_CHAMPIONS_INTROH_4, vrynn);
                                    ++text_nr;
                                    timer = 6000;
                                }
                                break;
                            }
                        } else timer -= diff;
                        break;
                    }
                }
                break;

            case 6:
                //champions outro
                if (timer < diff)
                {
                    switch (text_nr)
                    {
                    case 1:
                        DoScriptText(SAY_CHAMPIONS_OUTRO, me);

                         if (Creature* gadajacy = ObjectAccessor::GetCreatureOrPetOrVehicle((*me), Instance->GetData64(GADAJACY)))
                        {
                            if (!gadajacy->isAlive())
                                gadajacy->Respawn(true);

                            gadajacy->SetVisibility(VISIBILITY_ON);
                        }

                        ++boss_nr;
                        text_nr=0;
                        timer = 5000;
                        started = false;
                        break;
                    }
                } else timer -= diff;
                break;

            case 7:
                //twins intro
                if (timer < diff)
                {
                    switch (text_nr)
                    {
                    case 1:
                        DoScriptText(SAY_TWINS_INTRO_1, me);
                        Instance->DoUseDoorOrButton(Instance->GetData64(MAIN_GATE));
                        openGate = true;

                        if (GameObject* chest = me->GetMap()->GetGameObject(Instance->GetData64(CHAMPIONS_CACHE)))
                            chest->Delete();

                        for (int i=BOSS_CHAMPION_DK; i<=BOSS_CHAMPION_WAREK; ++i)
                        {
                            if (Creature* boss = ObjectAccessor::GetCreatureOrPetOrVehicle((*me), Instance->GetData64(i)))
                                boss->ForcedDespawn();
                        }

                        if (Creature* lightTwin = me->GetMap()->SummonCreature(NPC_LIGHT_TWIN, positionSpawnBeastsLeft))
                        {
                            lightTwin->GetMotionMaster()->MovePoint(0, positionMoveBeastsLeft);
                            lightTwin->SetReactState(REACT_PASSIVE);
                            lightTwin->SetUnitMovementFlags(MOVEMENTFLAG_JUMPING);
                            lightTwin->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                        }
                        if (Creature* darkTwin = me->GetMap()->SummonCreature(NPC_DARK_TWIN, positionSpawnBeastsRight))
                        {
                            darkTwin->GetMotionMaster()->MovePoint(0, positionMoveBeastsRight);
                            darkTwin->SetReactState(REACT_PASSIVE);
                            darkTwin->SetUnitMovementFlags(MOVEMENTFLAG_JUMPING);
                            darkTwin->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                        }

                        ++text_nr;
                        timer = 13000;
                        break;

                    case 2:
                        DoScriptText(SAY_TWINS_INTRO_2, me);
                        ++text_nr;
                        timer = 2500;
                        break;

                    case 3:
                        if (Creature* lightTwin = ObjectAccessor::GetCreatureOrPetOrVehicle((*me), Instance->GetData64(BOSS_LIGHT_TWIN)))
                        {
                            lightTwin->SetReactState(REACT_AGGRESSIVE);
                            lightTwin->RemoveUnitMovementFlag(MOVEMENTFLAG_JUMPING);
                            lightTwin->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                            if (Unit* target = GetRandomPlayerFromMap())
                                lightTwin->AI()->AttackStart(target);
                        }
                        if (Creature* darkTwin = ObjectAccessor::GetCreatureOrPetOrVehicle((*me), Instance->GetData64(BOSS_DARK_TWIN)))
                        {
                            darkTwin->SetReactState(REACT_AGGRESSIVE);
                            darkTwin->RemoveUnitMovementFlag(MOVEMENTFLAG_JUMPING);
                            darkTwin->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                            if (Unit* target = GetRandomPlayerFromMap())
                                darkTwin->AI()->AttackStart(target);
                        }
                        ++text_nr;
                        timer = 5000;
                    }
                } else timer -= diff;
                break;

            case 8:
                //twins outro
                if (timer < diff)
                {
                    switch (text_nr)
                    {
                    case 1:
                        if (Creature* garrosh = ObjectAccessor::GetCreatureOrPetOrVehicle((*me), Instance->GetData64(GAROSH_HELLSCREAM)))
                            DoScriptText(SAY_TWINS_OUTRO, garrosh);

                        if (Creature* gadajacy = ObjectAccessor::GetCreatureOrPetOrVehicle((*me), Instance->GetData64(GADAJACY)))
                        {
                            if (!gadajacy->isAlive())
                                gadajacy->Respawn(true);

                            gadajacy->SetVisibility(VISIBILITY_ON);
                        }

                        ++boss_nr;
                        text_nr=0;
                        timer = 5000;
                        started = false;
                        break;
                    }
                } else timer -= diff;
                break;

            case 9:
                //anub intro (Lich King)
                if (timer < diff)
                {
                    switch (text_nr)
                    {
                    case 1:
                        DoScriptText(SAY_ANUB_INTRO_1, me);

                        for (int i=BOSS_LIGHT_TWIN; i<=BOSS_DARK_TWIN; ++i)
                        {
                            if (Creature* boss = ObjectAccessor::GetCreatureOrPetOrVehicle((*me), Instance->GetData64(i)))
                                boss->ForcedDespawn();
                        }

                        ++text_nr;
                        timer = 20000;
                        break;

                    case 2:
                        if (Creature* lich = me->GetMap()->SummonCreature(NPC_LICH_KING, positionMoveBeasts))
                        {
                            lich->SetReactState(REACT_PASSIVE);
                            lich->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                            lich->SetVisibility(VISIBILITY_OFF);

                            DoScriptText(SAY_ANUB_INTRO_2, lich);
                        }
                        ++text_nr;
                        timer = 2600;
                        break;

                    case 3:
                        if (Creature* portal = me->SummonCreature(22517, positionMoveBeasts, TEMPSUMMON_TIMED_DESPAWN, 30000))
                        {
                            portal->CastSpell(portal, 51807, false);
                            portal->SetDisplayId(17612);
                        }
                        ++text_nr;
                        timer = 1500;
                        break;

                    case 4:
                        if (Creature* lich = ObjectAccessor::GetCreatureOrPetOrVehicle((*me), Instance->GetData64(LICH_KING)))
                            lich->SetVisibility(VISIBILITY_ON);
                        ++text_nr;
                        timer = 750;
                        break;

                    case 5:
                        if (Creature* lich = ObjectAccessor::GetCreatureOrPetOrVehicle((*me), Instance->GetData64(LICH_KING)))
                        {
                            lich->RemoveUnitMovementFlag(lich->GetUnitMovementFlags());
                            lich->AddUnitMovementFlag(MOVEMENTFLAG_WALKING);
                            lich->SendMovementFlagUpdate();
                            lich->GetMotionMaster()->MovePoint(0, positionCenter);                            
                        }
                        ++text_nr;
                        timer = 1500;
                        break;

                    case 6:
                        DoScriptText(SAY_ANUB_INTRO_3, me);
                        ++text_nr;
                        timer = 7500;
                        break;

                    case 7:
                        if (Creature* lich = ObjectAccessor::GetCreatureOrPetOrVehicle((*me), Instance->GetData64(LICH_KING)))
                        {
                            lich->HandleEmoteCommand(EMOTE_ONESHOT_LAUGH);
                            DoScriptText(SAY_ANUB_INTRO_4, lich);
                        }
                        ++text_nr;
                        timer = 3000;
                        break;

                    case 8:
                        if (Creature* lich = ObjectAccessor::GetCreatureOrPetOrVehicle((*me), Instance->GetData64(LICH_KING)))
                            lich->SetUInt32Value(UNIT_NPC_EMOTESTATE, EMOTE_STATE_TALK);
                        ++text_nr;
                        timer = 9000;
                        break;

                    case 9:
                        if (Creature* lich = ObjectAccessor::GetCreatureOrPetOrVehicle((*me), Instance->GetData64(LICH_KING)))
                            lich->HandleEmoteCommand(EMOTE_ONESHOT_EXCLAMATION);
                        ++text_nr;
                        timer = 4000;
                        break;

                    case 10:
                        if (Creature* lich = ObjectAccessor::GetCreatureOrPetOrVehicle((*me), Instance->GetData64(LICH_KING)))
                            lich->SetUInt32Value(UNIT_NPC_EMOTESTATE, EMOTE_STATE_TALK);
                        ++text_nr;
                        timer = 1500;
                        break;

                    case 11:

                        if (Creature* lich = ObjectAccessor::GetCreatureOrPetOrVehicle((*me), Instance->GetData64(LICH_KING)))
                            lich->HandleEmoteCommand(EMOTE_ONESHOT_KNEEL);
                        ++text_nr;
                        timer = 1200;
                        break;

                    case 12:
                        if (GameObject* floor = me->GetMap()->GetGameObject(Instance->GetData64(FLOOR)))
                        {
                            floor->SetUInt32Value(GAMEOBJECT_DISPLAYID, 9060);
                            floor->SetFlag(GAMEOBJECT_FLAGS, GO_FLAG_DAMAGED | GO_FLAG_NODESPAWN);
                            floor->SetUInt32Value(GAMEOBJECT_BYTES_1, 8449);
                            floor->Update(0);
                        }

                        if (Creature* lich = ObjectAccessor::GetCreatureOrPetOrVehicle((*me), Instance->GetData64(LICH_KING)))
                        {
                            if (Unit* target = GetRandomPlayerFromMap())
                                target->CastSpell(target, 68193, false); //destroy floor knockback
                            lich->CastSpell(lich, 68198, false); //frost nova (visual boom!)
                            lich->SetVisibility(VISIBILITY_OFF);
                        }

                        ++text_nr;
                        timer = 2000;
                        break;

                    case 13:
                        if (Creature* lich = ObjectAccessor::GetCreatureOrPetOrVehicle((*me), Instance->GetData64(LICH_KING)))
                        {
                            DoScriptText(SAY_ANUB_INTRO_5, lich);
                            lich->ForcedDespawn();
                        }

                        ++text_nr;
                        timer = 5000;
                        break;
                    }
                } else timer -= diff;
                break;


            case 10:
                if (timer < diff)
                {
                    switch (text_nr)
                    {
                    case 1:
                        DoScriptText(SAY_ANUB_OUTRO, me);
                        ++text_nr;
                        timer = 5000;
                        break;
                    }
                } else timer -= diff;
                break;
            }//end switch (boss_nr)
        }//end if (started)
        else
            timer = 5000;


        if (!started)
        {
            if (Creature* gadajacy = ObjectAccessor::GetCreatureOrPetOrVehicle((*me), Instance->GetData64(GADAJACY)))
            {
                if (!gadajacy->isAlive())
                    gadajacy->Respawn(true);

                gadajacy->SetVisibility(VISIBILITY_ON);
            }
        }

    }//end UpdateAI


    void UpdateBosses()
    {
        if (!started)
            return;

        if (boss_nr == 0)
            boss_nr = 1;

        if (Instance->GetBossState(DATA_TWIN_VALKYR) == FAIL)
        {
            boss_nr = 7;
            text_nr = 0;
            timer = 3000;
            started = false;
            return;
        }

        if (Instance->GetBossState(DATA_FACTION_CHAMPIONS) == FAIL)
        {
            boss_nr = 5;
            text_nr = 0;
            timer = 3000;
            started = false;
            return;
        }

        if (Instance->GetBossState(DATA_LORD_JARAXXUS) == FAIL)
        {
            boss_nr = 3;
            text_nr = 0;
            timer = 3000;
            started = false;
            return;
        }

        if (Instance->GetBossState(DATA_BEASTS) == FAIL)
        {
            boss_nr = 1;
            text_nr = 0;
            timer = 3000;

            gormokDefeted = false;
            jormungarsDefeted = false;

            started = false;
            return;
        }

        if (Instance->GetBossState(DATA_BEASTS) == DONE && boss_nr < 2)
        {
            gormokDefeted = true;
            jormungarsDefeted = true;

            boss_nr=2;
            text_nr=0;
        }

        if (!gormokDefeted)
        {
            Creature* gormok = ObjectAccessor::GetCreatureOrPetOrVehicle((*me), Instance->GetData64(BOSS_GORMOK));
            if (gormok && !gormok->isAlive())
            {
                gormokDefeted = true;
                heroBeastsTimer = 180000;
            }
        }
        if (!jormungarsDefeted)
        {
            Creature* dreadscale = ObjectAccessor::GetCreatureOrPetOrVehicle((*me), Instance->GetData64(BOSS_DREADSCALE));
            Creature* acidmaw = ObjectAccessor::GetCreatureOrPetOrVehicle((*me), Instance->GetData64(BOSS_ACIDMAW));
            if ((dreadscale && !dreadscale->isAlive()) && (acidmaw && !acidmaw->isAlive()))
                jormungarsDefeted = true;
        }
        if (boss_nr == 1 && jormungarsDefeted)
        {
            Creature* icehowl = ObjectAccessor::GetCreatureOrPetOrVehicle((*me), Instance->GetData64(BOSS_ICEHOWL));
            if (icehowl && !icehowl->isAlive())
            {
                if (boss_nr < 2)
                {
                    boss_nr=2;
                    text_nr = 0;
                }
            }
        }

        if (Instance->GetBossState(DATA_LORD_JARAXXUS) == DONE && boss_nr < 4)
        {
            boss_nr = 4;
            text_nr = 0;
            timer = 5000;
        }

        if (Instance->GetBossState(DATA_FACTION_CHAMPIONS) == DONE && boss_nr < 6)
        {
            boss_nr = 6;
            text_nr = 0;
            timer = 3000;
        }

        if (Instance->GetBossState(DATA_TWIN_VALKYR) == DONE  && boss_nr < 8)
        {
            boss_nr = 8;
            text_nr = 0;
            timer = 3000;
        }

        if (Instance->GetBossState(DATA_ANUBARAK) == DONE  && boss_nr < 10)
        {
            boss_nr = 10;
            text_nr = 0;
            timer = 3000;

            me->Relocate(positionTirionRelocate);
            me->SummonGameObject(195682, positionPortalSpawn, 0, 0, 0, 0, 0);
        }
    }




    void SummonChampions()
    {
        uint32 team = Instance->GetData(DATA_TEAM);

        uint8 count;

        uint8 healers = 0;
        uint8 meleedps = 0;
        uint8 rangedps = 0;


        if (getDifficulty() == RAID_DIFFICULTY_10MAN_NORMAL || getDifficulty() == RAID_DIFFICULTY_10MAN_HEROIC)
            count = 6;
        else
            count = 10;


        std::vector<uint32> ids;
        for (int i=0; i<count; ++i)
        {
            uint32 id = 0;

            if (i == 0 || i == 1 || id == 6)
            {
                do
                {
                    uint32 random = urand(0, 3);
                    if (random == 0)
                        id = (team == ALLIANCE ? NPC_DRZEWO_HORDE : NPC_DRZEWO_ALLY);
                    else if (random == 1)
                        id = (team == ALLIANCE ? NPC_HOLYPALA_HORDE : NPC_HOLYPALA_ALLY);
                    else if (random == 2)
                        id = (team == ALLIANCE ? NPC_RESTOSH_HORDE : NPC_RESTOSH_ALLY);
                    else
                        id = (team == ALLIANCE ? NPC_DISCI_HORDE : NPC_DISCI_ALLY);

                }while (HasData(ids, id));

                ids.push_back(id);
            }



            if (i == 2 || i == 3 || i == 7)
            {
                do
                {
                    uint32 random = urand(0, 4);
                    if (random == 0)
                        id = (team == ALLIANCE ? NPC_DK_HORDE : NPC_DK_ALLY);
                    else if (random == 1)
                        id = (team == ALLIANCE ? NPC_RETRIPALA_HORDE : NPC_RETRIPALA_ALLY);
                    else if (random == 2)
                        id = (team == ALLIANCE ? NPC_ROGAL_HORDE : NPC_ROGAL_ALLY);
                    else if (random == 3)
                        id = (team == ALLIANCE ? NPC_ENH_HORDE : NPC_ENH_ALLY);
                    else
                        id = (team == ALLIANCE ? NPC_WAREK_HORDE : NPC_WAREK_ALLY);

                }while (HasData(ids, id));

                ids.push_back(id);
            }



            if (i == 4 || i == 5 || i == 8)
            {
                do
                {
                    uint32 random = urand(0, 4);
                    if (random == 0)
                        id = (team == ALLIANCE ? NPC_SOWA_HORDE : NPC_SOWA_ALLY);
                    else if (random == 1)
                        id = (team == ALLIANCE ? NPC_HUNTER_HORDE : NPC_HUNTER_ALLY);
                    else if (random == 2)
                        id = (team == ALLIANCE ? NPC_MAGE_HORDE : NPC_MAGE_ALLY);
                    else if (random == 3)
                        id = (team == ALLIANCE ? NPC_SHADOW_HORDE : NPC_SHADOW_ALLY);
                    else
                        id = (team == ALLIANCE ? NPC_LOCK_HORDE : NPC_LOCK_ALLY);

                }while (HasData(ids, id));

                ids.push_back(id);
            }


            if (i == 9)
            {
                uint32 randomchampion = urand(0,2);
                if (randomchampion == 0)
                {
                    do
                    {
                        uint32 random = urand(0, 3);
                        if (random == 0)
                            id = (team == ALLIANCE ? NPC_DRZEWO_HORDE : NPC_DRZEWO_ALLY);
                        else if (random == 1)
                            id = (team == ALLIANCE ? NPC_HOLYPALA_HORDE : NPC_HOLYPALA_ALLY);
                        else if (random == 2)
                            id = (team == ALLIANCE ? NPC_RESTOSH_HORDE : NPC_RESTOSH_ALLY);
                        else
                            id = (team == ALLIANCE ? NPC_DISCI_HORDE : NPC_DISCI_ALLY);

                    }while (HasData(ids, id));

                    ids.push_back(id);
                }
                else if (randomchampion == 1)
                {
                    do
                    {
                        uint32 random = urand(0, 4);
                        if (random == 0)
                            id = (team == ALLIANCE ? NPC_DK_HORDE : NPC_DK_ALLY);
                        else if (random == 1)
                            id = (team == ALLIANCE ? NPC_RETRIPALA_HORDE : NPC_RETRIPALA_ALLY);
                        else if (random == 2)
                            id = (team == ALLIANCE ? NPC_ROGAL_HORDE : NPC_ROGAL_ALLY);
                        else if (random == 3)
                            id = (team == ALLIANCE ? NPC_ENH_HORDE : NPC_ENH_ALLY);
                        else
                            id = (team == ALLIANCE ? NPC_WAREK_HORDE : NPC_WAREK_ALLY);

                    }while (HasData(ids, id));

                    ids.push_back(id);
                }
                else
                {
                    do
                    {
                        uint32 random = urand(0, 4);
                        if (random == 0)
                            id = (team == ALLIANCE ? NPC_SOWA_HORDE : NPC_SOWA_ALLY);
                        else if (random == 1)
                            id = (team == ALLIANCE ? NPC_HUNTER_HORDE : NPC_HUNTER_ALLY);
                        else if (random == 2)
                            id = (team == ALLIANCE ? NPC_MAGE_HORDE : NPC_MAGE_ALLY);
                        else if (random == 3)
                            id = (team == ALLIANCE ? NPC_SHADOW_HORDE : NPC_SHADOW_ALLY);
                        else
                            id = (team == ALLIANCE ? NPC_LOCK_HORDE : NPC_LOCK_ALLY);

                    }while (HasData(ids, id));

                    ids.push_back(id);
                }
            }//end if (id==9)
        }//end for (i=0; i<count; ++i)


        for (int i=0; i<ids.size(); ++i)
        {
            if (team == ALLIANCE)
                me->GetMap()->SummonCreature(ids[i], HordeChampionsEnter[i]);
            else if (team == HORDE)
                me->GetMap()->SummonCreature(ids[i], AllyChampionsEnter[i]);
        }
    }

    bool HasData(const std::vector<uint32> vec, uint32 data)
    {
        for (int i=0; i<vec.size(); ++i)
        {
            if (vec[i] == data)
                return true;
        }

        return false;
    }

    Unit* GetRandomPlayerFromMap()
    {
        if (!me->GetMap()->HavePlayers())
            return NULL;

        if (me->GetMap()->GetPlayersCountExceptGMs() == 0)
            return NULL;

        std::vector<uint64> players;
        Map::PlayerList::const_iterator itr = me->GetMap()->GetPlayers().begin();
        while (itr != me->GetMap()->GetPlayers().end())
        {
            if (itr->getSource() && itr->getSource()->isAlive())
                players.push_back(itr->getSource()->GetGUID());

            ++itr;
        }

        if (players.empty())
            return NULL;

        return ObjectAccessor::GetUnit((*me), players[rand()%players.size()]);
    }
};

CreatureAI* GetAI_tirion_fordring(Creature* creature)
{
    return new toc_tirion_fordringAI(creature);
}



bool GossipHello_toc_barrett_ramsey(Player* pPlayer, Creature* pCreature)
{
    if ((!pPlayer->GetGroup() || !pPlayer->GetGroup()->IsLeader(pPlayer->GetGUID())) && !pPlayer->isGameMaster())
    {
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Sorry, I'm not leader here.", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+2);
        pPlayer->SEND_GOSSIP_MENU(13691, pCreature->GetGUID());
        return true;
    }

    InstanceData* instance = pCreature->GetInstanceData();
    if (!instance)
        return false;

    if (instance->GetBossState(DATA_TWIN_VALKYR) == DONE)
    {
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "We have defeated twins val'kyr!", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);
    }
    else if (instance->GetBossState(DATA_FACTION_CHAMPIONS) == DONE)
    {
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "We have defeated faction champions!", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);
    }
    else if (instance->GetBossState(DATA_LORD_JARAXXUS) == DONE)
    {
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "We have defeated Lord Jaraxxus!", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);
    }
    else if (instance->GetBossState(DATA_BEASTS) == DONE)
    {
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "We have defeated Beasts of Northrend!", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);
    }
    else
    {
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "We are ready to start the tournament!", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);
    }


    if (pPlayer->isGameMaster())
    {
        std::stringstream str;
        str << "Deaths Count: ";
        str << instance->GetData(DATA_DEATHS_COUNT);
        str << ", Attempts remaning: ";
        str << instance->GetData(DATA_ATTEMPTS);
        str << ", Played as: ";
        str << (instance->GetData(DATA_TEAM) == ALLIANCE ? "alliance" : instance->GetData(DATA_TEAM) == HORDE ? "horde" : "<error: team not defined>");
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, str.str().c_str(), GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+3);
    }

    pPlayer->SEND_GOSSIP_MENU(13691, pCreature->GetGUID());
    return true;
}

bool GossipSelect_toc_barrett_ramsey(Player* pPlayer, Creature* pCreature, uint32 /*uiSender*/, uint32 uiAction)
{
    InstanceData* instance = pCreature->GetInstanceData();
    if (!instance)
    {
        pCreature->MonsterSay("Brak instancji", LANG_UNIVERSAL, 0);
        return false;
    }

    switch (uiAction)
    {
    case GOSSIP_ACTION_INFO_DEF+1:
        if (Creature* tirion = ObjectAccessor::GetCreatureOrPetOrVehicle((*pCreature), instance->GetData64(TIRION_FORDING)))
            CAST_AI(toc_tirion_fordringAI, tirion->AI())->started = true;

        for (int i = DATA_BEASTS; i<DATA_ANUBARAK; ++i)
        {
            if (instance->GetBossState(i) == FAIL)
            {
                instance->SetBossState(i, NOT_STARTED);
                break;
            }
        }

        pCreature->SetVisibility(VISIBILITY_OFF);
        break;

    case GOSSIP_ACTION_INFO_DEF+2:
        pCreature->MonsterSay("Ok, I will wait here for your leader", LANG_UNIVERSAL, pPlayer->GetGUID());
        break;

    case GOSSIP_ACTION_INFO_DEF+3:
        pCreature->MonsterSay("Hope all stats are correct. Have a good day!", LANG_UNIVERSAL, pPlayer->GetGUID());
        break;

    default:
        pCreature->MonsterSay("Wybrano niezdefiniowana opcje", LANG_UNIVERSAL, 0);
    }

    pPlayer->CLOSE_GOSSIP_MENU();

    return true;
}
///*==============================

void AddSC_trial_of_the_crusader()
{
    Script* newscript;

    newscript = new Script;
    newscript->Name = "toc_tirion_fordring";
    newscript->GetAI = &GetAI_tirion_fordring;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "toc_barrett_ramsey";
    newscript->pGossipHello = &GossipHello_toc_barrett_ramsey;
    newscript->pGossipSelect = &GossipSelect_toc_barrett_ramsey;
    newscript->RegisterSelf();
}
