class X39_GM_Insurgency_Module: Module_F
{
	author = "X39|Cpt. HM Murdock";
	scope = 2; // Editor visibility; 2 will show it in the menu, 1 will hide it.
	displayName = "Insurgency - Base"; // Name displayed in the menu
	icon = "\X39_GM_Insurgency\Res\INS_2.paa"; // Map icon. Delete this entry to use the default icon
	category = "X39_XLib";
	side = 7;

	function = "X39_GM_Insurgency_fnc_module_X39_GM_Insurgency";
	functionPriority = 10;
	isGlobal = 1;
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
		class minSpawnPositionsForBuildings
		{
			displayName = "min required buildingPositions";
			description = "default: -1; Argument is required on all maps where ""MapSize"" is not defined in config";
			typeName = "NUMBER";
			class values : ArgumentsBaseUnits
			{
				
				class opt_1	{name = "at least 1 buildingPosition"; value = 1; default = 0;};
				class opt_2	{name = "at least 2 buildingPositions"; value = 2; default = 0;};
				class opt_3	{name = "at least 3 buildingPositions"; value = 3; default = 1;};
				class opt_4	{name = "at least 4 buildingPositions"; value = 4; default = 0;};
				class opt_5	{name = "at least 5 buildingPositions"; value = 5; default = 0;};
				class opt_6	{name = "at least 6 buildingPositions"; value = 6; default = 0;};
				class opt_7	{name = "at least 7 buildingPositions"; value = 7; default = 0;};
			};
		};
		class enemiesSide
		{
			displayName = "Enemies side";
			description = "Which side are the units from you want to let spawn at the InsurgencySquareMarkers";
			typeName = "NUMBER";
			class values : ArgumentsBaseUnits
			{
				class opt_1	{name = "WEST --> BLUFOR"; value = 1; default = 0;};
				class opt_2	{name = "EAST --> OPFOR"; value = 2; default = 0;};
				class opt_3	{name = "GUER --> INSURGENTS"; value = 3; default = 1;};
				class opt_4	{name = "CIV  --> CIVILIAN"; value = 4; default = 0;};
			};
		};
		class spawnrange
		{
			displayName = "Spawnrange";
			description = "At which range units will be spawned";
			typeName = "NUMBER";
			defaultValue = 200;
		};
		class deathTimeout
		{
			displayName = "RespawnTimeout";
			description = "Time (in s) before units will be respawned inside of a square";
			typeName = "NUMBER";
			defaultValue = 60;
		};
		class maxUnitsPerPlayer
		{
			displayName = "MUPP";
			description = "'MaxUnitsPerPlayer' - How many enemies can spawn per player";
			typeName = "NUMBER";
			class values : ArgumentsBaseUnits
			{
				class opt_1		{name = "1"; value = 1; default = 0;};
				class opt_2		{name = "2"; value = 2; default = 0;};
				class opt_3		{name = "3"; value = 3; default = 0;};
				class opt_4		{name = "4"; value = 4; default = 0;};
				class opt_5		{name = "6"; value = 6; default = 0;};
				class opt_6		{name = "8"; value = 8; default = 0;};
				class opt_7		{name = "10"; value = 10; default = 1;};
				class opt_8		{name = "15"; value = 15; default = 0;};
				class opt_9		{name = "20"; value = 20; default = 0;};
				class opt_10	{name = "30"; value = 30; default = 0;};
				class opt_11	{name = "40"; value = 40; default = 0;};
				class opt_12	{name = "50"; value = 50; default = 0;};
				class opt_13	{name = "100"; value = 100; default = 0;};
			};
		};
		class maxUnitsPerSquare
		{
			displayName = "AEPS";
			description = "'AllowedUnitsPerSquare' - How many enemies will spawn per player square";
			typeName = "NUMBER";
			class values : ArgumentsBaseUnits
			{
				class opt_1	{name = "1:1"; value = 1; default = 0;};
				class opt_2	{name = "1:2"; value = 2; default = 0;};
				class opt_3	{name = "1:3"; value = 3; default = 1;};
				class opt_4	{name = "1:4"; value = 4; default = 0;};
				class opt_5	{name = "1:6"; value = 6; default = 0;};
				class opt_6	{name = "1:8"; value = 8; default = 0;};
				class opt_7	{name = "1:10"; value = 10; default = 0;};
			};
		};
		class hcUnitName
		{
			displayName = "HC UnitName";
			description = "Name of HeadlessClient unit, leave empty to use the server";
			typeName = "STRING";
		};
	};
	class ModuleDescription: ModuleDescription
	{
		description = "Insurgency gamemode module";
		sync[] = {"AnyAI", "avoidModuleUnit"};
		
		class avoidModuleUnit
		{
			description = "Defined areas wont be filled with insurgency objects";
			displayName = "Insurgency - Avoid";
			icon = "\X39_GM_Insurgency\Res\INS_3.paa";
			position = 1;
			direction = 0;
			optional = 1;
			duplicate = 1;
			side = 3;
		};
	};
};
class X39_GM_Insurgency_Avoid_Module: Module_F
{
	author = "X39|Cpt. HM Murdock";
	scope = 2; // Editor visibility; 2 will show it in the menu, 1 will hide it.
	displayName = "Insurgency - Avoid"; // Name displayed in the menu
	icon = "\X39_GM_Insurgency\Res\INS_3.paa"; // Map icon. Delete this entry to use the default icon
	category = "X39_XLib";
	side = 7;

	function = "X39_GM_Insurgency_fnc_module_X39_GM_Insurgency_Avoid";
	functionPriority = 0;
	isGlobal = 1;
	isPersistent = 1;
	isTriggerActivated = 0;
	isDisposable = 0;
	class Arguments
	{
		class avoidRange
		{
			displayName = "Range";
			description = "Range which shall be avoided (circle)";
			typeName = "NUMBER";
		};
	};
	class ModuleDescription: ModuleDescription
	{
		description = "For use with BaseModule<br />Defined area wont be filled with insurgency objects";
	};
};
