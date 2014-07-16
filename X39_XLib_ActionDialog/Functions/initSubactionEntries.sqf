#include "\X39_XLib_ActionDialog\default.hpp"
#include "\X39_XLib_ActionDialog\ActionDialogV1.defs"
/*	
 *	Initializes the subActions of a menu entry
 *	
 *	@Param1 - SCALAR	- parent action ID
 *	@Param2 - BOOL		- true if left side, false if right
 *	@Return - NA
 */
private["_parentID", "_isLeftSide", "_subActions", "_idcs", "_subActionList_uiNamespaceString", "_subActionList_uiNamespaceString_index", "_index", "_subActionList_maxRuns", "_currentSelection", "_validSubactions"];
_parentID =		[_this, 0, -1, [0]] call BIS_fnc_param;
_isLeftSide =	[_this, 1, false, [false]] call BIS_fnc_param;

if(count X39_XLib_var_ActionDialog_Actions < _parentID) exitWith { private["_str"]; _str = format["Failed to create subactions: count X39_XLib_var_ActionDialog_Actions < _parentID (%1 < %2)", count X39_XLib_var_ActionDialog_Actions, _parentID]; systemChat _str; PRINT_ERROR(_str);};

_subActions = X39_XLib_var_ActionDialog_Actions select _parentID select 4;
{
	adDisplayCtrl(_x) ctrlShow false;
	false
}count [
				IDC_X39_XLIB_ACTIONDIALOG_RSCBUTTON_1612,
				IDC_X39_XLIB_ACTIONDIALOG_RSCBUTTON_1613,
				IDC_X39_XLIB_ACTIONDIALOG_RSCBUTTON_1614,
				IDC_X39_XLIB_ACTIONDIALOG_RSCBUTTON_1615,
				IDC_X39_XLIB_ACTIONDIALOG_RSCBUTTON_1616,
				IDC_X39_XLIB_ACTIONDIALOG_RSCBUTTON_1617,
				IDC_X39_XLIB_ACTIONDIALOG_RSCBUTTON_1618,
				IDC_X39_XLIB_ACTIONDIALOG_RSCBUTTON_1619,
				IDC_X39_XLIB_ACTIONDIALOG_RSCBUTTON_1620,
				IDC_X39_XLIB_ACTIONDIALOG_RSCBUTTON_1621
			];
if(_isLeftSide) then
{
	_idcs = [
				IDC_X39_XLIB_ACTIONDIALOG_RSCBUTTON_1612,
				IDC_X39_XLIB_ACTIONDIALOG_RSCBUTTON_1613,
				IDC_X39_XLIB_ACTIONDIALOG_RSCBUTTON_1614,
				IDC_X39_XLIB_ACTIONDIALOG_RSCBUTTON_1615,
				IDC_X39_XLIB_ACTIONDIALOG_RSCBUTTON_1616
			];
	_subActionList_uiNamespaceString = "X39_XLib_var_ActionDialog_subActions_currentLeft";
	_subActionList_uiNamespaceString_index = "X39_XLib_var_ActionDialog_subActions_currentLeftIndex";
}
else
{
	_idcs = [
				IDC_X39_XLIB_ACTIONDIALOG_RSCBUTTON_1617,
				IDC_X39_XLIB_ACTIONDIALOG_RSCBUTTON_1618,
				IDC_X39_XLIB_ACTIONDIALOG_RSCBUTTON_1619,
				IDC_X39_XLIB_ACTIONDIALOG_RSCBUTTON_1620,
				IDC_X39_XLIB_ACTIONDIALOG_RSCBUTTON_1621
			];
	_subActionList_uiNamespaceString = "X39_XLib_var_ActionDialog_subActions_currentRight";
	_subActionList_uiNamespaceString_index = "X39_XLib_var_ActionDialog_subActions_currentRightIndex";
};



uiNamespace setVariable [_subActionList_uiNamespaceString, _subActions];
uiNamespace setVariable [_subActionList_uiNamespaceString_index, 0];
_index = _idcs select 0;
adDisplayCtrl(_index) ctrlShow true;
adDisplayCtrl(_index) ctrlEnable false;
adDisplayCtrl(_index) ctrlSetText "/\";
adDisplayCtrl(_index) buttonSetAction (str formatText["_res = [%1, %2] spawn X39_XLib_fnc_ActionDialog_subActionListUpDown;", true, _isLeftSide]);
_index = _idcs select ((count _idcs) - 1);
adDisplayCtrl(_index) ctrlShow true;
adDisplayCtrl(_index) ctrlEnable true;
adDisplayCtrl(_index) ctrlSetText "\/";
adDisplayCtrl(_index) buttonSetAction (str formatText["_res = [%1, %2] spawn X39_XLib_fnc_ActionDialog_subActionListUpDown;", false, _isLeftSide]);
_subActionList_maxRuns = 3;
_validSubactions = {([] call (_x select 3))} count _subActions;
if(_validSubactions < 3) then
{
	_subActionList_maxRuns = _validSubactions;
	adDisplayCtrl(_index) ctrlEnable false;
};
if(_subActionList_maxRuns > 0) then
{
	for "_i" from 1 to _subActionList_maxRuns do
	{
		_index = _idcs select _i;
		_currentSelection = _subActions select (_i - 1);
		if([] call (_currentSelection select 3))then
		{
			adDisplayCtrl(_index) ctrlShow true;
			adDisplayCtrl(_index) ctrlEnable true;
			adDisplayCtrl(_index) ctrlSetText (_currentSelection select 0);
			adDisplayCtrl(_index) buttonSetAction ((_currentSelection select 2) call X39_XLib_fnc_convertCodeToString);
		}
		else
		{
			_i = _i - 1;
		};
	};
};