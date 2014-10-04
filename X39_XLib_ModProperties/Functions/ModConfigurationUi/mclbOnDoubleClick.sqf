#include "\X39_XLib_ModProperties\default.hpp"
#include "\X39_XLib_ModProperties\UIs\ModConfigurationUi\ui.defs"
#include "\X39_XLib_ModProperties\modPropertiesIncludes.hpp"
#define diagCtrl(X) ((uiNamespace getVariable "X39_XLib_ui_modProperties") displayCtrl X)
#define __lnbRowSize(lnb) ((lnbSize lnb) select 1)
#define __lnbValue(lnb, row, col) ((lnb) lbValue ((row) * __lnbRowSize(lnb) + (col)))
/**
 *	Updates the viewPort of the modConfigurationUi
 *
 *	@ParamsCount 0
 *	@Return - NA
 *	@Author - X39|Cpt. HM Murdock
 */
private["_currentSelectedRow", "_type"];

_currentSelectedRow = lnbCurSelRow diagCtrl(IDC_XLIB_MODCONFIGURATION_MCLB_CONFIGURATION);
X39_XLib_var_ModProperties_PropertyConfig = X39_XLib_var_ModProperties_CurrentSelectedConfig select _currentSelectedRow;
_type = getNumber (X39_XLib_var_ModProperties_PropertyConfig >> "type");
X39_XLib_var_ModProperties_variableName = getText (X39_XLib_var_ModProperties_PropertyConfig >> "variable");
if(_type == TYPE_KEY) then
{
	//createDialog "X39_XLib_ui_keySelection";
	[] call X39_XLib_fnc_keySelectionUi_createDialog;
}
else
{
	if(_type == TYPE_VALUE) then
	{
		//createDialog "X39_XLib_ui_valueEditing";
		[] call X39_XLib_fnc_valueEditingUi_createDialog;
	}
	else
	{
		if(_type == TYPE_COMBOBOX) then
		{
			//createDialog "X39_XLib_ui_valueSelection";
			[] call X39_XLib_fnc_valueSelectionUi_createDialog;
		};
	};
};