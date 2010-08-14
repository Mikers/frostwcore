#include "ScriptPCH.h"
#include "Zones/BattleGroundSA.h"

struct npc_demolisher_salesmanAI : public ScriptedAI
{
    npc_demolisher_salesmanAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        me->SetReactState(REACT_PASSIVE);
        Reset();
    }

    uint32 DemolisherCount;
    uint32 ZaryadCount;

    void Reset()
    {
        DemolisherCount = 0;
        ZaryadCount = 0;
    }
};
CreatureAI* GetAI_npc_demolisher_salesman(Creature* pCreature)
{
    return new npc_demolisher_salesmanAI (pCreature);
}
bool GossipHello_npc_demolisher_salesman(Player* pPlayer, Creature* pCreature)
{
    if (pCreature->isQuestGiver())
        pPlayer->PrepareQuestMenu(pCreature->GetGUID());
    if(CAST_AI(npc_demolisher_salesmanAI, pCreature->AI())->DemolisherCount < 3)
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Построить танк.", GOSSIP_SENDER_MAIN,   GOSSIP_ACTION_INFO_DEF);
    if(CAST_AI(npc_demolisher_salesmanAI, pCreature->AI())->ZaryadCount < 5)
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Построить гранату.", GOSSIP_SENDER_MAIN,   GOSSIP_ACTION_INFO_DEF+1);
    else
        pCreature->MonsterSay("Я не могу строить больше!", LANG_UNIVERSAL, NULL); 
    return true;
}
bool GossipSelect_npc_demolisher_salesman(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    pPlayer->CLOSE_GOSSIP_MENU();
    switch(uiAction - GOSSIP_ACTION_INFO_DEF)
    {
        case 0:
            // removing the flag non_attackable after summon battleground demolisher
            if(pCreature->GetPositionY() < 0)
            {
                TempSummon* tank_a = pCreature->SummonCreature(28781, 1371.18, -317.45, 34.98, 1.78);
                tank_a->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_ATTACKABLE_1);
                tank_a->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
            }
            else
            {
                TempSummon* tank_b = pCreature->SummonCreature(28781, 1353.18, 223.71, 35.26, 4.34);
                tank_b->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_ATTACKABLE_1);
                tank_b->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
            }
            CAST_AI(npc_demolisher_salesmanAI, pCreature->AI())->DemolisherCount++;
            break;
        case 1:
            pCreature->SummonGameObject(190753, pPlayer->GetPositionX(), pPlayer->GetPositionY(), pPlayer->GetPositionZ(), 0, 0, 0, 0, 0, 600000);
            CAST_AI(npc_demolisher_salesmanAI, pCreature->AI())->ZaryadCount++;
            break;
    }
    return true;
}

/*######
## npc_rooted
######*/

struct  npc_rootedAI : public ScriptedAI
{
    npc_rootedAI(Creature* pCreature) : ScriptedAI(pCreature) {}
    
    uint32 root_timer;
    
    void Reset()
    {
        root_timer = 10;
    }
    
    void UpdateAI(const uint32 diff)
    {
        if (!UpdateVictim())
        return;
        
        if(root_timer < diff)
        {
            me->SetSpeed(MOVE_RUN, 0.0001);
            root_timer = 20000;
        } else root_timer -= diff;  
    }
};

CreatureAI* GetAI_npc_rooted(Creature* pCreature)
{
    return new npc_rootedAI(pCreature);
}

/*######
## go_wintergrasp_def_portal
######*/

static float SpawnLocation[7][3]=
{
    {1468.12f, -225.7f, 30.8969f},
    {1394.07f, 72.3632f, 31.0541f},
    {1216.12f, 47.7665f, 54.2785f},
    {1255.73f, -233.153f, 56.4357f},
    {1065.02f, -89.9522f, 81.0758f},
    {880.162f, -95.979f, 109.835f},
    {880.68f, -120.799f, 109.835f},
};

static float TeleLocation[7][3]=
{
    {1451.72, -224.863, 41.9564},
    {1401.6, 88.6693, 41.1833},
    {1210.68, 60.3558, 64.7388},
    {1245.03, -226.439, 66.7201},
    {1062.83, -87.1955, 93.8061},
    {808.447, -109.192, 109.835},
    {808.447, -109.192, 109.835},
};

bool GossipHello_SA_defender_portal(Player* pPlayer, GameObject* pGo)
{
    if (pPlayer->GetMapId() == 607 && !pPlayer->HasAura(54643))
    {
        if (BattleGround *bg = pPlayer->GetBattleGround())
        {
            for (uint32 i = 0; i < 7; ++i)
            {
                if ((pGo->GetPositionX() == SpawnLocation[i][0]) && (pGo->GetPositionY() == SpawnLocation[i][1]) && (pGo->GetPositionZ() == SpawnLocation[i][2]))
                {
                    pPlayer->TeleportTo(bg->GetMapId(),TeleLocation[i][0],TeleLocation[i][1],TeleLocation[i][2],0);
                    pPlayer->CastSpell(pPlayer,54643,false);
                    return true;
                }
            } 
        }
    }
    return false;
}

void AddSC_strand_of_the_ancients()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name = "npc_demolisher_salesman";
    newscript->GetAI = &GetAI_npc_demolisher_salesman;
    newscript->pGossipHello = &GossipHello_npc_demolisher_salesman;
    newscript->pGossipSelect = &GossipSelect_npc_demolisher_salesman;
    newscript->RegisterSelf();
    
    newscript = new Script;
    newscript->Name = "npc_rooted";
    newscript->GetAI = &GetAI_npc_rooted;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "SA_defender_portal";
    newscript->pGOHello = &GossipHello_SA_defender_portal;
    newscript->RegisterSelf();
}
