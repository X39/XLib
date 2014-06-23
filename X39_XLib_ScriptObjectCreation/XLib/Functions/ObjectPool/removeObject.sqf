#include "\X39_XLib_Core\default.hpp"
/**
 *	remove object from objectPool
 *
 *	@ParamsCount 2
 *	@Param1 - SCALAR - ObjectID to remove
 *	@Param2 - ARRAY - ObjectPool from where the Object should be removed
 *	@Return - BOOL - true when was successfully
 *	@Author - X39|Cpt. HM Murdock
 */
private["_object", "_objectPool", "_objectPool_objectArray"];

_object = [_this, 0, -1, [-1]] call BIS_fnc_param;
_objectPool = [_this, 1, [], [[]]] call BIS_fnc_param;

if(_object < 0) exitWith { diag_log "X39_XLib_fnc_ObjectPool_removeObject: Invalid objectID given!"; return false};
if(count _objectPool != 3) exitWith { diag_log format["X39_XLib_fnc_ObjectPool_removeObject: No valid object pool has been provided! %1", _objectPool]; return false};

_objectPool_objectArray = _objectPool select 2;
if(count _objectPool_objectArray <= _object) exitWith  {diag_log "X39_XLib_fnc_ObjectPool_removeObject: Invalid objectID given!"; return false};

_objectPool_objectArray set [_object, -1];

return true