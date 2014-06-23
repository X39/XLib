/**
 *	get available namespaces
 *
 *	@ParamsCount - 0 (up to 1)
 *	@Param1 - Namespace - namespace to use. Default missionNamespace
 *	@Return - Array - Array containing the registered namespaces
 *	@Author - X39|Cpt. HM Murdock
 */
#include "\X39_XLib_EventSystem\EventSystem\default.hpp"
_customVariableNamespace = [_this, 0, missionNamespace] call BIS_fnc_param;
return _customVariableNamespace getVariable "X39_XLib_EH_var_Namespaces";