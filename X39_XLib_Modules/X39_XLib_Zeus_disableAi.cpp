class X39_XLib_Zeus_disableAi: Module_F
{
	author = "X39|Cpt. HM Murdock";
	scope = 2; // Editor visibility; 2 will show it in the menu, 1 will hide it.
	scopeCurator = 2;
	displayName = "Resupply"; // Name displayed in the menu
	icon = "\X39_XLib_Modules\Res\X39_XLib_Resupply"; // Map icon. Delete this entry to use the default icon
	category = "X39_XLib";
	side = 7;
	curatorCost = 5;

	function = "X39_XLib_Modules_fnc_X39_XLib_Zeus_disableAi";
	functionPriority = 1;
	isGlobal = 1;
	isPersistent = 1;
	isTriggerActivated = 1;
	isDisposable = 1;
	class Arguments
	{
	};
	class ModuleDescription: ModuleDescription
	{
		description = "Creates a resupply position at the given spot";		
	};
};