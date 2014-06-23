class X39_XLib_GarbageCollector: Module_F
{
	author = "X39|Cpt. HM Murdock";
	scope = 2; // Editor visibility; 2 will show it in the menu, 1 will hide it.
	displayName = "GarbageCollector"; // Name displayed in the menu
	icon = "\X39_XLib_Modules\Res\X39_XLib_GarbageCollector"; // Map icon. Delete this entry to use the default icon
	category = "X39_XLib";
	side = 7;

	function = "X39_XLib_Modules_fnc_X39_XLib_GarbageCollector";
	functionPriority = 1;
	isGlobal = 0;
	isPersistent = 1;
	isTriggerActivated = 0;
	isDisposable = 0;
	class Arguments
	{
		class checkRate
		{
			displayName = "Rate";
			description = "How often (in s) should objects be marked for deletion?";
			typeName = "NUMBER";
			defaultValue = 200;
		};
		class checkDeadUnits
		{
			displayName = "mark DeadUnits";
			description = "allow marking of dead units";
			typeName = "NUMBER";
			class values : ArgumentsBaseUnits
			{
				class opt_1		{name = "yes"; value = 1; default = 1;};
				class opt_2		{name = "no"; value = 0; default = 0;};
			};
		};
		class checkDroppedItems
		{
			displayName = "mark dropped items";
			description = "allow marking of dropped items";
			typeName = "NUMBER";
			class values : ArgumentsBaseUnits
			{
				class opt_1		{name = "yes"; value = 1; default = 1;};
				class opt_2		{name = "no"; value = 0; default = 0;};
			};
		};
		class checkEmptyGroups
		{
			displayName = "remove empty groups";
			description = "allows the module to remove empty groups from game (usefull if you can get group counts >100 where youre not removing the groups after all group members are dead)";
			typeName = "NUMBER";
			class values : ArgumentsBaseUnits
			{
				class opt_1		{name = "yes"; value = 1; default = 1;};
				class opt_2		{name = "no"; value = 0; default = 0;};
			};
		};
	};
	class ModuleDescription: ModuleDescription
	{
		description = "GarbageCollector module<br />Will remove on regular base everything you told it to remove from current mission<br />This works through first marking objects and in next runthrough removing them<br />Placing this module can increase the missions performance!";		
	};
};