#include "\X39_XLib_ModProperties\UIs\ModConfigurationUi\ui.defs"
#define diagCtrl(X) ((uiNamespace getVariable "X39_XLib_ui_modProperties") displayCtrl X)
/**
 *	Closes ALL active dialogs and creates a new one
 *
 *	@ParamsCount 0
 *	@Return - NA
 *	@Author - X39|Cpt. HM Murdock
 */
private["_index", "_configClass", "_currentClass", "_i", "_currentSelectedRow", "_currentSelectedRowLast"];
while{dialog} do {closeDialog 0;};
createDialog "X39_XLib_ui_modProperties";

_configClass = (configFile >> "XLib" >> "modProperties");
_currentSelectedRow = -1;
_currentSelectedRowLast = -1;

for "_i" from 0 to ((count _configClass) - 1) do
{
	_currentClass = _configClass select _i;
	if(getNumber (_currentClass >> "scope") > 0) then
	{
		_index = diagCtrl(IDC_XLIB_MODCONFIGURATION_LB_SELECTION) lbAdd (getText (_currentClass >> "name"));
		diagCtrl(IDC_XLIB_MODCONFIGURATION_LB_SELECTION) lbSetPicture [_index, (getText (_currentClass >> "image"))];
		diagCtrl(IDC_XLIB_MODCONFIGURATION_LB_SELECTION) lbSetValue [_index, _i];
	};
};
diagCtrl(IDC_XLIB_MODCONFIGURATION_LB_SELECTION) ctrlSetEventHandler ["LBSelChanged", "[] call X39_XLib_fnc_ModProperties_updatePropertiesViewPort"];
(uiNamespace getVariable "X39_XLib_ui_modProperties") displaySetEventHandler ["ChildDestroyed", "[] call X39_XLib_fnc_ModProperties_updatePropertiesViewPort"];
diagCtrl(IDC_XLIB_MODCONFIGURATION_LB_SELECTION) lbSetCurSel 0;
while{dialog} do
{
	_currentSelectedRow = lnbCurSelRow diagCtrl(IDC_XLIB_MODCONFIGURATION_MCLB_CONFIGURATION);
	if(!isNil "_currentSelectedRow") then
	{
		if(_currentSelectedRowLast != _currentSelectedRow) then
		{
			[] call X39_XLib_fnc_ModProperties_updateInfoViewPort;
		};
		_currentSelectedRowLast = _currentSelectedRow;
	};
};