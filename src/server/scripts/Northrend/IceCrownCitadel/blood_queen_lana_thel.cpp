/* Copyright (C) 2009 - 2010 TrinityCore <http://www.trinitycore.org/>
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

#define SAY_AGGRO           -1666053
#define SAY_VAMP_BITE     RAND(-1666054,-1666055)
#define SAY_SWARM_SHADOWS   -1666056
#define SAY_PACT_DARKFALLEN -1666057
#define SAY_MIND_CONTROLL   -1666058
#define SAY_AIR_PHASE       -1666059
#define SAY_BERSERK         -1666060
#define SAY_DEATH           -1666061

#define SPELL_PRESENCE_OF_DARKFALLEN   71952
#define SPELL_SHROUD_OF_SORROW         72981
#define SPELL_DELIRIOUS_SLASH          71623
#define SPELL_BLOOD_MIRROR_1           70821
#define SPELL_BLOOD_MIRROR_2           71510
#define SPELL_VAMPIRIC_BITE            71726
#define SPELL_PACT_OF_THE_DARKFALLEN_1 71340
#define SPELL_PACT_OF_THE_DARKFALLEN_2 71341
#define SPELL_SWARMING_SHADOWS         71264
#define SPELL_TWILIGHT_BLOODBOLT       RAID_MODE(71446,71478,71479,71480)
#define SPELL_BLOODBOLT_WHIRL          RAID_MODE(71899,71900,71901,71902)
#define SPELL_BLOODBOLT_SPLASH         RAID_MODE(71447,72481,71482,71483)
#define SPELL_BERSERK                  26662
#define SPELL_INCITE_TERROR            73070
#define SPELL_SWARMING_SHADOWS_VISUAL  71267
#define SPELL_SWARMING_SHADOW       RAID_MODE(71267,72635,72636,72637)
#define SPELL_ESSENCE_OF_BLOOD_QWEEN   70867
#define SPELL_FRENZIED_BLOODTHIRST     70877
#define SPELL_UNCONTROLLABLE_FRENZY    70923

#define CREATURE_SWARMING_SHADOWS 38163

#define DARKFALLEN_TARGET 5

#define  ACHIEVMENT_ONCE_BITTEN_TWICE_SHY RAID_MODE(4539,4618)

const Position SpawnLoc[]=
{
    {4595.640f, 2769.195f, 400.137f}, //phase 2 pos
	{4595.904f, 2769.315f, 421.838f}, //fly pos
};

class boss_blood_queen_lanathel : public CreatureScript
{
public:
    boss_blood_queen_lanathel() : CreatureScript("boss_blood_queen_lanathel") { }

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new boss_blood_queen_lanathelAI(pCreature);
    }
struct boss_blood_queen_lanathelAI : public BossAI
{
    boss_blood_queen_lanathelAI(Creature* pCreature) : BossAI(pCreature, DATA_BLOOD_QUEEN_LANATHEL_EVENT)
    {
		me->ApplySpellImmune(0, IMMUNITY_EFFECT, SPELL_EFFECT_KNOCK_BACK, true);
		me->ApplySpellImmune(0, IMMUNITY_ID, 49560, true);
        pInstance = me->GetInstanceScript();
    }

    InstanceScript* pInstance;

    uint32 m_uiTwilightBloodboltTimer;
    uint32 m_uiPhaseTimer;
    uint32 m_uiVampBiteTimer;
    uint32 m_uiSwarmingShadowsTimer;
    uint32 m_uiPactofDarkfallenTimer;
    uint32 m_uiPactofDarkfallenExplodeTimer;
    uint32 m_uiPactofDarkfallenExplosionCount;
    uint32 m_uiPhase;
    uint32 m_uiBerserkTimer;
    uint32 m_uiSetHoverTimer;
    uint32 m_uiLandingTimer;
    uint32 m_uiFlyingFalseTimer;
    uint32 m_uiBloodboldSplashTimer;
	uint32 m_uiResetTimer;
		
	Unit* Darkfallen[DARKFALLEN_TARGET];

    void Reset()
    {
	    m_uiPhase = 1;
        m_uiPhaseTimer = 90000;
        m_uiTwilightBloodboltTimer = 10000;
        m_uiVampBiteTimer  = 15000;
        m_uiSwarmingShadowsTimer = 30000;
        m_uiPactofDarkfallenTimer  = 5000;
        m_uiSetHoverTimer = 90000;
        m_uiBloodboldSplashTimer = 900000;
        m_uiLandingTimer = 900000;
        m_uiFlyingFalseTimer = 900000;
		m_uiBerserkTimer = 330000;
		
        memset(&Darkfallen, 0, sizeof(Darkfallen));		

        if (pInstance)
		    if (me->isAlive())
                pInstance->SetData(DATA_BLOOD_QUEEN_LANATHEL_EVENT, NOT_STARTED);
    }

    void EnterCombat(Unit *who)
    {
        DoScriptText(SAY_AGGRO, me);
		DoCast(SPELL_SHROUD_OF_SORROW);

        if (pInstance)
            pInstance->SetData(DATA_BLOOD_QUEEN_LANATHEL_EVENT, IN_PROGRESS);
    }

    void KilledUnit(Unit* pVictim)
    {
	    pVictim->RemoveAllAuras();
    }

    void JustDied(Unit* Killer)
    {
        DoScriptText(SAY_DEATH, me);

        if (pInstance)
            pInstance->SetData(DATA_BLOOD_QUEEN_LANATHEL_EVENT, DONE);
    }
		
    void UpdateAI(const uint32 uiDiff)
    {
        if (!UpdateVictim())
            return;

        if (!me->HasAura(SPELL_SHROUD_OF_SORROW))
            DoCast(me, SPELL_SHROUD_OF_SORROW);

        if (m_uiResetTimer <= uiDiff)
        {
            if (me->GetDistance2d(me->GetHomePosition().GetPositionX(), me->GetHomePosition().GetPositionY()) > 75)
                EnterEvadeMode();
            m_uiResetTimer = 5000;
        } else m_uiResetTimer -= uiDiff;

        if (m_uiBerserkTimer < uiDiff)
        {
		    DoScriptText(SAY_BERSERK, me);
            DoCast(me, SPELL_BERSERK);
            m_uiBerserkTimer = 330000;
        } else m_uiBerserkTimer -= uiDiff;

        if (m_uiPhase == 1)
        {
            if (m_uiPactofDarkfallenTimer <= uiDiff)
            {
                DoScriptText(SAY_PACT_DARKFALLEN, me);
                m_uiPactofDarkfallenExplosionCount = 0;
                m_uiPactofDarkfallenExplodeTimer = 2000;
                m_uiPactofDarkfallenTimer = 25000;
            } else m_uiPactofDarkfallenTimer -= uiDiff;

            if (m_uiSwarmingShadowsTimer < uiDiff)
            {
                if(Unit* target = SelectUnit(SELECT_TARGET_RANDOM, 1))
                DoCast(target, SPELL_SWARMING_SHADOWS);
                m_uiSwarmingShadowsTimer = 30000;
            } else m_uiSwarmingShadowsTimer -= uiDiff;

            if (m_uiTwilightBloodboltTimer < uiDiff)
            {
                if(Unit* target = SelectUnit(SELECT_TARGET_RANDOM, 1))
                DoCast(target, SPELL_TWILIGHT_BLOODBOLT);
                m_uiTwilightBloodboltTimer = 9000;
            } else m_uiTwilightBloodboltTimer -= uiDiff;

            if (m_uiVampBiteTimer < uiDiff)
            {
                DoScriptText(SAY_VAMP_BITE, me);
                DoCast(me->getVictim(), SPELL_VAMPIRIC_BITE);
                m_uiVampBiteTimer = 40000;
            } else m_uiVampBiteTimer -= uiDiff;

            if (m_uiPhaseTimer < uiDiff)
            {
                DoScriptText(SAY_AIR_PHASE, me);
                DoCast(me, SPELL_INCITE_TERROR);
                me->GetMotionMaster()->MovePoint(0, SpawnLoc[0]);
                me->SetReactState(REACT_PASSIVE);
                me->AttackStop();
                m_uiPhase = 2;
                m_uiPhaseTimer = 90000;
                m_uiSetHoverTimer = 5000;
                m_uiBloodboldSplashTimer = 10000;
                m_uiLandingTimer = 26000;
                m_uiFlyingFalseTimer = 30000;
            } else m_uiPhaseTimer -= uiDiff;
        }

        if (m_uiPhase == 2)
        {
            if (m_uiSetHoverTimer < uiDiff)
            {
                me->GetMotionMaster()->MovePoint(0, SpawnLoc[1]);
                me->SetUnitMovementFlags(MOVEMENTFLAG_JUMPING);
                me->SetFlying(true);
                m_uiSetHoverTimer = 90000;
            } else m_uiSetHoverTimer -= uiDiff;

            if (m_uiBloodboldSplashTimer < uiDiff)
            {
                std::list<Unit*> targets;
                SelectTargetList(targets, 5, SELECT_TARGET_RANDOM, 80, true);
                for (std::list<Unit*>::const_iterator i = targets.begin(); i != targets.end(); ++i)
                    DoCast(*i, SPELL_TWILIGHT_BLOODBOLT);
                m_uiBloodboldSplashTimer = 2000;
            } else m_uiBloodboldSplashTimer -= uiDiff;

            if (m_uiLandingTimer < uiDiff)
            {
                me->GetMotionMaster()->MovePoint(0, SpawnLoc[0]);
                me->SetUnitMovementFlags(MOVEMENTFLAG_JUMPING);
                m_uiLandingTimer = 900000;
                m_uiBloodboldSplashTimer = 900000;
            } else m_uiLandingTimer -= uiDiff;

            if (m_uiFlyingFalseTimer < uiDiff)
            {
                me->SetFlying(false);
                me->RemoveAllAuras();
                me->SetReactState(REACT_AGGRESSIVE);
                me->GetMotionMaster()->MoveChase(me->getVictim());
                m_uiPhase = 1;
                m_uiFlyingFalseTimer = 900000;
            } else m_uiFlyingFalseTimer -= uiDiff;
        }
        DoMeleeAttackIfReady();
    }
	};
};

class npc_swarming_shadows : public CreatureScript
{
public:
    npc_swarming_shadows() : CreatureScript("npc_swarming_shadows") { }

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new npc_swarming_shadowsAI(pCreature);
    }
struct npc_swarming_shadowsAI : public Scripted_NoMovementAI
{
    npc_swarming_shadowsAI(Creature *pCreature) : Scripted_NoMovementAI(pCreature)
    {
        pInstance = pCreature->GetInstanceScript();
    }

    InstanceScript* pInstance;

    uint32 m_uiSwarmingShadowTimer;

    void Reset()
    {
        m_uiSwarmingShadowTimer = 1200;
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!me->HasAura(SPELL_SWARMING_SHADOWS_VISUAL))
            DoCast(me, SPELL_SWARMING_SHADOWS_VISUAL);

        if (m_uiSwarmingShadowTimer < uiDiff)
        {
            DoCast(me, SPELL_SWARMING_SHADOW);
            m_uiSwarmingShadowTimer = 2000;
        } else m_uiSwarmingShadowTimer -= uiDiff;
    }
};
};

void AddSC_boss_blood_queen_lana_thel()
{
    new boss_blood_queen_lanathel;
    new npc_swarming_shadows;
}
