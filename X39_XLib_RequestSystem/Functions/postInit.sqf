#include "\X39_XLib_RequestSystem\default.hpp"
/*
		
 	@Return - N/A
 	@Author - X39|Cpt. HM Murdock
 */
[211, false, false, false, {(if(!isNil {uiNamespace getVariable "XLib_RequestSystem_Ui"}) then {[] call X39_XLib_fnc_RequestSystem_acceptRequest; true} else {false})},	"X39_XLib_fnc_RequestSystem_Accept"	] call X39_XLib_fnc_registerKey;
[210, false, false, false, {(if(!isNil {uiNamespace getVariable "XLib_RequestSystem_Ui"}) then {[] call X39_XLib_fnc_RequestSystem_denyRequest; true} else {false})},	"X39_XLib_fnc_RequestSystem_Deny"	] call X39_XLib_fnc_registerKey;