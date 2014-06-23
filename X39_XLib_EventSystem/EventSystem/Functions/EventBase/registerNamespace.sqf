/**
 *	Add a CustomEventNamespace to the mission
 *
 *	@ParamsCount - 1 (up to 2)
 *	@Param1 - String - Name of the namespace
 *	@Param2 - Namespace - namespace to use. Default missionNamespace
 *	@Return - Boolean - false if namespace already existed or creation was not successfull true if not
 *	@Author - X39|Cpt. HM Murdock
 */
#include "\X39_XLib_EventSystem\EventSystem\default.hpp"
_customNamespace = [_this, 0, "", [""]] call BIS_fnc_param;
_customVariableNamespace = [_this, 1, missionNamespace, [missionNamespace]] call BIS_fnc_param;

if(_customNamespace == "") exitWith
{
	printErrorMessage("You need to provide a valid customNamespace Name")
	return false
};

_existingNamespaces = _customVariableNamespace getVariable "X39_XLib_EH_var_Namespaces";
if(_existingNamespaces find _customNamespace >= 0) exitWith
{
	printErrorMessage("customNamespace is already existing")
	return false
};

_existingNamespaces set[count _existingNamespaces, _customNamespace];
_customVariableNamespace setVariable ["X39_XLib_EH_var_Namespaces", _existingNamespaces];
_customVariableNamespace setVariable[getNamespacePath(_customNamespace), []];

return true