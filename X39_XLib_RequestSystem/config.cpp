#include "\X39_XLib_ModProperties\modPropertiesIncludes.hpp"

class CfgPatches {
	class X39_XLib_RequestSystem{
         units[] = {};
         weapons[] = {};
         requiredVersion = 1.0;
         requiredAddons[] = {"X39_XLib_Core", "X39_XLib_ModProperties"};
         author = "X39|Cpt. HM Murdock";
         mail = "killerx29@gmail.com";
	};
};

class X39_XLib_Function_TypeA;
class X39_XLib_Function_TypeB;
class X39_XLib_Function_TypeC;
class X39_XLib_Function_TypeD;


class CfgFunctions{
	class X39_XLib {
		class X39_XLib_RequestSystem{	
			class RequestSystem_init:X39_XLib_Function_TypeB						{file = "\X39_XLib_RequestSystem\Functions\init.sqf";};		
			class RequestSystem_postInit:X39_XLib_Function_TypeC					{file = "\X39_XLib_RequestSystem\Functions\postInit.sqf";};		
			class RequestSystem_createDialog:X39_XLib_Function_TypeA				{file = "\X39_XLib_RequestSystem\Functions\createDialog.sqf";};
			class createAcceptRequest:X39_XLib_Function_TypeA						{file = "\X39_XLib_RequestSystem\Functions\createAcceptRequest.sqf";};
			
			class RequestSystem_acceptRequest:X39_XLib_Function_TypeA				{file = "\X39_XLib_RequestSystem\Functions\acceptRequest.sqf";};
			class RequestSystem_denyRequest:X39_XLib_Function_TypeA					{file = "\X39_XLib_RequestSystem\Functions\denyRequest.sqf";};
		};
	};
};

class RscMultiColumnListBox;
class RscPicture;
class IGUIBack;
class RscText;
class RscStructuredText;
class RscButton;
class RscCombo;
class RscEdit;
class RscSlider;
class RscListbox;
class RscButtonMenu;
class RscButtonMenuOK;
class RscButtonMenuCancel;
class RscListNBox;

class RscTitles {
	#include "\X39_XLib_RequestSystem\UI\ui.hpp"
};


class XLib {
	class modProperties {
		class propertyBase;
		class valueBase;
		class modBase;
		class X39_XLib_Configuration: modBase {
			scope = 2;
			name = "XLib Configuration";
			image = "\X39_XLib_Core\XLib_logo.paa";
			class properties {
				class X39_XLib_RequestSystem_Accept: propertyBase {
					variable = "X39_XLib_var_RequestSystem_Accept";
					display = "Request System - Accept request key";
					type = TYPE_KEY;
					description = "";
					default[] = {211, 0, 0, 0};
				};
				class X39_XLib_RequestSystem_Deny: propertyBase {
					variable = "X39_XLib_var_RequestSystem_Deny";
					display = "Request System - Deny request key";
					type = TYPE_KEY;
					description = "";
					default[] = {210, 0, 0, 0};
				};
				class X39_XLib_var_RequestSystem_RequestTime: propertyBase {
					variable = "X39_XLib_var_RequestSystem_RequestTime";
					display = "Request System - AutoAccept time";
					type = TYPE_VALUE;
					description = "Time before requests are automatically accepted";
					value = 10;
				};
			};
		};
	};
};
