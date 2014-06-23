/**
 *	get all handlers of an event
 *
 *	@ParamsCount - 1 (up to 3)
 *	@Param1 - String - Name of the custom event handler
 *	@Param2 - String - Name of the namespace
 *	@Param3 - Namespace - namespace to use. Default missionNamespace
 *	@Return - Array - free eventHandler slots are filled with -1
 *	@Author - X39|Cpt. HM Murdock
 */
 #include "\X39_XLib_EventSystem\EventSystem\default.hpp"
_customEvent = [_this, 0, "", [""]] call BIS_fnc_param;
_customNamespace = [_this, 1, "mission", [""]] call BIS_fnc_param;
_customVariableNamespace = [_this, 2, missionNamespace, [missionNamespace]] call BIS_fnc_param;

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

return _customVariableNamespace getVariable [getEventHandlersPath(_customNamespace, _customEvent), []]