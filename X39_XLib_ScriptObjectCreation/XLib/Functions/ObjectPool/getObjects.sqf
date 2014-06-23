#include "\X39_XLib_Core\default.hpp"
/**
 *	returns all objects of a objectPool
 *
 *	@ParamsCount 2
 *	@Param1 - ARRAY - ObjectPool of the object
 *	@Return - ARRAY - Objects array of ObjectPool. PLEASE CARE! Destroyed objects are not removed from the array so the array CAN contain destroyed objects
 *					  (do a typeName check: if(typeName == "ARRAY") then {...};)
 *	@Author - X39|Cpt. HM Murdock
 */
private["_objectPool"];

_objectPool = [_this, 0, [], [[]]] call BIS_fnc_param;

if(count _objectPool != 3) exitWith { diag_log format["X39_XLib_fnc_ObjectPool_getObject: No valid object pool has been provided! %1", _objectPool]; return []};


return _objectPool select 2;