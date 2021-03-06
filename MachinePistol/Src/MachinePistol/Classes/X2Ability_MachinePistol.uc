class X2Ability_MachinePistol extends X2Ability config(FavidMachinePistolAbility);

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;
	
	Templates.AddItem(FireMachinePistol());
	Templates.AddItem(MachineSpray());
	Templates.AddItem(Yellowjacket());
	Templates.AddItem(HeavyRounds());
	Templates.AddItem(SnapShotDamagePenalty());

	return Templates;
}

// Fire Machine Pistol
// (AbilityName="FW_FireMachinePistol",		ApplyToWeaponSlot=eInvSlot_SecondaryWeapon)
// Fire 3 shots at a target with your secondary weapon.
static function X2AbilityTemplate FireMachinePistol()
{
	local X2AbilityTemplate                 Template;	
	local X2AbilityCost_Ammo                AmmoCost;
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2Effect_ApplyWeaponDamage        WeaponDamageEffect;
	local X2AbilityMultiTarget_BurstFire    BurstFireMultiTarget;
	local X2AbilityToHitCalc_StandardAim    ToHitCalc;

	// Macro to do localisation and stuffs
	`CREATE_X2ABILITY_TEMPLATE(Template, 'FW_FireMachinePistol');

	// Icon Properties
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_fanfire";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.STANDARD_PISTOL_SHOT_PRIORITY;
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
	Template.DisplayTargetHitChance = true;
	Template.AbilitySourceName = 'eAbilitySource_Perk';                                       // color of the icon
	Template.AbilityConfirmSound = "TacticalUI_ActivateAbility";
	
	// Activated by a button press; additionally, tells the AI this is an activatable
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	// *** VALIDITY CHECKS *** //
	Template.AddShooterEffectExclusions();

	// Targeting Details
	// Can only shoot visible enemies
	Template.AbilityTargetConditions.AddItem(default.GameplayVisibilityCondition);
	// Can't target dead; Can't target friendlies
	Template.AbilityTargetConditions.AddItem(default.LivingHostileTargetProperty);
	// Can't shoot while dead
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	// Only at single targets that are in range.
	Template.AbilityTargetStyle = default.SimpleSingleTarget;

	// Action Point
	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bConsumeAllPoints = true;
	Template.AbilityCosts.AddItem(ActionPointCost);	

	// Ammo
	AmmoCost = new class'X2AbilityCost_Ammo';	
	AmmoCost.iAmmo = 1;
	Template.AbilityCosts.AddItem(AmmoCost);
	Template.bAllowAmmoEffects = false; // 	

	// Damage Effect
	WeaponDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	Template.AddTargetEffect(WeaponDamageEffect);
	Template.AddMultiTargetEffect(WeaponDamageEffect);

	ToHitCalc = new class'X2AbilityToHitCalc_StandardAim';
	Template.AbilityToHitCalc = ToHitCalc;
	Template.AbilityToHitOwnerOnMissCalc = ToHitCalc;

	BurstFireMultiTarget = new class'X2AbilityMultiTarget_BurstFire';
	BurstFireMultiTarget.NumExtraShots = 2;
	Template.AbilityMultiTargetStyle = BurstFireMultiTarget;
		
	// Targeting Method
	Template.TargetingMethod = class'X2TargetingMethod_OverTheShoulder';
	Template.CinescriptCameraType = "StandardGunFiring";

	// Voice events
	Template.ActivationSpeech = 'FanFire';

	// MAKE IT LIVE!
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;	

	return Template;	
}

// Machine Spray
// (AbilityName="FW_MachineSpray",		ApplyToWeaponSlot=eInvSlot_SecondaryWeapon)
// Fire 4 shots at a target with your secondary weapon.
static function X2AbilityTemplate MachineSpray()
{
	local X2AbilityTemplate                 Template;	
	local X2AbilityCost_Ammo                AmmoCost;
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2Effect_ApplyWeaponDamage        WeaponDamageEffect;
	local X2AbilityMultiTarget_BurstFire    BurstFireMultiTarget;
	local X2AbilityToHitCalc_StandardAim    ToHitCalc;

	// Macro to do localisation and stuffs
	`CREATE_X2ABILITY_TEMPLATE(Template, 'FW_MachineSpray');

	// Icon Properties
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_fanfire";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.STANDARD_PISTOL_SHOT_PRIORITY;
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
	Template.DisplayTargetHitChance = true;
	Template.AbilitySourceName = 'eAbilitySource_Perk';                                       // color of the icon
	Template.AbilityConfirmSound = "TacticalUI_ActivateAbility";
	
	// Activated by a button press; additionally, tells the AI this is an activatable
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	// *** VALIDITY CHECKS *** //
	Template.AddShooterEffectExclusions();

	// Targeting Details
	// Can only shoot visible enemies
	Template.AbilityTargetConditions.AddItem(default.GameplayVisibilityCondition);
	// Can't target dead; Can't target friendlies
	Template.AbilityTargetConditions.AddItem(default.LivingHostileTargetProperty);
	// Can't shoot while dead
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	// Only at single targets that are in range.
	Template.AbilityTargetStyle = default.SimpleSingleTarget;

	// Action Point
	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bConsumeAllPoints = true;
	Template.AbilityCosts.AddItem(ActionPointCost);	

	// Ammo
	AmmoCost = new class'X2AbilityCost_Ammo';	
	AmmoCost.iAmmo = 1;
	Template.AbilityCosts.AddItem(AmmoCost);
	Template.bAllowAmmoEffects = false; // 	

	// Damage Effect
	WeaponDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	Template.AddTargetEffect(WeaponDamageEffect);
	Template.AddMultiTargetEffect(WeaponDamageEffect);

	ToHitCalc = new class'X2AbilityToHitCalc_StandardAim';
	Template.AbilityToHitCalc = ToHitCalc;
	Template.AbilityToHitOwnerOnMissCalc = ToHitCalc;

	BurstFireMultiTarget = new class'X2AbilityMultiTarget_BurstFire';
	BurstFireMultiTarget.NumExtraShots = 3;
	Template.AbilityMultiTargetStyle = BurstFireMultiTarget;
		
	// Targeting Method
	Template.TargetingMethod = class'X2TargetingMethod_OverTheShoulder';
	Template.CinescriptCameraType = "StandardGunFiring";

	// Voice events
	Template.ActivationSpeech = 'FanFire';

	// MAKE IT LIVE!
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;	
	
	// This ability is used in place of the normal Fire Machine Pistol ability
	Template.OverrideAbilities.AddItem('FW_FireMachinePistol');

	return Template;	
}

// Yellowjacket
// (AbilityName="FW_Yellowjacket",		ApplyToWeaponSlot=eInvSlot_SecondaryWeapon)
// Shots fired by your machine pistol now ignore armor. Passive.
static function X2AbilityTemplate Yellowjacket()
{
	local X2AbilityTemplate					Template;
	local X2Effect_Yellowjacket				ArmorPiercingBonus;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'FW_Yellowjacket');
	
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_fanfire";
	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);
	Template.bIsPassive = true;
	Template.bCrossClassEligible = false;

	ArmorPiercingBonus = new class 'X2Effect_Yellowjacket';
	ArmorPiercingBonus.BuildPersistentEffect (1, true, false);
	ArmorPiercingBonus.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, true,,Template.AbilitySourceName);
	Template.AddTargetEffect (ArmorPiercingBonus);
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	
	return Template;		
}

// Heavy Rounds
// (AbilityName="FW_HeavyRounds",		ApplyToWeaponSlot=eInvSlot_SecondaryWeapon)
// Shots fired by your machine pistol now deal 1 additional damage. Passive.
static function X2AbilityTemplate HeavyRounds()
{
	local X2AbilityTemplate					Template;
	local X2Effect_HeavyRounds				DamageBonus;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'FW_HeavyRounds');
	
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_fanfire";
	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);
	Template.bIsPassive = true;
	Template.bCrossClassEligible = false;

	DamageBonus = new class 'X2Effect_HeavyRounds';
	DamageBonus.BuildPersistentEffect (1, true, false);
	DamageBonus.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, true,,Template.AbilitySourceName);
	Template.AddTargetEffect (DamageBonus);
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	
	return Template;		
}

// Snapshot Damage Penalty
// (AbilityName="FW_SnapShotDamagePenalty",		ApplyToWeaponSlot=eInvSlot_PrimaryWeapon)
// Shots fired by your primary weapon deal slightly less damage. Passive.
static function X2AbilityTemplate SnapShotDamagePenalty()
{
	local X2AbilityTemplate					Template;
	local X2Effect_SnapShotDamagePenalty				DamageMalus;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'FW_SnapShotDamagePenalty');
	
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_fanfire";
	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);
	Template.bIsPassive = true;
	Template.bCrossClassEligible = false;

	DamageMalus = new class 'X2Effect_SnapShotDamagePenalty';
	DamageMalus.BuildPersistentEffect (1, true, false);
	//DamageMalus.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, true,,Template.AbilitySourceName);
	Template.AddTargetEffect (DamageMalus);
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	
	return Template;		
}