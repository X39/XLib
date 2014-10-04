#include "\X39_XLib_RequestSystem\default.hpp"
/*
 *	@Param1	-	STRING	- Text to display
 *	@Param2	-	STRING	- The callback function name as string (will be executed local to sender)
 *							Function will receive the following parameters:
 *							- BOOL	- true, if request has been accepted otherwise it will be false
 *							- OBJECT - Sender
 *							- OBJECT - Receiver
 *							- ARRAY - Custom parameters of step @Param3
 *	@Param3	-	ANY		- Custom parameters
 *	@Param4	-	OBJECT	- Sender
 *	@Param5	-	OBJECT	- Target (use player for local Request)
 *	@Param6	-	BOOL	- default fallback after timeout
 *	@Return	-	NA
 *	
 *	@Author - X39|Cpt. HM Murdock
 */
private["_text", "_callbackFunction", "_sender", "_target", "_dlgBlock", "_customParams", "_defaultFallback"];
_text =				[_this, 0, "", [""]] call BIS_fnc_param;
_callbackFunction =	[_this, 1, "", [""]] call BIS_fnc_param;
_customParams =		[_this, 2] call BIS_fnc_param;
_sender =			[_this, 3, objNull, [objNull]] call BIS_fnc_param;
_target =			[_this, 4, objNull, [objNull]] call BIS_fnc_param;
_defaultFallback =	[_this, 5, false, [false]] call BIS_fnc_param;

if(_text == "") exitWith {PRINT_ERROR("No text given!");};
if(_callbackFunction == "") exitWith {PRINT_ERROR("No function given!");};
if(!ISCODE(missionNamespace getVariable _callbackFunction)) exitWith {PRINT_ERROR("No function given (function value NIL)!");};
if(isNull _sender) exitWith {PRINT_ERROR("No sender unit given!");};
if(isNull _target) exitWith {PRINT_ERROR("No target unit given!");};
FORCELOCAL(_target);
[_text, _sender, _target, _defaultFallback, _callbackFunction, _customParams] spawn {
	waitUntil{sleep 0.0001; !X39_XLib_fnc_RequestSystem_BlockLocalRequestChanges};
	X39_XLib_fnc_RequestSystem_BlockLocalRequestChanges = true;
	X39_XLib_fnc_RequestSystem_LocalRequests set[count X39_XLib_fnc_RequestSystem_LocalRequests, _this];
	X39_XLib_fnc_RequestSystem_BlockLocalRequestChanges = false;

	_dlgBlock = _this call X39_XLib_fnc_RequestSystem_CreateDialog;
};