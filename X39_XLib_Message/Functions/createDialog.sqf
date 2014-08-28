#include "\X39_XLib_Message\default.hpp"
/*
	@Param1 - STRING - Text to display
	@Param2 - STRING - The callback function name as string
                    Function will receive the following parameters:
                    - BOOL	- true, if request has been accepted otherwise it will be false
                    - OBJECT - Sender
                    - OBJECT - Receiver
                    - ARRAY - Custom parameters of step @Param3
	@Param3 - ARRAY - Custom parameters
	@Param4 - OBJECT - Sender
	@Param5 - OBJECT - Receiver (use player for local message)
	@Param6 - BOOL - Shall the function block until 
	@Return - BOOL - returns false/true depending on the answer (if @Param6 is false this function will return false too)
 	@Author - Phyma
 */
 
_displayText = [_this, 0, "", [""]] call BIS_fnc_param;
_callfunction = [_this, 1, "", [""]] call BIS_fnc_param;
_customParam = [_this, 2, [], [[]]] call BIS_fnc_param;
_sender = [_this, 3, "", [""]] call BIS_fnc_param;
_receiver = [_this, 4, "", [""]] call BIS_fnc_param;
_block = [_this, 5, false, [false]] call BIS_fnc_param;

_messageQueue = [];

if ((missionNamespace getVariable["X39_XLib_Message_isRunning",false])) then {
	_messageQueue set [count _messageQueue,[_displayText,_passCode,_failCode,_receiver,_sender]];	
}else{
	_messageQueue set [count _messageQueue,[_displayText,_passCode,_failCode,_receiver,_sender]];
	assignValue(X39_XLib_Message_isRunning,true);
};

while {(count _messageQueue) != 0} do{
	_message = [_messageQueue] call BIS_fnc_arrayShift;
	_displayText = [_messageQueue, 0, objNull, [objNull]] call BIS_fnc_param;
	_passCode = [_messageQueue, 1, objNull, [objNull]] call BIS_fnc_param;
	_failcode = [_messageQueue, 2, objNull, [objNull]] call BIS_fnc_param;
	_receiver = [_messageQueue, 3, objNull, [objNull]] call BIS_fnc_param;
	_sender = [_messageQueue, 4, objNull, [objNull]] call BIS_fnc_param;
	
	if ([]){
		[] call (_passCode);
	}else{
		[] call (_failcode);			
	};		
	
};
assignValue(X39_XLib_Message_isRunning,false);
