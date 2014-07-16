#include "\X39_XLib_Core\default.hpp"
/**
 *	will remove the { & } from the code string (which are applied when using str for example)
 *	call example:
 *	{someCode} call X39_XLib_fnc_convertCodeToString
 *	
 *	@ParamsCount 1
 *	@Param1 - CODE/STRING - Code to be converted (if string then function will simply return the string again)
 *	@Return - STRING - Code as string
 *	@Author - X39|Cpt. HM Murdock
 */
private ["_arr", "_param1"];

_param1 = _this;
if(ISCODE(_param1)) then
{
	_arr = toArray (str _param1);
	_arr set[0, -1];
	_arr set[(count _arr) - 1, -1];
	_arr = _arr - [-1];
	_param1 = toString _arr;
};
_param1