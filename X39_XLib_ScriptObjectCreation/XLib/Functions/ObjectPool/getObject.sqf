#include "\X39_XLib_Core\default.hpp"
/**
 *	get a single object from a pool
 *
 *	@ParamsCount 2
 *	@Param1 - SCALAR - ObjectID of the object
 *	@Param2 - ARRAY - ObjectPool of the object
 *	@Return - ARRAY/SCALAR - the wanted object or an empty array when operation failed or -1 if the object you want has been destroyed
 *	@Author - X39|Cpt. HM Murdock
 */
private["_object", "_objectPool", "_objectPool_objectArray"];

_object = [_this, 0, -1, [-1]] call BIS_fnc_param;
_objectPool = [_this, 1, [], [[]]] call BIS_fnc_param;

if(_object < 0) exitWith { diag_log "X39_XLib_fnc_ObjectPool_getObject: Invalid objectID given!"; return []};
if(count _objectPool != 3) exitWith { diag_log format["X39_XLib_fnc_ObjectPool_getObject: No valid object pool has been provided! %1", _objectPool]; return []};

_objectPool_objectArray = _objectPool select 2;
if(count _objectPool_objectArray <= _object) exitWith  {diag_log "X39_XLib_fnc_ObjectPool_getObject: Invalid objectID given!"; return []};

return (_objectPool_objectArray select _object)