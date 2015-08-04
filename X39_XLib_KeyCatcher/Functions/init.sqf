#include "\X39_XLib_KeyCatcher\default.hpp"
/*	
 *	Automatically callen upon mission start
 *	Will initialize the key handler of XLib
 *	
 *	@Return - NA
 */

private["_res"];
if(hasInterface) then
{
	_res = [] spawn {
		DEBUG_CODE_SC(_fnc_scriptName = "X39_XLib_fnc_KeyCatcher_init")
		if(isNil "X39_XLib_var_KeyHandler") then
		{
			waitUntil{!isNull (findDisplay 46)}; 
			sleep 1;
			X39_XLib_var_KeyHandler = (findDisplay 46) displayAddEventHandler["KeyDown", "_this call X39_XLib_fnc_KeyCatcher_cb_KeyDown;"];
			DEBUG_LOG_WFn_SC(format["Initialized X39_XLib_var_KeyHandler with '%1'" COMMA X39_XLib_var_KeyHandler])
		}DEBUG_CODE(else{DEBUG_LOG_WFn_SC(format["X39_XLib_var_KeyHandler was already initialized with '%1'" COMMA X39_XLib_var_KeyHandler])});
	};
};