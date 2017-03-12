class X2Effect_HeavyRounds extends X2Effect_Persistent;

function int GetAttackingDamageModifier(XComGameState_Effect EffectState, XComGameState_Unit Attacker, Damageable TargetDamageable, XComGameState_Ability AbilityState, const out EffectAppliedData AppliedData, const int CurrentDamage, optional XComGameState NewGameState)
{
	local XComGameState_Unit TargetUnit;

	TargetUnit = XComGameState_Unit(TargetDamageable);
	if (TargetUnit != None && class'XComGameStateContext_Ability'.static.IsHitResultHit(AppliedData.AbilityResultContext.HitResult) && AbilityState.SourceWeapon == EffectState.ApplyEffectParameters.ItemStateObjectRef)
	{
		return 1; // TODO config
	}

	return 0;
}

defaultproperties
{
    DuplicateResponse=eDupe_Ignore
    EffectName="FW_HeavyRounds"
}