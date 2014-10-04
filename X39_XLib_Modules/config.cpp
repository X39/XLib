class CfgPatches{
	class X39_XLib_Modules{
         units[] = {"X39_XLib_GarbageCollector", "X39_XLib_Resupply", "X39_XLib_Resupply", "X39_XLib_AmmoCaches", "X39_XLib_ShowFactionNamesAndRank"};
         weapons[] = {};
         requiredVersion = 1.0;
         requiredAddons[] = {"X39_XLib_Core", "X39_XLib_ScriptObjectCreation"};
         author = "X39|Cpt. HM Murdock";
         mail = "killerx29@gmail.com";
	};
};

class X39_XLib_Function_TypeA;
class X39_XLib_Function_TypeB;
class X39_XLib_Function_TypeC;
class RscText;
class RscButton;

class CfgFunctions 
{
	class X39_XLib_Modules
	{
		class ModuleFunctions
		{
			class X39_XLib_GarbageCollector:X39_XLib_Function_TypeA					{file = "\X39_XLib_Modules\ModuleFunctions\X39_XLib_GarbageCollector.sqf";};
			class X39_XLib_PlaceSyncedUnits:X39_XLib_Function_TypeA					{file = "\X39_XLib_Modules\ModuleFunctions\X39_XLib_PlaceSyncedUnits.sqf";};
			class X39_XLib_Resupply:X39_XLib_Function_TypeA							{file = "\X39_XLib_Modules\ModuleFunctions\X39_XLib_Resupply.sqf";};
			class X39_XLib_AmmoCaches:X39_XLib_Function_TypeA						{file = "\X39_XLib_Modules\ModuleFunctions\X39_XLib_AmmoCaches.sqf";};
			class X39_XLib_ShowFactionNamesAndRank:X39_XLib_Function_TypeA			{file = "\X39_XLib_Modules\ModuleFunctions\X39_XLib_ShowFactionNamesAndRank.sqf";};
		};
		class ZeusModuleFunctions
		{
			class X39_XLib_Zeus_disableAi:X39_XLib_Function_TypeA					{file = "\X39_XLib_Modules\ModuleFunctions\X39_XLib_Zeus_disableAi.sqf";};
		};
		class X39_XLib_Resupply
		{
			class Helper_vehicleChat:X39_XLib_Function_TypeA						{file = "\X39_XLib_Modules\Functions\X39_XLib_Resupply\Helper_vehicleChat.sqf";};
			class Helper_execCode:X39_XLib_Function_TypeA							{file = "\X39_XLib_Modules\Functions\X39_XLib_Resupply\Helper_execCode.sqf";};
		};
		class X39_XLib_AmmoCaches
		{
			class X39_XLib_AmmoCaches_initIntelObject:X39_XLib_Function_TypeA		{file = "\X39_XLib_Modules\Functions\X39_XLib_AmmoCaches\initIntelObject.sqf";};
			class X39_XLib_AmmoCaches_boxDestroyed:X39_XLib_Function_TypeA			{file = "\X39_XLib_Modules\Functions\X39_XLib_AmmoCaches\boxDestroyed.sqf";};
		};
	};
};
class CfgVehicles
{
	class Logic;
	class Intel_File1_F;
	class X39_Intel: Intel_File1_F{
		class EventHandlers{
			init = "_this call X39_XLib_Modules_fnc_X39_XLib_AmmoCaches_initIntelObject;";
		};
	};
	
	class Module_F: Logic
	{
		class ArgumentsBaseUnits
		{
		};
		class ModuleDescription
		{
		};
	};
	#include "X39_XLib_GarbageCollector.cpp"
	//#include "X39_XLib_PlaceSyncedUnits.cpp"
	#include "X39_XLib_Resupply.cpp"
	#include "X39_XLib_AmmoCaches.cpp"
	#include "X39_XLib_ShowFactionNamesAndRank.cpp"
	//#include "X39_XLib_Zeus_disableAi.cpp"
	//#include "X39_XLib_IEDPlacement.cpp"
};

//#include "\X39_XLib_Modules\UIs\XLib_ReviveModule_Ui\ui.hpp"
