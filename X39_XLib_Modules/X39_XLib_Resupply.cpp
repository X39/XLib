class X39_XLib_Resupply: Module_F
{
	author = "X39|Cpt. HM Murdock";
	scope = 2; // Editor visibility; 2 will show it in the menu, 1 will hide it.
	displayName = "Resupply"; // Name displayed in the menu
	icon = "\X39_XLib_Modules\Res\X39_XLib_Resupply"; // Map icon. Delete this entry to use the default icon
	category = "X39_XLib";
	side = 7;

	function = "X39_XLib_Modules_fnc_X39_XLib_Resupply";
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
			description = "How often (in s) should the server check for new units?";
			typeName = "NUMBER";
			defaultValue = 3;
		};
		class checkRange
		{
			displayName = "Range";
			description = "How far will the resupply be applied?";
			typeName = "NUMBER";
			defaultValue = 6;
		};
		class vehicleClass
		{
			displayName = "Resuplly X Vehicles";
			description = "allow marking of dead units";
			typeName = "STRING";
			class values : ArgumentsBaseUnits
			{
				class opt_1		{name = "All"; value = "AllVehicles"; default = 1;};
				class opt_2		{name = "Air"; value = "Air"; default = 0;};
				class opt_3		{name = "Helicopter"; value = "Helicopter"; default = 0;};
				class opt_4		{name = "Plane"; value = "Plane"; default = 0;};
				class opt_5		{name = "Land"; value = "LandVehicle"; default = 0;};
				class opt_6		{name = "Car"; value = "Car"; default = 0;};
				class opt_7		{name = "Armored"; value = "Tank"; default = 0;};
			};
		};
		class createHelipad
		{
			displayName = "Create Helipad";
			description = "Creates a helipad as landmark";
			typeName = "NUMBER";
			class values : ArgumentsBaseUnits
			{
				class opt_1		{name = "Yes"; value = 1; default = 1;};
				class opt_2		{name = "No"; value = 0; default = 0;};
			};
		};
		class createMarker
		{
			displayName = "Create Marker";
			description = "Creates a marker";
			typeName = "NUMBER";
			class values : ArgumentsBaseUnits
			{
				class opt_1		{name = "Yes"; value = 1; default = 1;};
				class opt_2		{name = "No"; value = 0; default = 0;};
			};
		};
	};
	class ModuleDescription: ModuleDescription
	{
		description = "Creates a resupply position at the given spot";		
	};
};