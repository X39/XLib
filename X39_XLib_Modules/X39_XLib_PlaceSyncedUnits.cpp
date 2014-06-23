class X39_XLib_PlaceSyncedUnits: Module_F
{
	author = "X39|Cpt. HM Murdock";
	scope = 2; // Editor visibility; 2 will show it in the menu, 1 will hide it.
	displayName = "Unit Placer"; // Name displayed in the menu
	icon = "\X39_XLib_Modules\Res\X39_XLib_PlaceSyncedUnits"; // Map icon. Delete this entry to use the default icon
	category = "X39_XLib";
	side = 7;

	function = "X39_XLib_Modules_fnc_X39_XLib_PlaceSyncedUnits";
	functionPriority = 1;
	isGlobal = 0;
	isPersistent = 1;
	isTriggerActivated = 1;
	isDisposable = 0;
	class Arguments
	{
		class Units;
	};
	class ModuleDescription: ModuleDescription
	{
		description = "GarbageCollector module<br />Will remove on regular base everything you told it to remove from current mission<br />This works through first marking objects and in next runthrough removing them<br />Placing this module can increase the missions performance!";		
	};
};