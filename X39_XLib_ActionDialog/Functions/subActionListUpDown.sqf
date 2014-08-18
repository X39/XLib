#include "\X39_XLib_ActionDialog\default.hpp"
#include "\X39_XLib_ActionDialog\ActionDialogV1.defs"
#define OuterButtonListCount 3
/**
 *	Navigates the subaction list one up/down
 *	
 *	@ParamsCount - 2
 *	@Param1 - BOOL - if true list goes one up, false one down
 *	@Param2 - BOOL - if true left list is chosen if false right one
 *	@Return - NA
 *	@Author - X39|Cpt. HM Murdock
 */
private["_up", "_isLeftSide", "_idcTop", "_idcBottom", "_subActions", "_currentIndex", "_subActionList_maxRuns", "_idcs", "_validSubactions"];
_up = [_this, 0, true, [true]] call BIS_fnc_param;
_isLeftSide = [_this, 1, false, [true]] call BIS_fnc_param;

if(_isLeftSide) then
{
	_idcs = [
				IDC_X39_XLIB_ACTIONDIALOG_RSCBUTTON_1612,
				IDC_X39_XLIB_ACTIONDIALOG_RSCBUTTON_1613,
				IDC_X39_XLIB_ACTIONDIALOG_RSCBUTTON_1614,
				IDC_X39_XLIB_ACTIONDIALOG_RSCBUTTON_1615,
				IDC_X39_XLIB_ACTIONDIALOG_RSCBUTTON_1616
			];
	_subActions =	uiNamespace getVariable ["X39_XLib_var_ActionDialog_subActions_currentLeft", []];
	_currentIndex =	uiNamespace getVariable ["X39_XLib_var_ActionDialog_subActions_currentLeftIndex", 0];
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
	_subActions =	uiNamespace getVariable ["X39_XLib_var_ActionDialog_subActions_currentRight", []];
	_currentIndex =	uiNamespace getVariable ["X39_XLib_var_ActionDialog_subActions_currentRightIndex", 0];
};
_idcTop =		_idcs select 0;
_idcBottom =	_idcs select ((count _idcs) - 1);

adDisplayCtrl(_idcTop) ctrlEnable true;
adDisplayCtrl(_idcBottom) ctrlEnable true;
if(_up) then
{
	_currentIndex = _currentIndex - 1;
}
else
{
	_currentIndex = _currentIndex + 1;
};
if(_currentIndex <= 0) then
{
	_currentIndex = 0;
	adDisplayCtrl(_idcTop) ctrlEnable false;
};
_validSubactions = {([] call (_x select 3))} count _subActions;
if(_currentIndex >= _validSubactions - OuterButtonListCount ) then
{
	_currentIndex = (_validSubactions - OuterButtonListCount);
	adDisplayCtrl(_idcBottom) ctrlEnable false;
};


_subActionList_maxRuns = OuterButtonListCount + _currentIndex;
if(_subActionList_maxRuns > 0) then
{
	for "_i" from _currentIndex + 1 to _subActionList_maxRuns do
	{
		_index = _idcs select (_i - _currentIndex);
		_currentSelection = _subActions select (_i - 1);
		if([] call (_currentSelection select 3))then
		{
			adDisplayCtrl(_index) ctrlShow true;
			adDisplayCtrl(_index) ctrlEnable true;
			adDisplayCtrl(_index) ctrlSetText (_currentSelection select 0);
			adDisplayCtrl(_index) ctrlSetEventHandler ["ButtonClick", ((_currentSelection select 2) call X39_XLib_fnc_convertCodeToString)];
		}
		else
		{
			_i = _i - 1;
		};
	};
};
if(_isLeftSide) then
{
	uiNamespace setVariable ["X39_XLib_var_ActionDialog_subActions_currentLeftIndex", _currentIndex];
}
else
{
	uiNamespace setVariable ["X39_XLib_var_ActionDialog_subActions_currentRightIndex", _currentIndex];
};