/**
 *	Add a handler to an event
 *
 *	@ParamsCount - 2 (up to 4)
 *	@Param1 - String - Name of the custom event handler
 *	@Param2 - Code - Code to handle the event
 *	@Param3 - String - Name of the namespace
 *	@Param4 - Namespace - namespace to use. Default missionNamespace
 *	@Return - Integer - >= 0 if was successfully
 *	@Author - X39|Cpt. HM Murdock
 */
 #include "\X39_XLib_EventSystem\EventSystem\default.hpp"
_customEvent = [_this, 0, "", [""]] call BIS_fnc_param;
_handler = [_this, 1, -1, [{}]] call BIS_fnc_param;
_customNamespace = [_this, 2, "mission", [""]] call BIS_fnc_param;
_customVariableNamespace = [_this, 3, missionNamespace] call BIS_fnc_param;

if(_customEvent == "" || _customNamespace == "" || typeName _handler == "SCALAR") exitWith
{
	if(_customEvent == "") then
	{
		printErrorMessage("You need to provide a valid event")
	};
	if(_customNamespace == "") then
	{
		printErrorMessage("You need to provide a valid namespace")
	};
	if(typeName _handler == "SCALAR") then
	{
		printErrorMessage("No handler was given")
	};
	return -1
};
_customEventPath = getEventHandlersPath(_customNamespace, _customEvent);
_handlers = _customVariableNamespace getVariable _customEventPath;
DEBUG_LOG(str _handlers)
_res = _handlers find -1;
DEBUG_LOG(str _res)
if(_res < 0) then
{
DEBUG_LOG(str "last was smaller then 0")
	_res = count _handlers;
DEBUG_LOG(str _res)
};
DEBUG_LOG(str "addEventHandler.sqf - before the set")
DEBUG_LOG(str _res)
DEBUG_LOG(str _handlers)
_handlers set[_res, _handler];
DEBUG_LOG(str "addEventHandler.sqf - after the set")
DEBUG_LOG(str _res)
DEBUG_LOG(str _handlers)
_customVariableNamespace setVariable [_customEventPath, _handlers];
return _res