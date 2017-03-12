class X2Effect_SnapShotDamagePenalty extends X2Effect_Persistent;

function int GetAttackingDamageModifier(XComGameState_Effect EffectState, XComGameState_Unit Attacker, Damageable TargetDamageable, XComGameState_Ability AbilityState, const out EffectAppliedData AppliedData, const int CurrentDamage, optional XComGameState NewGameState)
{
	local XComGameState_Unit TargetUnit;
	local XComGameState_Item SourceWeapon;
	local X2WeaponTemplate SourceWeaponTemplate;

	TargetUnit = XComGameState_Unit(TargetDamageable);
	if (TargetUnit != None && class'XComGameStateContext_Ability'.static.IsHitResultHit(AppliedData.AbilityResultContext.HitResult) && AbilityState.SourceWeapon == EffectState.ApplyEffectParameters.ItemStateObjectRef)
	{
		SourceWeapon = AbilityState.GetSourceWeapon();
		SourceWeaponTemplate = X2WeaponTemplate(SourceWeapon.GetMyTemplate());

		// TODO config
		if(SourceWeaponTemplate.WeaponTech == 'conventional')
		{
			return -1;
		}
		else if(SourceWeaponTemplate.WeaponTech == 'laser_lw')
		{
			return -1;
		}
		else if(SourceWeaponTemplate.WeaponTech == 'magnetic')
		{
			return -1;
		}
		else if(SourceWeaponTemplate.WeaponTech == 'coil_lw')
		{
			return -2;
		}
		else if(SourceWeaponTemplate.WeaponTech == 'beam')
		{
			return -2;
		}
	}

	return 0;
}

defaultproperties
{
    DuplicateResponse=eDupe_Ignore
    EffectName="FW_SnapShotDamagePenalty"
}