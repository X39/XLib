#include "\X39_XLib_ModProperties\modPropertiesIncludes.hpp"

class CfgPatches{
	class X39_XLib_ActionDialog{
         units[] = {};
         weapons[] = {};
         requiredVersion = 1.0;
         requiredAddons[] = {"X39_XLib_Core", "X39_XLib_ModProperties", "X39_XLib_KeyCatcher"};
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
		class X39_XLib_ActionDialog{
			class ActionDialog_init:X39_XLib_Function_TypeB {file = "\X39_XLib_ActionDialog\Functions\init.sqf";};
			class ActionDialog_createDialog:X39_XLib_Function_TypeA {file = "\X39_XLib_ActionDialog\Functions\createDialog.sqf";};
			class ActionDialog_closeDialog:X39_XLib_Function_TypeA {file = "\X39_XLib_ActionDialog\Functions\closeDialog.sqf";};
			class ActionDialog_registerAction:X39_XLib_Function_TypeA {file = "\X39_XLib_ActionDialog\Functions\registerAction.sqf";};
			class ActionDialog_initSystemVariables:X39_XLib_Function_TypeA {file = "\X39_XLib_ActionDialog\Functions\initSystemVariables.sqf";};
			class ActionDialog_initActions:X39_XLib_Function_TypeA {file = "\X39_XLib_ActionDialog\Functions\initActions.sqf";};
			class ActionDialog_initSubactionEntries:X39_XLib_Function_TypeA {file = "\X39_XLib_ActionDialog\Functions\initSubactionEntries.sqf";};
			class ActionDialog_subActionListUpDown:X39_XLib_Function_TypeA {file = "\X39_XLib_ActionDialog\Functions\subActionListUpDown.sqf";};
		};
	};
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
				class X39_XLib_ActionDialog_selfInteraction: propertyBase {
					variable = "X39_XLib_var_ActionDialog_selfInteraction";
					display = "Self interaction key";
					type = TYPE_KEY;
					description = "Key for self interaction";
					default[] = {211, 0, 0, 0};
				};
				class X39_XLib_ActionDialog_otherInteraction: propertyBase {
					variable = "X39_XLib_var_ActionDialog_otherInteraction";
					display = "Others interaction key";
					type = TYPE_KEY;
					description = "Key to interact with other people";
					default[] = {210, 0, 0, 0};
				};
			};
		};
	};
};

class RscButton;

#include "ActionDialogV1.hpp"
