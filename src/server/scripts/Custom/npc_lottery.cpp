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

/* ScriptData
SDName: Example_Gossip_Codebox
SD%Complete: 100
SDComment: Show a codebox in gossip option
SDCategory: Script Examples
EndScriptData */

#include "ScriptPCH.h"
#include <cstring>

enum eEnums
{
	SAY_WRONG               = -1999926,
	SAY_CORRECT             = -1999927
};

#define GOSSIP_LOTTERY_YES     "My number..."
#define GOSSIP_LOTTERY_NO      "No, thanks."

class npc_lottery : public CreatureScript
{
    public:

        npc_lottery()
            : CreatureScript("npc_lottery")
        {
        }

        bool OnGossipHello(Player* player, Creature* creature)
        {
			player->ADD_GOSSIP_ITEM_EXTENDED(0, GOSSIP_LOTTERY_YES, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1, "", 0, true);
			player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_LOTTERY_NO, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+2);
			player->PlayerTalkClass->SendGossipMenu(930000, creature->GetGUID());

            return true;
        }

        bool OnGossipSelect(Player* player, Creature* creature, uint32 sender, uint32 action)
        {
            if (action == GOSSIP_ACTION_INFO_DEF+2)
            {
                player->CLOSE_GOSSIP_MENU();
            }

            return true;
        }

        bool OnGossipSelectCode(Player* player, Creature* creature, uint32 sender, uint32 action, const char* code)
        {
            if (sender == GOSSIP_SENDER_MAIN)
            {
                switch (action)
                {
                case GOSSIP_ACTION_INFO_DEF+1:

					uint32 num = atoi(code);

					if (num == 0 || num > 100)
					{
						DoScriptText(SAY_WRONG, creature);
						player->CLOSE_GOSSIP_MENU();
						return true;
					}

					if (player->GetMoney() < LOTTERY_PRICE)
					{
						player->SendBuyError(BUY_ERR_NOT_ENOUGHT_MONEY, 0, 0, 0);
						player->CLOSE_GOSSIP_MENU();
						return true;
					}
					player->ModifyMoney(-LOTTERY_PRICE);

					sLotteryMgr.SetLotteryPlayer(player->GetGUIDLow(), num);
					DoScriptText(SAY_CORRECT, creature);
					player->CLOSE_GOSSIP_MENU();
		            return true;
                }
            }

            return false;
        }
};

void AddSC_npc_lottery()
{
    new npc_lottery();
}