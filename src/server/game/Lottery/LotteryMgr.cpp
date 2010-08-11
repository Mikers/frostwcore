/*
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 *
 * Copyright (C) 2008-2010 Trinity <http://www.trinitycore.org/>
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

/// \addtogroup world
/// @{
/// \file
#include "LotteryMgr.h"
#include "Language.h"
#include "Log.h"
#include "Mail.h"
#include "ProgressBar.h"
#include "ObjectMgr.h"
#include "DatabaseEnv.h"

LotteryMgr::LotteryMgr()
{
	m_jackpot = 0;
    for (uint8 i = 0; i < MAX_WINNERS; ++i)
    {
        m_winners[i] = 0;
    }

}
LotteryMgr::~LotteryMgr()
{

}

bool LotteryMgr::SetLotteryPlayer(uint32 characterId, uint32 number)
{
	LotteryData pTemp;
	pTemp.character = characterId;
	pTemp.number= number;

	m_mLotteryDataMap[characterId] = pTemp;
	CharacterDatabase.BeginTransaction();
	CharacterDatabase.PExecute("REPLACE INTO lottery_data (charId, number) VALUES ('%u', '%u')", characterId, number);
	CharacterDatabase.PExecute("UPDATE lottery_jackpot SET jackpot = jackpot + %u", LOTTERY_PRICE);
	m_jackpot = m_jackpot + LOTTERY_PRICE;
	return CharacterDatabase.CommitTransaction();
}

void LotteryMgr::LotteryEvent()
{
	uint32 number = urand(1, 100);
	uint32 jackpot = GetLotteryJackpot();
	uint8 count = LotteryRewards(number);
	uint32 reward = 0;
	if (count != 0)
		reward = jackpot/count;
	jackpot = GetLotteryJackpot();
	sWorld.SendWorldText(LANG_LOTTERY_NUMBER, number);
	sWorld.SendWorldText(LANG_LOTTERY_WINNERS, count, reward);
	sWorld.SendWorldText(LANG_LOTTERY_JACKPOT, jackpot);
	return;
}

uint8 LotteryMgr::LotteryRewards(uint32 number)
{
	if (m_mLotteryDataMap.empty())
		return 0;
	if (number == 0)
		return 0;
	uint8 pcount = 0;
	for (LotteryDataMap::const_iterator itr = m_mLotteryDataMap.begin(); itr != m_mLotteryDataMap.end(); ++itr)
	{
		if (itr->second.number != number)
			continue;
		else
		{
			m_winners[pcount] = itr->first;
			pcount++;
		}
	}
	m_mLotteryDataMap.clear();

	if (pcount > 0)
	{
		for (uint8 i = 0; i < MAX_WINNERS; ++i)
		{
			if (m_winners[i] == 0)
				break;
			uint64 player_guid = MAKE_NEW_GUID(m_winners[i], 0, HIGHGUID_PLAYER);
			Player *player = sObjectMgr.GetPlayer(player_guid);
			if (!player)
				continue;
			MailDraft("You won the Lottery!", "Tadaaam!")   
					.AddMoney(m_jackpot/pcount)
					.SendMailTo(MailReceiver(player,m_winners[i]), MailSender(MAIL_CREATURE, 79));
			m_winners[i] = 0;
		}
		CharacterDatabase.BeginTransaction();
		CharacterDatabase.PExecute("TRUNCATE lottery_jackpot");
		CharacterDatabase.PExecute("TRUNCATE lottery_data");
		CharacterDatabase.PExecute("INSERT INTO lottery_jackpot VALUES ('%u')", 0);
		CharacterDatabase.CommitTransaction();
		m_jackpot = 0;
	}
	else
	{
		CharacterDatabase.BeginTransaction();
		CharacterDatabase.PExecute("TRUNCATE lottery_data");
		CharacterDatabase.CommitTransaction();
	}
	return pcount;
}

void LotteryMgr::LoadLottery()
{

	QueryResult_AutoPtr Result = CharacterDatabase.Query("SELECT charId, number FROM lottery_data");

	if (Result)
	{
		barGoLink bar(Result->GetRowCount());
		uint32 playerCount = 0;

		do
		{
			bar.step();
			Field* pFields = Result->Fetch();
			LotteryData pTemp;

			pTemp.character = pFields[0].GetUInt32();
			uint32 charId   = pTemp.character;
			pTemp.number= pFields[1].GetUInt32();

			m_mLotteryDataMap[charId] = pTemp;
			++playerCount;
		} while (Result->NextRow());

		sLog.outString("");
		sLog.outString(">> Loaded %u players for Lottery.", playerCount);
	}
	else
	{
		barGoLink bar(1);
		bar.step();
		sLog.outString("");
		sLog.outString(">> Loaded 0 players for Lottery.");
	}

	QueryResult_AutoPtr Result2 = CharacterDatabase.Query("SELECT jackpot FROM lottery_jackpot");

	if (Result2)
	{
		Field* fields = Result2->Fetch();
		m_jackpot = fields[0].GetUInt32();
		sLog.outString("");
		sLog.outString(">> Loaded jackpot %u for Lottery.", m_jackpot);
	}
	else
	{
		CharacterDatabase.BeginTransaction();
		CharacterDatabase.PExecute("INSERT INTO lottery_jackpot VALUES ('%u')", 0);
		CharacterDatabase.CommitTransaction();
		m_jackpot = 0;
		sLog.outString("");
		sLog.outString(">> Loaded jackpot %u for Lottery.", m_jackpot);
	}
}

