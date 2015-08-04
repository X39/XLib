#include "\X39_XLib_KeyCatcher\default.hpp"
/**
 *	handles key presses (function for KeyDown display event handler. KeyDown param description of the wiki:
 * 	Returns the control, the keyboard code and the state of Shift, Ctrl and Alt.)
 *
 *	@ParamsCount - 5
 *	@Param1 - OBJECT (Display) - N/A
 *	@Param2 - SCALAR (keycode) - N/A
 *	@Param3 - SCALAR (bool) - shift pressed
 *	@Param4 - SCALAR (bool) - ctrl pressed
 *	@Param5 - SCALAR (bool) - alt pressed
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
_handled = false;
scopeName "out";
{
	scopeName "out";
	if(!ISSCALAR(_x))then
	{
		_currentKey = profileNamespace getVariable [(_x select 0), (_x select 2)];
		if(_this select 1 == _currentKey select 0) then {
			if(( (_this select 2 && _currentKey select 1) || (!(_this select 2) && !(_currentKey select 1)) ) &&
			   ( (_this select 3 && _currentKey select 2) || (!(_this select 3) && !(_currentKey select 2)) ) &&
			   ( (_this select 4 && _currentKey select 3) || (!(_this select 4) && !(_currentKey select 3)) )) then {
				_res = _this call (_x select 1);
				_handled = if(isNil "_res") then {true} else {_res};
				if(_handled) then
				{
					breakTo "out";
				};
			};
		};
	};
	false
}count X39_XLib_var_Keys;
_handled