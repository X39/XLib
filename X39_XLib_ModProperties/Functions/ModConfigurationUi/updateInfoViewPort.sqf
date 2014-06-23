#include "\X39_XLib_ModProperties\UIs\ModConfigurationUi\ui.defs"
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
private["_currentSelectedRow", "_configClass"];

_currentSelectedRow = lnbCurSelRow diagCtrl(IDC_XLIB_MODCONFIGURATION_MCLB_CONFIGURATION);
_configClass = X39_XLib_var_ModProperties_CurrentSelectedConfig select _currentSelectedRow;
diagCtrl(IDC_XLIB_MODCONFIGURATION_TEXT_SELECTIONINFO) ctrlSetStructuredText  parseText getText (_configClass >> "description");