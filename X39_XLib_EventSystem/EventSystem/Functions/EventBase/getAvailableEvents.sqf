/**
 *	get customEventHandlers in given namespace
 *
 *	@ParamsCount - 0 (up to 2)
 *	@Param1 - String - Name of the namespace
 *	@Param2 - Namespace - namespace to use. Default missionNamespace
 *	@Return - Array - Array containing the Events of the given CustomNamespace
 *	@Author - X39|Cpt. HM Murdock
 */
#include "\X39_XLib_EventSystem\EventSystem\default.hpp"
_customNamespace = [_this, 0, "mission", [""]] call BIS_fnc_param;
_customVariableNamespace = [_this, 1, missionNamespace, [missionNamespace]] call BIS_fnc_param;

if(_customNamespace == "") exitWith
{
	printErrorMessage("You need to provide a valid namespace")
	return false
};
return _customVariableNamespace getVariable getNamespacePath(_customNamespace)