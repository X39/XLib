class CfgPatches{
	class X39_XLib_EventSystem{
         units[] = {};
         weapons[] = {};
         requiredVersion = 1.0;
         requiredAddons[] = {"X39_XLib_Core"};
         author = "X39|Cpt. HM Murdock";
         mail = "killerx29@gmail.com";
	};
};

class X39_XLib_Function_TypeA;
class X39_XLib_Function_TypeB;
class X39_XLib_Function_TypeC;

class CfgFunctions 
{
	class X39_XLib_EH
	{
		class EventSystemInternalFunctions
		{
			class initMod:X39_XLib_Function_TypeB					{file = "\X39_XLib_EventSystem\EventSystem\Functions\initMod.sqf";};
		};
		class EventBase
		{
			class getAvailableEvents:X39_XLib_Function_TypeA		{file = "\X39_XLib_EventSystem\EventSystem\Functions\EventBase\getAvailableEvents.sqf";};
			class getAvailableNamespaces:X39_XLib_Function_TypeA	{file = "\X39_XLib_EventSystem\EventSystem\Functions\EventBase\getAvailableNamespaces.sqf";};
			
			class registerEvent:X39_XLib_Function_TypeA				{file = "\X39_XLib_EventSystem\EventSystem\Functions\EventBase\registerEvent.sqf";};
			class registerNamespace:X39_XLib_Function_TypeA			{file = "\X39_XLib_EventSystem\EventSystem\Functions\EventBase\registerNamespace.sqf";};
			
			class syncEventBase:X39_XLib_Function_TypeA				{file = "\X39_XLib_EventSystem\EventSystem\Functions\EventBase\syncEventBase.sqf";};
			
			class triggerEvent:X39_XLib_Function_TypeA				{file = "\X39_XLib_EventSystem\EventSystem\Functions\EventBase\triggerEvent.sqf";};
		};
		class EventHandling
		{
			class addEventHandler:X39_XLib_Function_TypeA			{file = "\X39_XLib_EventSystem\EventSystem\Functions\EventHandling\addEventHandler.sqf";};
			class removeEventHandler:X39_XLib_Function_TypeA		{file = "\X39_XLib_EventSystem\EventSystem\Functions\EventHandling\removeEventHandler.sqf";};
			class getEventHandlers:X39_XLib_Function_TypeA			{file = "\X39_XLib_EventSystem\EventSystem\Functions\EventHandling\getEventHandlers.sqf";};
			
			class isEventExisting:X39_XLib_Function_TypeA			{file = "\X39_XLib_EventSystem\EventSystem\Functions\EventHandling\isEventExisting.sqf";};
		};
	};
};