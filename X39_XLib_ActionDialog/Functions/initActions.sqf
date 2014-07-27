#include "\X39_XLib_ActionDialog\default.hpp"
#include "\X39_XLib_ActionDialog\ActionDialogV1.defs"
/*	
 *	sets the system variables values which later will be used in the actions
 *	
 *	@Param1 - BOOL - false if self, true if cursorTarget
 *	@Return - NA
 */
_this spawn {
	DEBUG_CODE_SC(_fnc_scriptName = "X39_XLib_fnc_ActionDialog_initActions")
	_idcs_InnerMenu = [
				IDC_X39_XLIB_ACTIONDIALOG_RSCBUTTON_1601,
				IDC_X39_XLIB_ACTIONDIALOG_RSCBUTTON_1602,
				IDC_X39_XLIB_ACTIONDIALOG_RSCBUTTON_1603,
				IDC_X39_XLIB_ACTIONDIALOG_RSCBUTTON_1604,
				IDC_X39_XLIB_ACTIONDIALOG_RSCBUTTON_1605,
				IDC_X39_XLIB_ACTIONDIALOG_RSCBUTTON_1606,
				IDC_X39_XLIB_ACTIONDIALOG_RSCBUTTON_1607,
				IDC_X39_XLIB_ACTIONDIALOG_RSCBUTTON_1608,
				IDC_X39_XLIB_ACTIONDIALOG_RSCBUTTON_1609,
				IDC_X39_XLIB_ACTIONDIALOG_RSCBUTTON_1610,
				IDC_X39_XLIB_ACTIONDIALOG_RSCBUTTON_1611
			];
	_assignedActions = [];
	while{!isNil {(uiNamespace getVariable "X39_XLib_ActionDialog")}} do
	{//TODO: Take care about sub actions
		if(({([] call ((X39_XLib_var_ActionDialog_Actions select _x) select 3))} count _assignedActions) > 0) then
		{
			{
				adDisplayCtrl(_x) ctrlShow false;
				false
			} count _idcs_InnerMenu;
			_assignedActions = [];
		};
		{
			if(!(_forEachIndex in _assignedActions)) then
			{
				if([] call (_x select 3)) then
				{
					adDisplayCtrl(_idcs_InnerMenu select (count _assignedActions)) ctrlShow true;
					adDisplayCtrl(_idcs_InnerMenu select (count _assignedActions)) ctrlSetText (_x select 0);
					if(count (_x select 4) == 0) then
					{
						adDisplayCtrl((_idcs_InnerMenu select (count _assignedActions))) ctrlSetEventHandler["MouseButtonClick", ((_x select 2) call X39_XLib_fnc_convertCodeToString)];
					}
					else
					{
						adDisplayCtrl((_idcs_InnerMenu select (count _assignedActions))) ctrlSetEventHandler["MouseButtonClick", format["[%1, %2] spawn X39_XLib_fnc_ActionDialog_initSubactionEntries", _forEachIndex, count _assignedActions / (count _idcs_InnerMenu) < 0.5]];
					};
					_assignedActions set [count _assignedActions, _forEachIndex];
				};
			};
		} forEach X39_XLib_var_ActionDialog_Actions;
		sleep 0.5;
	};
};