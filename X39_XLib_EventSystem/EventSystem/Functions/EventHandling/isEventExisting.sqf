/**
 *	Check if an event is existing
 *
 *	@ParamsCount - 1 (up to 3)
 *	@Param1 - String - Name of the custom event handler
 *	@Param2 - String - Name of the namespace
 *	@Param3 - Namespace - namespace to use. Default missionNamespace
 *	@Return - Boolean - true if event is existing, false if not
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
	return false
};

_events = [_customNamespace, _customVariableNamespace] call X39_XLib_EH_fnc_getAvailableEvents;
return (_events find _customEvent >= 0)