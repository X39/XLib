#include "\X39_XLib_ActionDialog\default.hpp"
/*	
 *	Registers a new (sub)action
 *	Actions having subactions cannot have a custom buttonAction (images are allowed)
 *
 *	@Param1 - STRING		- Text to display	
 *	@Param2 - STRING		- Image (use "" for no image) 
 *	@Param3 - STRING/CODE	- buttonAction (will automatically transformed to a STRING)
 *	@Param4 - CODE			- Condition to be displayed (works also on actions with subactions)
 *								Available preDefined variables:
 *								- X39_XLib_var_ActionDialog_Target
 *								- X39_XLib_var_ActionDialog_Executor
 *								- X39_XLib_var_ActionDialog_IsSelf
 *								- X39_XLib_var_ActionDialog_ExecutorInVehicle
 *								- X39_XLib_var_ActionDialog_preventMenuOpening
 *	@Param5 - SCALAR		- parent action ID (use this to add subactions or leave blank if not needed)
 *	@Return - SCALAR		- ActionID (in case of a subAction it wil return the parents action ID)
 */
private["_displayText", "_image", "_buttonAction", "_condition", "_parentID", "_arr", "_returnID"];
_displayText =	[_this, 0, "", [""]] call BIS_fnc_param;
_image =		[_this, 1, "", [""]] call BIS_fnc_param;
_buttonAction =	[_this, 2, "systemChat 'No action code given';", ["", {}]] call BIS_fnc_param;
_condition =	[_this, 3, {true}, [{}]] call BIS_fnc_param;
_parentID =		[_this, 4, -1, [0]] call BIS_fnc_param;

_returnID = -1;

if(ISCODE(_buttonAction)) then
{
	//Convert ANY code to a string and remove the initial and final {}
	_arr = toArray (str _buttonAction);
	_arr set[0, -1];
	_arr set[(count _arr) - 1, -1];
	_arr = _arr - [-1];
	_buttonAction = toString _arr;
};
if(isNil "X39_XLib_var_ActionDialog_Actions") then
{
	X39_XLib_var_ActionDialog_Actions = [];
};
if(_parentID < 0) then
{
	_returnID = count X39_XLib_var_ActionDialog_Actions;
	X39_XLib_var_ActionDialog_Actions set[_returnID, [_displayText, _image, _buttonAction, _condition, []]];
}
else
{
	if(_parentID >= count X39_XLib_var_ActionDialog_Actions) exitWith
	{
		PRINT_ERROR(format["Cannot register action '%1' as the parentID is not existing!" COMMA _this]);
	};
	(X39_XLib_var_ActionDialog_Actions select _parentID select 4) set [count (X39_XLib_var_ActionDialog_Actions select _parentID select 4), [_displayText, _image, _buttonAction, _condition]];
	_returnID = _parentID;
};
_returnID