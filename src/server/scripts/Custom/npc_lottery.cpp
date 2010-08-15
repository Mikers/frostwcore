/*
 * Copyright (C) 2008-2010 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2006-2009 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */


#include "ScriptPCH.h"
#include <cstring>
/*
enum eEnums
{
    SAY_WRONG               = -1999990,
    SAY_CORRECT             = -1999991
};

#define GOSSIP_LOTTERY_YES     "My number..."
#define GOSSIP_LOTTERY_NO      "No, thanks."

//This function is called when the player opens the gossip menubool
bool GossipHello_Lottery(Player* pPlayer, Creature* pCreature)
{
    pPlayer->ADD_GOSSIP_ITEM_EXTENDED(0, GOSSIP_LOTTERY_YES, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1, "", 0, true);
    pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_LOTTERY_NO, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+2);

    pPlayer->PlayerTalkClass->SendGossipMenu(930000, pCreature->GetGUID());

    return true;
}

//This function is called when the player clicks an option on the gossip menubool
bool GossipSelect_Lottery(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF+2)
    {
        pPlayer->CLOSE_GOSSIP_MENU();
    }

    return true;
}

bool GossipSelectWithCode_Lottery(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction, const char* sCode)
{
    if (uiSender == GOSSIP_SENDER_MAIN)
    {
        switch (uiAction)
        {
        case GOSSIP_ACTION_INFO_DEF+1:

            uint32 num = atoi(sCode);

            if (num == 0 || num > 100)
            {
                DoScriptText(SAY_WRONG, pCreature);
                pPlayer->CLOSE_GOSSIP_MENU();
                return true;
            }

            if (pPlayer->GetMoney() < LOTTERY_PRICE)
            {
                pPlayer->SendBuyError(BUY_ERR_NOT_ENOUGHT_MONEY, 0, 0, 0);
                pPlayer->CLOSE_GOSSIP_MENU();
                return true;
            }
            pPlayer->ModifyMoney(-LOTTERY_PRICE);

            sLotteryMgr.SetLotteryPlayer(pPlayer->GetGUIDLow(), num);
            DoScriptText(SAY_CORRECT, pCreature);
            pPlayer->CLOSE_GOSSIP_MENU();
            return true;
        }
    }

    return false;
}

void AddSC_npc_lottery()
{
    Script* newscript;

    newscript = new Script;
    newscript->Name = "npc_lottery";
    newscript->pGossipHello = &GossipHello_Lottery;
    newscript->pGossipSelect = &GossipSelect_Lottery;
    newscript->pGossipSelectWithCode = &GossipSelectWithCode_Lottery;
    newscript->RegisterSelf();
}
*/