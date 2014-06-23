#include "\X39_XLib_Core\default.hpp"
/**
 *	Counts the available valid objects in the given object pool
 *
 *	@ParamsCount 1
 *	@Param1 - ARRAY - ObjectPool where the object should be added to
 *	@Return - SCALAR - number of objects in the pool
 *	@Author - X39|Cpt. HM Murdock
 */
private["_objectPool", "_objectPool_objectArray"];

_objectPool = [_this, 0, [], [[]]] call BIS_fnc_param;

if(count _objectPool != 3) exitWith { diag_log format["%1: No valid object pool has been provided! %2", _fnc_scriptName, _objectPool]; return []};

_objectPool_objectArray = _objectPool select 2;

return {
	if(typeName _x != "SCALAR") then
	{
		return true
	}
	else
	{
		return false
	};
}count _objectPool_objectArray