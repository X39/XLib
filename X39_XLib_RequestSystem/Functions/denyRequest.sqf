#include "\X39_XLib_RequestSystem\default.hpp"
/*
		
 	@Return - N/A
 	@Author - X39|Cpt. HM Murdock
 */
X39_XLib_fnc_RequestSystem_BlockLocalRequestChanges = true;

if(count X39_XLib_fnc_RequestSystem_LocalRequests > 0) then
{
	_currentRequest = X39_XLib_fnc_RequestSystem_LocalRequests select 0;
	[X39_XLib_fnc_RequestSystem_LocalRequests] call BIS_fnc_arrayShift;
	[false, _currentRequest select 1, _currentRequest select 2, _currentRequest select 5] call (missionNamespace getVariable (_currentRequest select 4));
};
X39_XLib_fnc_RequestSystem_BlockLocalRequestChanges = false;