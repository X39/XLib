#include "\X39_XLib_ModProperties\UIs\ModConfigurationUi\ui.defs"
#define diagCtrl(X) ((uiNamespace getVariable "X39_XLib_ui_modProperties") displayCtrl X)
/**
 *	Updates the viewPort of the modConfigurationUi
 *
 *	@ParamsCount 0
 *	@Return - NA
 *	@Author - X39|Cpt. HM Murdock
 */
private["_index", "_configClass", "_currentClass", "_i", "_fncKeyArrayToString", "_txt"];
lnbClear diagCtrl(IDC_XLIB_MODCONFIGURATION_MCLB_CONFIGURATION);

X39_XLib_var_ModProperties_CurrentSelectedConfig = (((configFile >> "XLib" >> "modProperties") select (diagCtrl(IDC_XLIB_MODCONFIGURATION_LB_SELECTION) lbValue (lbCurSel diagCtrl(IDC_XLIB_MODCONFIGURATION_LB_SELECTION)))) >> "properties");
X39_XLib_var_ModProperties_setFunction = compile getText (((configFile >> "XLib" >> "modProperties") select (diagCtrl(IDC_XLIB_MODCONFIGURATION_LB_SELECTION) lbValue (lbCurSel diagCtrl(IDC_XLIB_MODCONFIGURATION_LB_SELECTION)))) >> "setFunction");
X39_XLib_var_ModProperties_getFunction = compile getText (((configFile >> "XLib" >> "modProperties") select (diagCtrl(IDC_XLIB_MODCONFIGURATION_LB_SELECTION) lbValue (lbCurSel diagCtrl(IDC_XLIB_MODCONFIGURATION_LB_SELECTION)))) >> "getFunction");
for "_i" from 0 to ((count X39_XLib_var_ModProperties_CurrentSelectedConfig) - 1) do
{
	_currentClass = X39_XLib_var_ModProperties_CurrentSelectedConfig select _i;
	_value = [getText (_currentClass >> "variable")] call X39_XLib_var_ModProperties_getFunction;
	_type = getNumber (_currentClass >> "type");
	if(isNil "_value") then
	{
		if(_type != 3) then
		{
			_value = format["%1", (_currentClass >> "default") call BIS_fnc_getCfgData];
		}
		else
		{
			_default = format["%1", (_currentClass >> "default") call BIS_fnc_getCfgData];
			if(typeName _default == "ARRAY") then
			{
				if(count _default > 0) then
				{
					_value = format["%1", (((_currentClass >> "values") select (_default select 0)) >> "value") call BIS_fnc_getCfgData];
				};
			}
			else
			{
				_value = format["%1", (((_currentClass >> "values") select _default) >> "value") call BIS_fnc_getCfgData];
			};
		};
	};
	if(_type == 1) then
	{
		if(typeName _value != "ARRAY" || {count _value != 4}) then { _value = [-1, false, false, false]; };
		_txt = (_value select 0) call X39_XLib_fnc_dikCodeToChar;
		if(_value select 1) then { _txt = format["SHIFT + %1", _txt]; };
		if(_value select 2) then { _txt = format["CTRL + %1", _txt]; };
		if(_value select 3) then { _txt = format["ALT + %1", _txt]; };
		_value = _txt;
	};
	_index = diagCtrl(IDC_XLIB_MODCONFIGURATION_MCLB_CONFIGURATION) lnbAddRow ["", getText (_currentClass >> "display"), format["%1", _value]];
	diagCtrl(IDC_XLIB_MODCONFIGURATION_MCLB_CONFIGURATION) lnbSetPicture [[_index, 0], getText (_currentClass >> "image")];
};