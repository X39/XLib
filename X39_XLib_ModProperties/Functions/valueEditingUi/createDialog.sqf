#include "\X39_XLib_ModProperties\default.hpp"
#include "\X39_XLib_ModProperties\UIs\ModConfigurationUi\ui.defs"
#include "\X39_XLib_ModProperties\UIs\valueEditingUi\ui.defs"

#define parentDiag (uiNamespace getVariable "X39_XLib_ui_modProperties")
#define parentDiagCtrl(X) ((uiNamespace getVariable "X39_XLib_ui_modProperties") displayCtrl X)
#define diagCtrl(X) ((uiNamespace getVariable "X39_XLib_ui_valueEditing") displayCtrl X)
/**
 *	Creates the valueEditing dialog
 *
 *	@ParamsCount 0
 *	@Return - NA
 *	@Author - X39|Cpt. HM Murdock
 */
private["_value"];
parentDiag createDisplay "X39_XLib_ui_valueEditing";
_value = [X39_XLib_var_ModProperties_variableName] call X39_XLib_var_ModProperties_getFunction;
if(isNil "_value") then
{
	_value = ((X39_XLib_var_ModProperties_PropertyConfig >> 'default') call BIS_fnc_getCfgData);
	if(typeName _value != 'STRING' && typeName _value != 'TEXT') then { _value = str _value; };
};
diagCtrl(IDC_XLIB_VALUEEDITING_TB_VALUE) ctrlSetText format["%1", _value];
diagCtrl(IDC_XLIB_VALUEEDITING_LABEL_PROPERTYNAMEDISPLAY) ctrlSetText getText (X39_XLib_var_ModProperties_PropertyConfig >> "display");
diagCtrl(IDC_XLIB_VALUEEDITING_RSCBUTTONMENUOK_2600) ctrlSetEventHandler ["ButtonClick", format["_val = ctrlText ((uiNamespace getVariable 'X39_XLib_ui_valueEditing') displayCtrl %1); if(getText (X39_XLib_var_ModProperties_PropertyConfig >> 'valueType') != 'STRING' && getText (X39_XLib_var_ModProperties_PropertyConfig >> 'valueType') != 'TEXT') then {_val = [] call (compile _val);}; if([_val] call compile getText(X39_XLib_var_ModProperties_PropertyConfig >>'validationCode')) then {[X39_XLib_var_ModProperties_variableName, _val] call X39_XLib_var_ModProperties_setFunction;}; (uiNamespace getVariable 'X39_XLib_ui_valueEditing') closeDisplay 1;", IDC_XLIB_VALUEEDITING_TB_VALUE]];
diagCtrl(IDC_XLIB_VALUEEDITING_RSCBUTTONMENUCANCEL_2700) ctrlSetEventHandler ["ButtonClick", "(uiNamespace getVariable 'X39_XLib_ui_valueEditing') closeDisplay 2;"];
diagCtrl(IDC_XLIB_VALUEEDITING_BTN_DEFAULT) ctrlSetEventHandler ["ButtonClick", format["_val = ((X39_XLib_var_ModProperties_PropertyConfig >> 'default') call BIS_fnc_getCfgData); if(typeName _val != 'STRING' && typeName _val != 'TEXT') then { _val = str _val; }; ((uiNamespace getVariable 'X39_XLib_ui_valueEditing') displayCtrl %1) ctrlSetText _val;", IDC_XLIB_VALUEEDITING_TB_VALUE]];
