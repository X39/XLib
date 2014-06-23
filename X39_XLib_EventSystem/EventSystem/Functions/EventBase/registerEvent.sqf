/**
 *	Add a CustomEvent to the mission
 *
 *	@ParamsCount - 1 (up to 3)
 *	@Param1 - String - Name of the custom event handler
 *	@Param2 - String - Name of the namespace
 *	@Param3 - Namespace - namespace to use. Default missionNamespace
 *	@Return - Boolean - false if event already existed or creation was not successfull true if not
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

_events = _customVariableNamespace getVariable getNamespacePath(_customNamespace);
if(_events find _customEvent >= 0) exitWith
{
	printErrorMessage("event is already existing")
	return false
};
_events set[count _events, _customEvent];
_customVariableNamespace setVariable[getNamespacePath(_customNamespace), _events];
_customVariableNamespace setVariable[getEventHandlersPath(_customNamespace, _customEvent), []];
return true