#include "\X39_XLib_Core\default.hpp"
/**
 *	Example description
 *
 *	@ParamsCount 1
 *	@Param1 - SCALAR - example parameter
 *	@Return - BOOL - example return type
 *	@Author - X39|Cpt. HM Murdock
 */
private ["_returnValue", "_param1"];							//put variables to local space
																//	(see http://community.bistudio.com/wiki/private for the reason why)
_returnValue = false; 											//set default return value

_param1 = [_this, 0, -1, [0]] call BIS_fnc_param;				//gather all params at the beginning

if(_param1 <= -1) exitWith {diag_log "example error message";};	//Validate parameters

if(_param1 > 5) then
{
	_returnValue = true;
};

return _returnValue