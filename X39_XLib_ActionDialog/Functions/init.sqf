#include "\X39_XLib_ActionDialog\default.hpp"
/*	
 *	Automatically callen upon mission start
 *	Will initialize the key handler of XLib
 *	
 *	@Return - NA
 */

private["_res"];
if(hasInterface) then
{
	_res = [] spawn {
		DEBUG_CODE_SC(_fnc_scriptName = "X39_XLib_fnc_ActionDialog_init")
		waitUntil{!isNil "X39_XLib_fnc_registerKey"};
		[0, false, false, false, {[] call X39_XLib_fnc_ActionDialog_createDialog;	[false] call X39_XLib_fnc_ActionDialog_initSystemVariables;	[] call X39_XLib_fnc_ActionDialog_initActions;}, "X39_XLib_var_ActionDialog_selfInteraction"]	call X39_XLib_fnc_registerKey;
		[0, false, false, false, {[] call X39_XLib_fnc_ActionDialog_createDialog;	[true] call X39_XLib_fnc_ActionDialog_initSystemVariables;	[] call X39_XLib_fnc_ActionDialog_initActions;}, "X39_XLib_var_ActionDialog_otherInteraction"]	call X39_XLib_fnc_registerKey;
		X39_XLib_var_ActionDialog_Actions = [];
		X39_XLib_var_ActionDialog_Target						= objNull;
		X39_XLib_var_ActionDialog_Executor						= objNull;
		X39_XLib_var_ActionDialog_IsSelf						= false;
		X39_XLib_var_ActionDialog_ExecutorInVehicle 			= false;
		X39_XLib_var_ActionDialog_subActions_currentLeft		= [];
		X39_XLib_var_ActionDialog_subActions_currentLeftIndex	= [];
		X39_XLib_var_ActionDialog_subActions_currentRight		= [];
		X39_XLib_var_ActionDialog_subActions_currentRightIndex	= [];
	};
};