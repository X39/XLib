class CfgPatches{
	class X39_GM_Insurgency{
         units[] = {"X39_GM_Insurgency_Module_BasicModule", "Land_X39_GM_Insurgency_Module"};
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
class CfgFunctions 
{
	class X39_GM_Insurgency
	{
		class ModuleFunctions
		{
			class module_X39_GM_Insurgency:X39_XLib_Function_TypeA			{file = "\X39_GM_Insurgency\ModuleFunctions\X39_GM_Insurgency_Module.sqf";};
			class module_X39_GM_Insurgency_Avoid:X39_XLib_Function_TypeA	{file = "\X39_GM_Insurgency\ModuleFunctions\X39_GM_Insurgency_Avoid_Module.sqf";};
		};
		class Functions_server
		{
			class createInsurgencyObject:X39_XLib_Function_TypeA			{file = "\X39_GM_Insurgency\Functions\Server\createInsurgencyObject.sqf";};
			class deleteInsurgencyObject:X39_XLib_Function_TypeA			{file = "\X39_GM_Insurgency\Functions\Server\deleteInsurgencyObject.sqf";};
			class setOwnerToCalculator:X39_XLib_Function_TypeA				{file = "\X39_GM_Insurgency\Functions\Server\setOwnerToCalculator.sqf";};
			class watchDog:X39_XLib_Function_TypeA							{file = "\X39_GM_Insurgency\Functions\Server\watchDog.sqf";};
		};
		class Functions_client
		{
			class startInsurgencyWorker:X39_XLib_Function_TypeA				{file = "\X39_GM_Insurgency\Functions\Client\startInsurgencyWorker.sqf";};
			class createUnit:X39_XLib_Function_TypeA						{file = "\X39_GM_Insurgency\Functions\Client\createUnit.sqf";};
		};
		class Functions_both
		{
			class updateInsurgencyObject:X39_XLib_Function_TypeA			{file = "\X39_GM_Insurgency\Functions\Both\updateInsurgencyObject.sqf";};
			class removeUnit:X39_XLib_Function_TypeA						{file = "\X39_GM_Insurgency\Functions\Both\removeUnit.sqf";};
		};
	};
};
class CfgVehicles
{
	class Logic;
	class Land_HelipadEmpty_F;
	
	class Module_F: Logic
	{
		class ArgumentsBaseUnits
		{
		};
		class ModuleDescription
		{
		};
	};
#include "module.cpp"
#include "InsurgencyGridObject.cpp"
};