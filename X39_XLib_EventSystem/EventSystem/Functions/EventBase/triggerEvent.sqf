/**
 *	Trigger an event
 *
 *	@ParamsCount - 2 (up to 5)
 *	@Param1 - String - Name of the customEventHandler
 *	@Param2 - Array - parameters for the customEventHandler
 *	@Param3 - Boolean - if true the event awaits a return value (see @Return), if false the EHs will be spawned asynchron
 *	@Param4 - String - Name of the namespace
 *	@Param5 - Namespace - namespace to use. Default missionNamespace
 *	@Return - Array - empty if not was fired or param 3 was false (so no return value was expected), will contain the last result of a customEventHandler if true
 *	@Author - X39|Cpt. HM Murdock
 */
#include "\X39_XLib_EventSystem\EventSystem\default.hpp"
_customEvent = [_this, 0, "", [""]] call BIS_fnc_param;
_customEventParameters = [_this, 1, [], [[]]] call BIS_fnc_param;
_hasReturnValue = [_this, 2, false, [false]] call BIS_fnc_param;
_customNamespace = [_this, 3, "mission", [""]] call BIS_fnc_param;
_customVariableNamespace = [_this, 4, missionNamespace, [missionNamespace]] call BIS_fnc_param;

if(_customEvent == "" || _customNamespace == "") exitWith
{
	if(_customEvent == "") then
	{
		printErrorMessage("You need to provide a valid event")
	};
	if(_customNamespace == "") then
	{
		printErrorMessage("You need to provide a valid namespace")
	};
	return []
};

if(isNil {_customVariableNamespace getVariable getNamespacePath(_customNamespace)}) exitWith
{
	printErrorMessage(format["The given CustomNamespace '%1' is not existing", _customNamespace])
	return []
};
if(isNil {_customVariableNamespace getVariable getEventHandlersPath(_customNamespace, _customEvent)}) exitWith
{
	printErrorMessage(format["The given CustomEventHandler '%1' is not existing", _customEvent])
	return []
};


_handlers = _customVariableNamespace getVariable getEventHandlersPath(_customNamespace, _customEvent);
_i = 0;
_res = [];
{
	_x = _handlers select _i;
	if(typeName _x == "CODE") then
	{
		if(_hasReturnValue) then
		{
			_res = _customEventParameters call _x;
		}
		else
		{
			_threadID = _customEventParameters spawn _x;
		};
	};
	_i = _i + 1;
}count _handlers;

return _res