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

/*
*The script for the difficult script
*for the first object and creature because
*it is easy scripts are in the database
*/

#include "ScriptPCH.h"
#include "icecrown_citadel.h"

//#define	SPELL_ON_ORGRIM'S_HAMMER_DECK 70121 for gunship battle
#define	SPELL_DARKMARTYRDOM_FANATIC  RAID_MODE(71236,72495,72496,72497)
#define	SPELL_DARKMARTYRDOM_ADHERENT RAID_MODE(70903,72498,72499,72500)
#define	SPELL_DARKTRANSFORMATION     70900
#define	SPELL_NECROTICSTRIKE         RAID_MODE(70659,72490,72490,72492)
#define	SPELL_SHADOWCLEAVE           RAID_MODE(70670,72006,72493,72494)
#define	SPELL_VAMPIRICMIGHT          70674
#define	SPELL_FANATIC_DETERMINATION  71235
#define	SPELL_ADHERENT_DETERMINATION 71234
#define SPELL_STANDART_HORDE         69811

#define	SAY_TRANSFORMATION -1665912

class npc_icecrown_trash : public CreatureScript
{
public:
    npc_icecrown_trash() : CreatureScript("npc_icecrown_trash") { }

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new npc_icecrown_trashAI(pCreature);
    }
struct npc_icecrown_trashAI: public ScriptedAI
{
	npc_icecrown_trashAI(Creature* pCreature) : ScriptedAI(pCreature)
	{
	    pInstance = pCreature->GetInstanceScript();
	}

	InstanceScript* pInstance;


	uint32 uiStrikeTimer;
	uint32 uiCleaveTimer;
	uint32 uiVampirTimer;
	uint32 uiTransformationTimer;

	bool Resurrect;
	bool Dark;
	bool Transformation;

	void Reset()
	{
		uiStrikeTimer = 7000;
		uiVampirTimer = 18000;
		uiCleaveTimer = 6000;
		uiTransformationTimer = 35000;

	    Resurrect = false;
	    Dark = false;
		Transformation = false;
	}

	void EnterCombat(Unit* who)
	{
	}

	void JustDied(Unit* who)
	{
	    switch(me->GetEntry())
		{
			case 37890:
			{
                if(Resurrect = false)
                {
			        me->Respawn(true);
			        DoCast(me, SPELL_ADHERENT_DETERMINATION);
			        Resurrect = true;
                }
				break;
			}
			case 37949:
            {
                if(Resurrect = false)
                {
			        me->Respawn(true);
			        DoCast(me, SPELL_FANATIC_DETERMINATION);
			        Resurrect = true;
                }
				break;
            }
		}
	}

	void UpdateAI(const uint32 uiDiff)
	{
		if (!UpdateVictim())
			return;

        switch(me->GetEntry())
	    {
        case 37949:
            {
		        if(me->GetHealth()*100 / me->GetMaxHealth() < 30)
		        {
			        if (Dark == false)
			        {
				        DoCast(me, SPELL_DARKMARTYRDOM_ADHERENT);
				        Dark = true;
			        }
		        }

		        if (uiStrikeTimer <= uiDiff)
		        {
			        DoCast(me, SPELL_NECROTICSTRIKE);
			        uiStrikeTimer = 8000;
		        } else uiStrikeTimer -= uiDiff;

		        if (uiCleaveTimer <= uiDiff)
		        {
		    	    DoCast(me, SPELL_SHADOWCLEAVE);
			        uiCleaveTimer = 6000;
		        } else uiCleaveTimer -= uiDiff;

		        if (uiVampirTimer <= uiDiff)
		        {
		        	DoCast(me, SPELL_VAMPIRICMIGHT);
		        	uiVampirTimer = 25000;
	        	} else uiVampirTimer -= uiDiff;
                break;
            }
		case 37890:
            {
		        if(me->GetHealth()*100 / me->GetMaxHealth() < 30)
		        {
			        if (Dark == false)
			        {
				        DoCast(me, SPELL_DARKMARTYRDOM_FANATIC);
				        Dark = true;
			        }
		        }
		        if (uiStrikeTimer <= uiDiff)
		        {
			        DoCast(me, SPELL_NECROTICSTRIKE);
			        uiStrikeTimer = 8000;
		        } else uiStrikeTimer -= uiDiff;

				if(!Transformation)
				{
		            if (uiTransformationTimer <= uiDiff)
		            {
			            DoCast(me, SPELL_DARKTRANSFORMATION);
						DoScriptText(SAY_TRANSFORMATION, me);
						Transformation = true;
		            } else uiTransformationTimer -= uiDiff;
                }

		        if (uiVampirTimer <= uiDiff)
		        {
		        	DoCast(me, SPELL_VAMPIRICMIGHT);
		        	uiVampirTimer = 20000;
	        	} else uiVampirTimer -= uiDiff;

		        if (uiCleaveTimer <= uiDiff)
		        {
		    	    DoCast(me, SPELL_SHADOWCLEAVE);
			        uiCleaveTimer = 6000;
		        } else uiCleaveTimer -= uiDiff;
                break;
            }
		}
        DoMeleeAttackIfReady();
    }
	};
};

void AddSC_icecrown_citadel_trash()
{
	new npc_icecrown_trash;
}