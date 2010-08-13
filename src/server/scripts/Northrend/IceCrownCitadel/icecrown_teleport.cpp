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

#define HAMMER        70781
#define ORATORY       70856
#define RAMPART       70857
#define SAURFANG      70858
#define UPPER_SPIRE   70859
#define PLAGUEWORKS   9995
#define CRIMSONHALL   9996
#define FWHALLS       9997
#define QUEEN         70861
#define LICHKING      70860

class icecrown_teleporter : public GameObjectScript
{
public:
    icecrown_teleporter() : GameObjectScript("icecrown_teleporter") { }
bool OnGossipHello(Player *pPlayer, GameObject *pGO)
{
    InstanceScript *pInstance = pGO->GetInstanceScript();
    if(!pInstance) return true;

	pPlayer->ADD_GOSSIP_ITEM(0, "Teleport to Light's Hammer", GOSSIP_SENDER_MAIN, HAMMER);
    if(pInstance->GetData(DATA_MARROWGAR_EVENT) == DONE)
    {
        pPlayer->ADD_GOSSIP_ITEM(0, "Teleport to the Oratory of the Damned", GOSSIP_SENDER_MAIN, ORATORY);
    }
    if(pInstance->GetData(DATA_DEATHWHISPER_EVENT) == DONE)
    {
        pPlayer->ADD_GOSSIP_ITEM(0, "Teleport to the Rampart of Skulls", GOSSIP_SENDER_MAIN, RAMPART);
        pPlayer->ADD_GOSSIP_ITEM(0, "Подьем Смертоносного", GOSSIP_SENDER_MAIN, SAURFANG);
    }
    if(pInstance->GetData(DATA_SAURFANG_EVENT) == DONE)
    {
        pPlayer->ADD_GOSSIP_ITEM(0, "Teleport to the Upper Spire", GOSSIP_SENDER_MAIN, UPPER_SPIRE);
    }
    if(pInstance->GetData(DATA_PROFESSOR_PUTRICIDE_EVENT) == DONE)
    {
        pPlayer->ADD_GOSSIP_ITEM(0, "Teleport to the Plagueworks", GOSSIP_SENDER_MAIN, PLAGUEWORKS);
    }
    if(pInstance->GetData(DATA_BLOOD_QUEEN_LANATHEL_EVENT) == DONE)
    {
        pPlayer->ADD_GOSSIP_ITEM(0, "Teleport to the Crimson Halls", GOSSIP_SENDER_MAIN, CRIMSONHALL);
    }
    if(pInstance->GetData(DATA_VALITHRIA_DREAMWALKER_EVENT) == DONE)
    {
        pPlayer->ADD_GOSSIP_ITEM(0, "Teleport to the Sindragosa's Lair", GOSSIP_SENDER_MAIN, QUEEN);
    }
    if(pInstance->GetData(DATA_SINDRAGOSA_EVENT) == DONE)
    {
        pPlayer->ADD_GOSSIP_ITEM(0, "Teleport to the Frostwing Halls", GOSSIP_SENDER_MAIN, FWHALLS);
    }
    if(pInstance->GetData(DATA_PROFESSOR_PUTRICIDE_EVENT) == DONE && pInstance->GetData(DATA_BLOOD_QUEEN_LANATHEL_EVENT) == DONE &&
        pInstance->GetData(DATA_VALITHRIA_DREAMWALKER_EVENT) == DONE)
    {
        pPlayer->ADD_GOSSIP_ITEM(0, "Teleport to the Frozen Throne", GOSSIP_SENDER_MAIN, LICHKING);
    }
    pPlayer->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE, pGO->GetGUID());

    return true;
}

bool OnGossipSelect(Player *pPlayer, GameObject *pGO, uint32 sender, uint32 action)
{
    if(sender != GOSSIP_SENDER_MAIN) return true;
    if(!pPlayer->getAttackers().empty()) return true;

    switch(action)
    {
    case HAMMER:
        pPlayer->TeleportTo(631, -17.1928, 2211.44, 30.1158, 3.121);
        pPlayer->CLOSE_GOSSIP_MENU(); break;
    case ORATORY:
        pPlayer->TeleportTo(631, -503.62, 2211.47, 62.8235, 3.139);
        pPlayer->CLOSE_GOSSIP_MENU(); break;
    case RAMPART:
        pPlayer->TeleportTo(631, -615.145, 2211.47, 199.972, 6.268);
        pPlayer->CLOSE_GOSSIP_MENU(); break;
    case SAURFANG:
        pPlayer->TeleportTo(631, -549.131, 2211.29, 539.291, 6.275);
        pPlayer->CLOSE_GOSSIP_MENU(); break;
    case UPPER_SPIRE:
        pPlayer->TeleportTo(631, 4199.407, 2769.478, 351.064, 6.258);
        pPlayer->CLOSE_GOSSIP_MENU(); break;
    case PLAGUEWORKS:
        pPlayer->TeleportTo(631, 4356.988, 2867.540, 349.332, 1.558);
        pPlayer->CLOSE_GOSSIP_MENU(); break;
    case CRIMSONHALL:
        pPlayer->TeleportTo(631, 4452.847, 2769.345, 349.348, 6.234);
        pPlayer->CLOSE_GOSSIP_MENU(); break;
    case FWHALLS:
        pPlayer->TeleportTo(631, 4357.002, 2674.207, 349.342, 4.683);
        pPlayer->CLOSE_GOSSIP_MENU(); break;
    case QUEEN:
        pPlayer->TeleportTo(631, 4356.580, 2565.75, 220.40, 4.886);
        pPlayer->CLOSE_GOSSIP_MENU(); break;
    case LICHKING:
        pPlayer->TeleportTo(631, 528.39, -2124.845, 1055.959, 0.120);
        pPlayer->CLOSE_GOSSIP_MENU(); break;
    }

    return true;
}
};

void AddSC_icecrown_teleporter()
{
    new icecrown_teleporter;
}