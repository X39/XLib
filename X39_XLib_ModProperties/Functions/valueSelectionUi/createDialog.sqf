#include "\X39_XLib_ModProperties\UIs\ModConfigurationUi\ui.defs"
#include "\X39_XLib_ModProperties\UIs\valueSelectionUi\ui.defs"

#define parentDiag (uiNamespace getVariable "X39_XLib_ui_modProperties")
#define parentDiagCtrl(X) ((uiNamespace getVariable "X39_XLib_ui_modProperties") displayCtrl X)
#define diagCtrl(X) ((uiNamespace getVariable "X39_XLib_ui_valueSelection") displayCtrl X)
/**
 *	Creates the valueSelection dialog
 *
 *	@ParamsCount 0
 *	@Return - NA
 *	@Author - X39|Cpt. HM Murdock
 */
private["_value"];
parentDiag createDisplay "X39_XLib_ui_valueSelection";
_value = [X39_XLib_var_ModProperties_variableName] call X39_XLib_var_ModProperties_getFunction;
_currentIndex = -1;
for "_i" from 0 to ((count (X39_XLib_var_ModProperties_PropertyConfig >> "values")) - 1) do 
{
	_currentClass = (X39_XLib_var_ModProperties_PropertyConfig >> "values") select _i;
	diagCtrl(IDC_XLIB_VALUESELECTION_CB_VALUESELECTION) lbAdd getText (_currentClass >> "display");
	if(_value == ((_currentClass >> 'value') call BIS_fnc_getCfgData)) then
	{
		_currentIndex = _i;
	};
};
diagCtrl(IDC_XLIB_VALUESELECTION_CB_VALUESELECTION) lbSetCurSel _currentIndex;

if(isNil "_value") then
{
	_value = ((X39_XLib_var_ModProperties_PropertyConfig >> 'default') call BIS_fnc_getCfgData);
	if(typeName _value != 'STRING' && typeName _value != 'TEXT') then { _value = str _value; };
};
diagCtrl(IDC_XLIB_VALUESELECTION_LABEL_PROPERTYNAMEDISPLAY) ctrlSetText getText (X39_XLib_var_ModProperties_PropertyConfig >> "display");
diagCtrl(IDC_XLIB_VALUESELECTION_RSCBUTTONMENUOK_2600) buttonSetAction format["[] call %1", {
		_val = (((X39_XLib_var_ModProperties_PropertyConfig >> "values") select lbCurSel diagCtrl(IDC_XLIB_VALUESELECTION_CB_VALUESELECTION)) >> "value") call BIS_fnc_getCfgData;
		[X39_XLib_var_ModProperties_variableName, _val] call X39_XLib_var_ModProperties_setFunction;
		(uiNamespace getVariable 'X39_XLib_ui_valueSelection') closeDisplay 1;
	}];
diagCtrl(IDC_XLIB_VALUESELECTION_RSCBUTTONMENUCANCEL_2700) buttonSetAction "(uiNamespace getVariable 'X39_XLib_ui_valueSelection') closeDisplay 2;";
diagCtrl(IDC_XLIB_VALUESELECTION_BTN_DEFAULT) buttonSetAction format["[] call %1", {
		_val = ((X39_XLib_var_ModProperties_PropertyConfig >> 'default') call BIS_fnc_getCfgData);
		if(typeName _val == "ARRAY") then
		{
			if(count _val > 0) then
			{
				_val = _val select 0;
			}
			else
			{
				_val = -1;
			};
		};
		diagCtrl(IDC_XLIB_VALUESELECTION_CB_VALUESELECTION) lbSetCurSel _val;
	}];
