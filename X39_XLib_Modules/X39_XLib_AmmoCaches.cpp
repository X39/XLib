class X39_XLib_AmmoCaches: Module_F
{
	author = "X39|Cpt. HM Murdock";
	scope = 2; // Editor visibility; 2 will show it in the menu, 1 will hide it.
	displayName = "Ammo caches"; // Name displayed in the menu
	//icon = "\X39_XLib_Modules\Res\X39_XLib_Resupply"; // Map icon. Delete this entry to use the default icon
	category = "X39_XLib";
	side = 7;

	function = "X39_XLib_Modules_fnc_X39_XLib_AmmoCaches";
	functionPriority = 1;
	isGlobal = 0;
	isPersistent = 1;
	isTriggerActivated = 0;
	isDisposable = 0;
	class Arguments
	{
		class overrideMapSize
		{
			displayName = "Override map size";
			description = "default: -1; Argument is required on all maps where ""MapSize"" is not defined in config";
			typeName = "NUMBER";
			defaultValue = -1;
		};
		class Count
		{
			displayName = "Count";
			description = "How many ammo caches shall be created? (can be code)";
			typeName = "STRING";
			defaultValue = 3;
		};
		class DropIntelType
		{
			displayName = "Intel type";
			description = "How will the player gather the intel";
			typeName = "NUMBER";
			class values : ArgumentsBaseUnits
			{
				class opt_1		{name = "Dropped by Enemies"; value = 0; default = 1;};
				class opt_2		{name = "Placed randomly in buildings"; value = 1; default = 0;};
			};
		};
		class DropIntelSide
		{
			displayName = "Side where intel gets dropped";
			description = "'Dropped by Enemies' needs to be set at 'Intel type'";
			typeName = "NUMBER";
			class values : ArgumentsBaseUnits
			{
				class opt_1	{name = "WEST --> BLUFOR"; value = 1; default = 0;};
				class opt_2	{name = "EAST --> OPFOR"; value = 2; default = 0;};
				class opt_3	{name = "GUER --> INSURGENTS"; value = 3; default = 1;};
				class opt_4	{name = "CIV  --> CIVILIAN"; value = 4; default = 0;};
			};
		};
		class IntelRate
		{
			displayName = "Intel rate";
			description = "How much intel will be created (% per house/unit)? (can be code)";
			typeName = "STRING";
			defaultValue = 0.75;
		};
	};
	class ModuleDescription: ModuleDescription
	{
		description = "Creates ammo caches + the intel to find them";		
	};
};