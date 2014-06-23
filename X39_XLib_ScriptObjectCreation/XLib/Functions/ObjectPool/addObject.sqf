#include "\X39_XLib_Core\default.hpp"
/**
 *	add object to objectPool
 *
 *	@ParamsCount 2
 *	@Param1 - ARRAY - Object to add
 *	@Param2 - ARRAY - ObjectPool where the object should be added to
 *	@Return - SCALAR - ObjectID of the given object or -1 if the operation failed! See RPT log if operation failed
 *	@Author - X39|Cpt. HM Murdock
 */
private["_object", "_objectPool", "_objectPool_objectArray", "_oID", "_maxElements"];

_object = [_this, 0, [], [[]]] call BIS_fnc_param;
_objectPool = [_this, 1, [], [[]]] call BIS_fnc_param;

if(count _object <= 0) exitWith { diag_log "X39_XLib_fnc_ObjectPool_addObject: It makes no sense to add an empty object to an objectPool!"; return -1};
if(count _objectPool != 3) exitWith { diag_log format["X39_XLib_fnc_ObjectPool_addObject: No valid object pool has been provided! %1", _objectPool]; return -1};

_objectPool_objectArray = _objectPool select 2;
_oID = _objectPool_objectArray find -1;
if(_oID == -1) then
{
	_oID = count _objectPool_objectArray;
	_maxElements = _objectPool select 0;
	if(_oID > _maxElements && _maxElements >= 0) exitWith { diag_log "X39_XLib_fnc_ObjectPool_addObject: Object pools max size has been reached"; return -1};
};
if!(_object call (_objectPool select 1)) exitWith { diag_log "X39_XLib_fnc_ObjectPool_addObject: custom object validation returned false"; return -1 };
_objectPool_objectArray set [_oID, _object];

return _oID