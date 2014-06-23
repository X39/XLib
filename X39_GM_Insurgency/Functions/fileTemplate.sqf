#include "\X39_XLib_Core\default.hpp"
/**
 *	Example description
 *
 *	@ParamsCount 1
 *	@Param1 - SCALAR - example parameter
 *	@Return - BOOL - example return type
 *	@Author - X39|Cpt. HM Murdock
 */
private ["_returnValue", "_param1"];
//initialize variables
_returnValue = false;
_param1 = [_this, 0, -1, [0]] call BIS_fnc_param;

//validatie parameters
if(_param1 <= -1) exitWith {diag_log "example error message";};

//do something
if(_param1 > 5) then
{
	_returnValue = true;
};

return _returnValue