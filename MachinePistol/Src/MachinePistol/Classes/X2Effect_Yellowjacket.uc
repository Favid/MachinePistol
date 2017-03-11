class X2Effect_Yellowjacket extends X2Effect_Persistent;

function int GetExtraArmorPiercing(XComGameState_Effect EffectState, XComGameState_Unit Attacker, Damageable TargetDamageable, XComGameState_Ability AbilityState, const out EffectAppliedData AppliedData)
{
	local XComGameState_Unit		Target;

	Target = XComGameState_Unit(`XCOMHISTORY.GetGameStateForObjectID(AppliedData.TargetStateObjectRef.ObjectID));
	if (Target != none)
	{
		if (AbilityState.SourceWeapon == EffectState.ApplyEffectParameters.ItemStateObjectRef)
		{
			return 9999;
		}
	}

	return 0;
}

defaultproperties
{
    DuplicateResponse=eDupe_Ignore
    EffectName="FW_Yellowjacket"
}

