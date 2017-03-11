class X2Item_MachinePistol extends X2Item config(FavidMachinePistol);

var config WeaponDamageValue MACHINEPISTOL_CONVENTIONAL_BASEDAMAGE;
var config WeaponDamageValue MACHINEPISTOL_MAGNETIC_BASEDAMAGE;
var config WeaponDamageValue MACHINEPISTOL_BEAM_BASEDAMAGE;

var config int MACHINEPISTOL_CONVENTIONAL_AIM;
var config int MACHINEPISTOL_MAGNETIC_AIM;
var config int MACHINEPISTOL_BEAM_AIM;

var config int MACHINEPISTOL_CONVENTIONAL_CRITCHANCE;
var config int MACHINEPISTOL_MAGNETIC_CRITCHANCE;
var config int MACHINEPISTOL_BEAM_CRITCHANCE;

var config int MACHINEPISTOL_CONVENTIONAL_ICLIPSIZE;
var config int MACHINEPISTOL_MAGNETIC_ICLIPSIZE;
var config int MACHINEPISTOL_BEAM_ICLIPSIZE;

var config int MACHINEPISTOL_CONVENTIONAL_ISOUNDRANGE;
var config int MACHINEPISTOL_MAGNETIC_ISOUNDRANGE;
var config int MACHINEPISTOL_BEAM_ISOUNDRANGE;

var config int MACHINEPISTOL_CONVENTIONAL_IENVIRONMENTDAMAGE;
var config int MACHINEPISTOL_MAGNETIC_IENVIRONMENTDAMAGE;
var config int MACHINEPISTOL_BEAM_IENVIRONMENTDAMAGE;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> ModWeapons;

	ModWeapons.AddItem(CreateTemplate_MachinePistol_CV());
	ModWeapons.AddItem(CreateTemplate_MachinePistol_MG());
	ModWeapons.AddItem(CreateTemplate_MachinePistol_BM());

	return ModWeapons;
}

static function X2DataTemplate CreateTemplate_MachinePistol_CV()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'MachinePistol_CV');
	Template.WeaponPanelImage = "_Pistol";                       // used by the UI. Probably determines iconview of the weapon.

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'machine_pistol';
	Template.WeaponTech = 'conventional';
	Template.strImage = "img:///UILibrary_Common.ConvSecondaryWeapons.ConvPistol";
	Template.EquipSound = "Secondary_Weapon_Equip_Conventional";
	Template.Tier = 1;

	Template.RangeAccuracy = class'X2Item_DefaultWeapons'.default.SHORT_CONVENTIONAL_RANGE;
	Template.BaseDamage = default.MACHINEPISTOL_CONVENTIONAL_BASEDAMAGE;
	Template.Aim = default.MACHINEPISTOL_CONVENTIONAL_AIM;
	Template.CritChance = default.MACHINEPISTOL_CONVENTIONAL_CRITCHANCE;
	Template.iClipSize = default.MACHINEPISTOL_CONVENTIONAL_ICLIPSIZE;
	Template.iSoundRange = default.MACHINEPISTOL_CONVENTIONAL_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.MACHINEPISTOL_CONVENTIONAL_IENVIRONMENTDAMAGE;

	Template.NumUpgradeSlots = 1;

	Template.InfiniteAmmo = true;
	
	Template.InventorySlot = eInvSlot_SecondaryWeapon;
	//Template.Abilities.AddItem('PistolOverwatch');
	//Template.Abilities.AddItem('PistolOverwatchShot');
	//Template.Abilities.AddItem('PistolReturnFire');
	//Template.Abilities.AddItem('HotLoadAmmo');
	//Template.Abilities.AddItem('Reload');

	Template.SetAnimationNameForAbility('FW_FireMachinePistol', 'FF_FireMultiShotConvA');	
	
	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "WP_Pistol_CV.WP_Pistol_CV";

	Template.iPhysicsImpulse = 5;
	
	Template.UpgradeItem = 'MachinePistol_MG';

	Template.StartingItem = true;
	Template.CanBeBuilt = false;

	Template.DamageTypeTemplateName = 'Projectile_Conventional';

	Template.bHideClipSizeStat = true;

	return Template;
}

static function X2DataTemplate CreateTemplate_MachinePistol_MG()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'MachinePistol_MG');
	Template.WeaponPanelImage = "_Pistol";                       // used by the UI. Probably determines iconview of the weapon.

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'machine_pistol';
	Template.WeaponTech = 'magnetic';
	Template.strImage = "img:///UILibrary_Common.MagSecondaryWeapons.MagPistol";
	Template.EquipSound = "Secondary_Weapon_Equip_Magnetic";
	Template.Tier = 2;

	Template.RangeAccuracy = class'X2Item_DefaultWeapons'.default.SHORT_MAGNETIC_RANGE;
	Template.BaseDamage = default.MACHINEPISTOL_MAGNETIC_BASEDAMAGE;
	Template.Aim = default.MACHINEPISTOL_MAGNETIC_AIM;
	Template.CritChance = default.MACHINEPISTOL_MAGNETIC_CRITCHANCE;
	Template.iClipSize = default.MACHINEPISTOL_MAGNETIC_ICLIPSIZE;
	Template.iSoundRange = default.MACHINEPISTOL_MAGNETIC_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.MACHINEPISTOL_MAGNETIC_IENVIRONMENTDAMAGE;

	Template.NumUpgradeSlots = 2;

	Template.InfiniteAmmo = true;

	Template.InventorySlot = eInvSlot_SecondaryWeapon;
	//Template.Abilities.AddiTem('PistolStandardShot');
	//Template.Abilities.AddItem('PistolOverwatch');
	//Template.Abilities.AddItem('PistolOverwatchShot');
	//Template.Abilities.AddItem('PistolReturnFire');
	//Template.Abilities.AddItem('HotLoadAmmo');
	//Template.Abilities.AddItem('Reload');

	Template.SetAnimationNameForAbility('FW_FireMachinePistol', 'FF_FireMultiShotMagA');
	
	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "WP_Pistol_MG.WP_Pistol_MG";

	Template.iPhysicsImpulse = 5;

	Template.CreatorTemplateName = 'MachinePistol_MG_Schematic'; // The schematic which creates this item
	Template.BaseItem = 'MachinePistol_CV'; // Which item this will be upgraded from

	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;

	Template.DamageTypeTemplateName = 'Projectile_MagXCom';

	Template.bHideClipSizeStat = true;

	return Template;
}

static function X2DataTemplate CreateTemplate_MachinePistol_BM()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'MachinePistol_BM');
	Template.WeaponPanelImage = "_Pistol";                       // used by the UI. Probably determines iconview of the weapon.

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'machine_pistol';
	Template.WeaponTech = 'beam';
	Template.strImage = "img:///UILibrary_Common.BeamSecondaryWeapons.BeamPistol";
	Template.EquipSound = "Secondary_Weapon_Equip_Beam";
	Template.Tier = 5;

	Template.RangeAccuracy = class'X2Item_DefaultWeapons'.default.SHORT_BEAM_RANGE;
	Template.BaseDamage = default.MACHINEPISTOL_BEAM_BASEDAMAGE;
	Template.Aim = default.MACHINEPISTOL_BEAM_AIM;
	Template.CritChance = default.MACHINEPISTOL_BEAM_CRITCHANCE;
	Template.iClipSize = default.MACHINEPISTOL_BEAM_ICLIPSIZE;
	Template.iSoundRange = default.MACHINEPISTOL_BEAM_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.MACHINEPISTOL_BEAM_IENVIRONMENTDAMAGE;

	Template.NumUpgradeSlots = 2;

	Template.InfiniteAmmo = true;
	
	Template.InventorySlot = eInvSlot_SecondaryWeapon;
	//Template.Abilities.AddiTem('PistolStandardShot');
	//Template.Abilities.AddItem('PistolOverwatch');
	//Template.Abilities.AddItem('PistolOverwatchShot');
	//Template.Abilities.AddItem('PistolReturnFire');
	//Template.Abilities.AddItem('HotLoadAmmo');
	//Template.Abilities.AddItem('Reload');

	Template.SetAnimationNameForAbility('FW_FireMachinePistol', 'FF_FireMultiShotBeamA');
	
	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "WP_Pistol_BM.WP_Pistol_BM";

	Template.iPhysicsImpulse = 5;

	Template.CreatorTemplateName = 'MachinePistol_BM_Schematic'; // The schematic which creates this item
	Template.BaseItem = 'MachinePistol_MG'; // Which item this will be upgraded from

	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;
	
	Template.DamageTypeTemplateName = 'Projectile_BeamXCom';

	Template.bHideClipSizeStat = true;

	return Template;
}