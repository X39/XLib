#include "\X39_XLib_KeyCatcher\default.hpp"
/*	
 *	Registers a new key
 *
 *	@Param1 - SCALAR	- KeyCode
 *	@Param2 - BOOL		- shift pressed
 *	@Param3 - BOOL		- ctrl pressed
 *	@Param4 - BOOL		- alt pressed
 *	@Param5 - CODE		- Code to execute
 *	@Param6 - STRING	- variable in profileNamespace for dynamic settings (param 1-4 are just fallback values), variable content needs to be nil or [SCALAR (keyCode), BOOL (shift pressed), BOOL (ctrl pressed), BOOL (alt pressed)]
 *	@Return - SCALAR	- KeyID
 */
private["_keyID", "_keyCode", "_shift", "_ctrl", "_alt", "_executionCode", "_variable"];
_keyCode =			[_this, 0, 0, [0]] call BIS_fnc_param;
_shift =			[_this, 1, false, [false]] call BIS_fnc_param;
_ctrl =				[_this, 2, false, [false]] call BIS_fnc_param;
_alt =				[_this, 3, false, [false]] call BIS_fnc_param;
_executionCode =	[_this, 4, {hint "Key has no code bound to it";}, [{}]] call BIS_fnc_param;
_variable =			[_this, 5, "X39_XLib_var_nilVariable", [""]] call BIS_fnc_param;

if(_keyCode == 0x01) exitWith {["0x01 keyCode represents the ESC key which is forbidden to use as default! Please choose a different one."] call BIS_fnc_halt;};
_keyID = count X39_XLib_var_Keys;
X39_XLib_var_Keys set[_keyID, [_variable, _executionCode, [_keyCode, _shift, _ctrl, _alt]]];
_keyID