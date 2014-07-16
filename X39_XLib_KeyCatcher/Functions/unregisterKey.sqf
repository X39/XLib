#include "\X39_XLib_KeyCatcher\default.hpp"
/*	
 *	unregisters a key which was registered before using registerKey
 *
 *	@Param1 - SCALAR	- KeyID
 *	@Return - NA
 */
private["_keyID"];
_keyID =			[_this, 0, 0, [0]] call BIS_fnc_param;

if(_keyID < 0) exitWith {PRINT_ERROR(format["KeyID '%1' is not existing!" COMMA _keyID]);};
if(_keyID >= count X39_XLib_var_Keys) exitWith {PRINT_ERROR(format["KeyID '%1' is not existing!" COMMA _keyID]);};
X39_XLib_var_Keys set[_keyID, -1];