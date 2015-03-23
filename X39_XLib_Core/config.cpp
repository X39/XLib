class CfgPatches{
	class X39_XLib_Core{
         units[] = {};
         weapons[] = {};
         requiredVersion = 1.0;
         requiredAddons[] = {};
         author = "X39|Cpt. HM Murdock";
         mail = "killerx29@gmail.com";
	};
};

class X39_XLib_Function_TypeA{
	scope = 0;
	preInit = 0; // 1 to call the function upon mission start, before objects are initialized. Passed arguments are ["preInit"]
	postInit = 0; // 1 to call the function upon mission start, after objects are initialized. Passed arguments are ["postInit"]
	recompile = 0; // 1 to recompile the function upon mission start
	ext = ".sqf"; // Set file type, can be ".sqf" or ".fsm" (meaning scripted FSM). Default is ".sqf".
};
class X39_XLib_Function_TypeB{
	scope = 0;
	preInit = 1; // 1 to call the function upon mission start, before objects are initialized. Passed arguments are ["preInit"]
	postInit = 0; // 1 to call the function upon mission start, after objects are initialized. Passed arguments are ["postInit"]
	recompile = 1; // 1 to recompile the function upon mission start
	ext = ".sqf"; // Set file type, can be ".sqf" or ".fsm" (meaning scripted FSM). Default is ".sqf".
};
class X39_XLib_Function_TypeC{
	scope = 0;
	preInit = 0; // 1 to call the function upon mission start, before objects are initialized. Passed arguments are ["preInit"]
	postInit = 1; // 1 to call the function upon mission start, after objects are initialized. Passed arguments are ["postInit"]
	recompile = 1; // 1 to recompile the function upon mission start
	ext = ".sqf"; // Set file type, can be ".sqf" or ".fsm" (meaning scripted FSM). Default is ".sqf".
};
class X39_XLib_Function_TypeD{
	scope = 0;
	preInit = 1; // 1 to call the function upon mission start, before objects are initialized. Passed arguments are ["preInit"]
	postInit = 1; // 1 to call the function upon mission start, after objects are initialized. Passed arguments are ["postInit"]
	recompile = 1; // 1 to recompile the function upon mission start
	ext = ".sqf"; // Set file type, can be ".sqf" or ".fsm" (meaning scripted FSM). Default is ".sqf".
};
class CfgFunctions{
	class X39_XLib {
		class X39_Core{
			class init:X39_XLib_Function_TypeD									{file = "\X39_XLib_Core\XLib\Functions\init.sqf";};
			
			class gcDo:X39_XLib_Function_TypeA									{file = "\X39_XLib_Core\XLib\Functions\doGarbageCollector.sqf";};
			
			//map operations
			class getMapSize:X39_XLib_Function_TypeA							{file = "\X39_XLib_Core\XLib\Functions\mapOperations\getMapSize.sqf";};
			class getAllHousesOnMap:X39_XLib_Function_TypeA						{file = "\X39_XLib_Core\XLib\Functions\mapOperations\getAllHousesOnMap.sqf";};
			class getAllHousesOnMapPerGrid:X39_XLib_Function_TypeA				{file = "\X39_XLib_Core\XLib\Functions\mapOperations\getAllHousesOnMapPerGrid.sqf";};
			
			class getUnitsBearing:X39_XLib_Function_TypeA						{file = "\X39_XLib_Core\XLib\Functions\getUnitsBearing.sqf";};
			class intToBool:X39_XLib_Function_TypeA								{file = "\X39_XLib_Core\XLib\Functions\intToBool.sqf";};
			class scalarToBool:X39_XLib_Function_TypeA							{file = "\X39_XLib_Core\XLib\Functions\intToBool.sqf";};
			
			class isUnitInShelter:X39_XLib_Function_TypeA						{file = "\X39_XLib_Core\XLib\Functions\isUnitInShelter.sqf";};
			class isUnitInOpenArea:X39_XLib_Function_TypeA						{file = "\X39_XLib_Core\XLib\Functions\isUnitInOpenArea.sqf";};
			class dikCodeToChar:X39_XLib_Function_TypeA							{file = "\X39_XLib_Core\XLib\Functions\dikCodeToChar.sqf";};
			class convertCodeToString:X39_XLib_Function_TypeA					{file = "\X39_XLib_Core\XLib\Functions\convertCodeToString.sqf";};
			
			class damageTypeFromProjectile:X39_XLib_Function_TypeA				{file = "\X39_XLib_Core\XLib\Functions\damageTypeFromProjectile.sqf";};
			class executeLocalToUnit:X39_XLib_Function_TypeA					{file = "\X39_XLib_Core\XLib\Functions\executeLocalToUnit.sqf";};
			class runNonScheduled:X39_XLib_Function_TypeA						{file = "\X39_XLib_Core\XLib\Functions\runNonScheduled.sqf";};
			class runNonScheduledVariable:X39_XLib_Function_TypeA				{file = "\X39_XLib_Core\XLib\Functions\runNonScheduledVariable.sqf";};
		};
		class X39_ActionTracker{
			class runActionTracker:X39_XLib_Function_TypeA						{file = "\X39_XLib_Core\XLib\Functions\actionTracker\Init.sqf";};
			class registerAction:X39_XLib_Function_TypeA						{file = "\X39_XLib_Core\XLib\Functions\actionTracker\registerAction.sqf";};
		};
	};
};
class CfgFactionClasses
{
	class X39_XLib
	{
		displayName = "XLib";
		priority = 1;
		side = 7;
	};
};

class CfgWeapons {
	class ItemCore;
	class x39_itemcore: ItemCore {
		type = 4;
		simulation = "ItemMineDetector";
		detectRange = -1;
	};
};