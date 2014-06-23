/**
 *	Remove a handler from an event
 *
 *	@ParamsCount - 2 (up to 4)
 *	@Param1 - Integer - EventHandler ID
 *	@Param2 - String - Name of the custom event handler
 *	@Param3 - String - Name of the namespace
 *	@Param4 - Namespace - namespace to use. Default missionNamespace
 *	@Return - Boolean - true if the handler was removed, false if not
 *	@Author - X39|Cpt. HM Murdock
 */
 #include "\X39_XLib_EventSystem\EventSystem\default.hpp"
_idToRemove = [_this, 0, -1, [1]] call BIS_fnc_param;
_customEvent = [_this, 1, "", [""]] call BIS_fnc_param;
_customNamespace = [_this, 2, "mission", [""]] call BIS_fnc_param;
_customVariableNamespace = [_this, 3, missionNamespace, [missionNamespace]] call BIS_fnc_param;

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
	return false
};

_handlers = [_customEvent, _customNamespace, _customVariableNamespace] call X39_XLib_EH_fnc_getEventHandlers;
if(count _handlers < _idToRemove) exitWith
{
	printErrorMessage("Handler ID is not existing")
	return false
};
_handlers set[_idToRemove, -1];
_customVariableNamespace setVariable [getEventHandlersPath(_customNamespace, _customEvent), _handlers];
return true