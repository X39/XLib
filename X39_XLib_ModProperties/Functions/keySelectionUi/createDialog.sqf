#include "\X39_XLib_ModProperties\UIs\ModConfigurationUi\ui.defs"
#include "\X39_XLib_ModProperties\UIs\keySelectionUi\ui.defs"

#define parentDiag (uiNamespace getVariable "X39_XLib_ui_modProperties")
#define parentDiagCtrl(X) (parentDiag displayCtrl X)
#define diagCtrl(X) ((uiNamespace getVariable "X39_XLib_ui_keySelection") displayCtrl X)
#define COLOR_SET	[1,   1,   1,   1];
#define COLOR_EMPTY	[0.5, 0.5, 0.5, 1];
/**
 *	Creates the keySelection dialog
 *
 *	@ParamsCount 0
 *	@Return - NA
 *	@Author - X39|Cpt. HM Murdock
 */
parentDiag createDisplay "X39_XLib_ui_keySelection";
X39_XLib_var_ModProperties_keySelectionUi_valueHolder = [X39_XLib_var_ModProperties_variableName] call X39_XLib_var_ModProperties_getFunction;
if(isNil "X39_XLib_var_ModProperties_keySelectionUi_valueHolder") then
{
	X39_XLib_var_ModProperties_keySelectionUi_valueHolder = ((X39_XLib_var_ModProperties_PropertyConfig >> 'default') call BIS_fnc_getCfgData);
	if(typeName X39_XLib_var_ModProperties_keySelectionUi_valueHolder == "ARRAY" && {count X39_XLib_var_ModProperties_keySelectionUi_valueHolder >= 4}) then
	{
		X39_XLib_var_ModProperties_keySelectionUi_valueHolder = [X39_XLib_var_ModProperties_keySelectionUi_valueHolder select 0, (X39_XLib_var_ModProperties_keySelectionUi_valueHolder select 1) call X39_XLib_fnc_IntToBool, (X39_XLib_var_ModProperties_keySelectionUi_valueHolder select 2) call X39_XLib_fnc_IntToBool, (X39_XLib_var_ModProperties_keySelectionUi_valueHolder select 3) call X39_XLib_fnc_IntToBool];
	}
	else
	{
		X39_XLib_var_ModProperties_keySelectionUi_valueHolder = [-1, false, false, false];
	};
};

diagCtrl(IDC_XLIB_KEYSELECTION_LABEL_CURRENTBUTTONDISPLAY) ctrlSetText ((X39_XLib_var_ModProperties_keySelectionUi_valueHolder select 0) call X39_XLib_fnc_dikCodeToChar);
diagCtrl(IDC_XLIB_KEYSELECTION_LABEL_CURRENTBUTTONNUMERICDISPLAY) ctrlSetText str (X39_XLib_var_ModProperties_keySelectionUi_valueHolder select 0);
diagCtrl(IDC_XLIB_KEYSELECTION_BTN_SETSHIFT)	ctrlSetTextColor (if(X39_XLib_var_ModProperties_keySelectionUi_valueHolder select 1) then {COLOR_SET} else {COLOR_EMPTY});
diagCtrl(IDC_XLIB_KEYSELECTION_BTN_SETCTRL)		ctrlSetTextColor (if(X39_XLib_var_ModProperties_keySelectionUi_valueHolder select 2) then {COLOR_SET} else {COLOR_EMPTY});
diagCtrl(IDC_XLIB_KEYSELECTION_BTN_SETALT)		ctrlSetTextColor (if(X39_XLib_var_ModProperties_keySelectionUi_valueHolder select 3) then {COLOR_SET} else {COLOR_EMPTY});

diagCtrl(IDC_XLIB_KEYSELECTION_BTN_SETSHIFT)	buttonSetAction	'X39_XLib_var_ModProperties_keySelectionUi_valueHolder set [1, !(X39_XLib_var_ModProperties_keySelectionUi_valueHolder select 1)];  ((uiNamespace getVariable "X39_XLib_ui_keySelection") displayCtrl     15745)  ctrlSetTextColor (if(X39_XLib_var_ModProperties_keySelectionUi_valueHolder select 1) then { [1,   1,   1,   1];} else { [0.4, 0.4, 0.4, 1];});';
diagCtrl(IDC_XLIB_KEYSELECTION_BTN_SETCTRL)		buttonSetAction	'X39_XLib_var_ModProperties_keySelectionUi_valueHolder set [2, !(X39_XLib_var_ModProperties_keySelectionUi_valueHolder select 2)];  ((uiNamespace getVariable "X39_XLib_ui_keySelection") displayCtrl     15744)  ctrlSetTextColor (if(X39_XLib_var_ModProperties_keySelectionUi_valueHolder select 2) then { [1,   1,   1,   1];} else { [0.4, 0.4, 0.4, 1];});';
diagCtrl(IDC_XLIB_KEYSELECTION_BTN_SETALT)		buttonSetAction	'X39_XLib_var_ModProperties_keySelectionUi_valueHolder set [3, !(X39_XLib_var_ModProperties_keySelectionUi_valueHolder select 3)];  ((uiNamespace getVariable "X39_XLib_ui_keySelection") displayCtrl     15743)  ctrlSetTextColor (if(X39_XLib_var_ModProperties_keySelectionUi_valueHolder select 3) then { [1,   1,   1,   1];} else { [0.4, 0.4, 0.4, 1];});';

diagCtrl(IDC_XLIB_KEYSELECTION_LABEL_PROPERTYNAMEDISPLAY) ctrlSetText getText (X39_XLib_var_ModProperties_PropertyConfig >> "display");
diagCtrl(16743) buttonSetAction '[X39_XLib_var_ModProperties_variableName, X39_XLib_var_ModProperties_keySelectionUi_valueHolder] call X39_XLib_var_ModProperties_setFunction;    (uiNamespace getVariable "X39_XLib_ui_keySelection") closeDisplay 1;';
diagCtrl(16843) buttonSetAction "(uiNamespace getVariable 'X39_XLib_ui_keySelection') closeDisplay 2;";
diagCtrl(16543) buttonSetAction 'X39_XLib_var_ModProperties_keySelectionUi_valueHolder = ((X39_XLib_var_ModProperties_PropertyConfig >> "default") call BIS_fnc_getCfgData);  if(typeName X39_XLib_var_ModProperties_keySelectionUi_valueHolder == "ARRAY" && {count X39_XLib_var_ModProperties_keySelectionUi_valueHolder >= 4}) then  {  X39_XLib_var_ModProperties_keySelectionUi_valueHolder = [X39_XLib_var_ModProperties_keySelectionUi_valueHolder select 0, (X39_XLib_var_ModProperties_keySelectionUi_valueHolder select 1) call X39_XLib_fnc_IntToBool, (X39_XLib_var_ModProperties_keySelectionUi_valueHolder select 2) call X39_XLib_fnc_IntToBool, (X39_XLib_var_ModProperties_keySelectionUi_valueHolder select 3) call X39_XLib_fnc_IntToBool];  }  else  {  X39_XLib_var_ModProperties_keySelectionUi_valueHolder = [-1, false, false, false];  };    ((uiNamespace getVariable "X39_XLib_ui_keySelection") displayCtrl   15148) ctrlSetText ((X39_XLib_var_ModProperties_keySelectionUi_valueHolder select 0) call X39_XLib_fnc_dikCodeToChar);  ((uiNamespace getVariable "X39_XLib_ui_keySelection") displayCtrl  15150) ctrlSetText str (X39_XLib_var_ModProperties_keySelectionUi_valueHolder select 0); ((uiNamespace getVariable "X39_XLib_ui_keySelection") displayCtrl     15745)  ctrlSetTextColor (if(X39_XLib_var_ModProperties_keySelectionUi_valueHolder select 1) then { [1,   1,   1,   1];} else { [0.4, 0.4, 0.4, 1];});((uiNamespace getVariable "X39_XLib_ui_keySelection") displayCtrl     15744)  ctrlSetTextColor (if(X39_XLib_var_ModProperties_keySelectionUi_valueHolder select 2) then { [1,   1,   1,   1];} else { [0.4, 0.4, 0.4, 1];});((uiNamespace getVariable "X39_XLib_ui_keySelection") displayCtrl     15743)  ctrlSetTextColor (if(X39_XLib_var_ModProperties_keySelectionUi_valueHolder select 3) then { [1,   1,   1,   1];} else { [0.4, 0.4, 0.4, 1];});';
(uiNamespace getVariable "X39_XLib_ui_keySelection") displaySetEventHandler ["KeyDown", 'if((_this select 1) == 1) exitWith {}; X39_XLib_var_ModProperties_keySelectionUi_valueHolder set [0, _this select 1];    ((uiNamespace getVariable "X39_XLib_ui_keySelection") displayCtrl   15148) ctrlSetText ((X39_XLib_var_ModProperties_keySelectionUi_valueHolder select 0) call X39_XLib_fnc_dikCodeToChar);  ((uiNamespace getVariable "X39_XLib_ui_keySelection") displayCtrl  15150) ctrlSetText str (X39_XLib_var_ModProperties_keySelectionUi_valueHolder select 0);'];


/*
//OLD
#include "\X39_XLib_ModProperties\UIs\ModConfigurationUi\ui.defs"
#include "\X39_XLib_ModProperties\UIs\keySelectionUi\ui.defs"

#define parentDiag (uiNamespace getVariable "X39_XLib_ui_modProperties")
#define parentDiagCtrl(X) (parentDiag displayCtrl X)
#define diagCtrl(X) ((uiNamespace getVariable "X39_XLib_ui_keySelection") displayCtrl X)
#define COLOR_SET	[1,   1,   1,   1];
#define COLOR_EMPTY	[0.5, 0.5, 0.5, 1];
/**
 *	Creates the keySelection dialog
 *
 *	@ParamsCount 0
 *	@Return - NA
 *	@Author - X39|Cpt. HM Murdock
 * /
parentDiag createDisplay "X39_XLib_ui_keySelection";
X39_XLib_var_ModProperties_keySelectionUi_valueHolder = [X39_XLib_var_ModProperties_variableName] call X39_XLib_var_ModProperties_getFunction;
if(isNil "X39_XLib_var_ModProperties_keySelectionUi_valueHolder") then
{
	X39_XLib_var_ModProperties_keySelectionUi_valueHolder = ((X39_XLib_var_ModProperties_PropertyConfig >> 'default') call BIS_fnc_getCfgData);
	if(typeName X39_XLib_var_ModProperties_keySelectionUi_valueHolder == "ARRAY" && {count X39_XLib_var_ModProperties_keySelectionUi_valueHolder >= 4}) then
	{
		X39_XLib_var_ModProperties_keySelectionUi_valueHolder = [X39_XLib_var_ModProperties_keySelectionUi_valueHolder select 0, (X39_XLib_var_ModProperties_keySelectionUi_valueHolder select 1) call X39_XLib_fnc_IntToBool, (X39_XLib_var_ModProperties_keySelectionUi_valueHolder select 2) call X39_XLib_fnc_IntToBool, (X39_XLib_var_ModProperties_keySelectionUi_valueHolder select 3) call X39_XLib_fnc_IntToBool];
	}
	else
	{
		X39_XLib_var_ModProperties_keySelectionUi_valueHolder = [-1, false, false, false];
	};
};

diagCtrl(IDC_XLIB_KEYSELECTION_LABEL_CURRENTBUTTONDISPLAY) ctrlSetText ((X39_XLib_var_ModProperties_keySelectionUi_valueHolder select 0) call X39_XLib_fnc_dikCodeToChar);
diagCtrl(IDC_XLIB_KEYSELECTION_LABEL_CURRENTBUTTONNUMERICDISPLAY) ctrlSetText str (X39_XLib_var_ModProperties_keySelectionUi_valueHolder select 0);
diagCtrl(IDC_XLIB_KEYSELECTION_BTN_SETSHIFT)	ctrlSetTextColor (if(X39_XLib_var_ModProperties_keySelectionUi_valueHolder select 1) then {COLOR_SET} else {COLOR_EMPTY});
diagCtrl(IDC_XLIB_KEYSELECTION_BTN_SETCTRL)		ctrlSetTextColor (if(X39_XLib_var_ModProperties_keySelectionUi_valueHolder select 2) then {COLOR_SET} else {COLOR_EMPTY});
diagCtrl(IDC_XLIB_KEYSELECTION_BTN_SETALT)		ctrlSetTextColor (if(X39_XLib_var_ModProperties_keySelectionUi_valueHolder select 3) then {COLOR_SET} else {COLOR_EMPTY});

diagCtrl(IDC_XLIB_KEYSELECTION_BTN_SETSHIFT)	buttonSetAction	'X39_XLib_var_ModProperties_keySelectionUi_valueHolder set [1, !(X39_XLib_var_ModProperties_keySelectionUi_valueHolder select 1)];  ((uiNamespace getVariable "X39_XLib_ui_keySelection") displayCtrl     15745)  ctrlSetTextColor (if(X39_XLib_var_ModProperties_keySelectionUi_valueHolder select 1) then { [1,   1,   1,   1];} else { [0.4, 0.4, 0.4, 1];});';
diagCtrl(IDC_XLIB_KEYSELECTION_BTN_SETCTRL)		buttonSetAction	'X39_XLib_var_ModProperties_keySelectionUi_valueHolder set [2, !(X39_XLib_var_ModProperties_keySelectionUi_valueHolder select 2)];  ((uiNamespace getVariable "X39_XLib_ui_keySelection") displayCtrl     15744)  ctrlSetTextColor (if(X39_XLib_var_ModProperties_keySelectionUi_valueHolder select 2) then { [1,   1,   1,   1];} else { [0.4, 0.4, 0.4, 1];});';
diagCtrl(IDC_XLIB_KEYSELECTION_BTN_SETALT)		buttonSetAction	'X39_XLib_var_ModProperties_keySelectionUi_valueHolder set [3, !(X39_XLib_var_ModProperties_keySelectionUi_valueHolder select 3)];  ((uiNamespace getVariable "X39_XLib_ui_keySelection") displayCtrl     15743)  ctrlSetTextColor (if(X39_XLib_var_ModProperties_keySelectionUi_valueHolder select 3) then { [1,   1,   1,   1];} else { [0.4, 0.4, 0.4, 1];});';

diagCtrl(IDC_XLIB_KEYSELECTION_LABEL_PROPERTYNAMEDISPLAY) ctrlSetText getText (X39_XLib_var_ModProperties_PropertyConfig >> "display");
diagCtrl(IDC_XLIB_KEYSELECTION_RSCBUTTONMENUOK_2600) buttonSetAction format["_this call %1;", str {
		[X39_XLib_var_ModProperties_variableName, X39_XLib_var_ModProperties_keySelectionUi_valueHolder] call X39_XLib_var_ModProperties_setFunction;
		(uiNamespace getVariable 'X39_XLib_ui_keySelection') closeDisplay 1;
	}];
diagCtrl(IDC_XLIB_KEYSELECTION_RSCBUTTONMENUCANCEL_2700) buttonSetAction "(uiNamespace getVariable 'X39_XLib_ui_keySelection') closeDisplay 2;";
diagCtrl(IDC_XLIB_KEYSELECTION_BTN_DEFAULT) buttonSetAction format["_this call %1;", str {
		X39_XLib_var_ModProperties_keySelectionUi_valueHolder = ((X39_XLib_var_ModProperties_PropertyConfig >> 'default') call BIS_fnc_getCfgData);
		if(typeName X39_XLib_var_ModProperties_keySelectionUi_valueHolder == "ARRAY" && {count X39_XLib_var_ModProperties_keySelectionUi_valueHolder >= 4}) then
		{
			X39_XLib_var_ModProperties_keySelectionUi_valueHolder = [X39_XLib_var_ModProperties_keySelectionUi_valueHolder select 0, (X39_XLib_var_ModProperties_keySelectionUi_valueHolder select 1) call X39_XLib_fnc_IntToBool, (X39_XLib_var_ModProperties_keySelectionUi_valueHolder select 2) call X39_XLib_fnc_IntToBool, (X39_XLib_var_ModProperties_keySelectionUi_valueHolder select 3) call X39_XLib_fnc_IntToBool];
		}
		else
		{
			X39_XLib_var_ModProperties_keySelectionUi_valueHolder = [-1, false, false, false];
		};
		
		diagCtrl(IDC_XLIB_KEYSELECTION_LABEL_CURRENTBUTTONDISPLAY) ctrlSetText ((X39_XLib_var_ModProperties_keySelectionUi_valueHolder select 0) call X39_XLib_fnc_dikCodeToChar);
		diagCtrl(IDC_XLIB_KEYSELECTION_LABEL_CURRENTBUTTONNUMERICDISPLAY) ctrlSetText str (X39_XLib_var_ModProperties_keySelectionUi_valueHolder select 0);
	}];

(uiNamespace getVariable "X39_XLib_ui_keySelection") displaySetEventHandler ["KeyDown", format["_this call %1; false", str {
		X39_XLib_var_ModProperties_keySelectionUi_valueHolder set [0, _this select 1];
		
		diagCtrl(IDC_XLIB_KEYSELECTION_LABEL_CURRENTBUTTONDISPLAY) ctrlSetText ((X39_XLib_var_ModProperties_keySelectionUi_valueHolder select 0) call X39_XLib_fnc_dikCodeToChar);
		diagCtrl(IDC_XLIB_KEYSELECTION_LABEL_CURRENTBUTTONNUMERICDISPLAY) ctrlSetText str (X39_XLib_var_ModProperties_keySelectionUi_valueHolder select 0);
	}]];
*/