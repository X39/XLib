#include "\X39_XLib_Core\default.hpp"
/**
 *	creates an ObjectPool
 *
 *	@ParamsCount 2
 *	@Param1 - SCALAR - max object count for this ObjectPool (-1 to disable)
 *	@Param2 - CODE - Code for "X39_XLib_fnc_ObjectPool_addObject" function to validate that an object is OK (nil to disable)
 *	@Return - ARRAY - the generated ObjectPool
 *	@Author - X39|Cpt. HM Murdock
 */
private["_maxObjects", "_validationCode", "_objectPool"];

_maxObjects = [_this, 0, -1, [-1]] call BIS_fnc_param;
_validationCode = [_this, 1, {true}, [{}]] call BIS_fnc_param;

_objectPool =	[
					_maxObjects,
					_validationCode,
					[]
				];
return _objectPool