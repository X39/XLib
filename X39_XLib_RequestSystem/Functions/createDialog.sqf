#include "\X39_XLib_RequestSystem\default.hpp"
#include "\X39_XLib_RequestSystem\UI\ui.defs"
/*
 	@Author - X39|Cpt. HM Murdock
 */
if(isNull (uiNamespace getVariable ["XLib_RequestSystem_Ui", displayNull])) then
{
	("XLib_var_RequestSystem_Ui_RscLayer" call BIS_fnc_rscLayer) cutRsc["XLib_RequestSystem_Ui", "PLAIN"];
	displayControl(IDC_XLIB_ADUI_RSCTEXT_1003) ctrlShow false;
	displayControl(IDC_XLIB_ADUI_IGUIBACK_2203) ctrlShow false;
	X39_XLib_fnc_RequestSystem_uiHandle = _this spawn {
		private["_text", "_callbackFunction", "_sender", "_target", "_key", "_txt"];
		_text =				_this select 0;
		_callbackFunction =	_this select 1;
		_sender =			_this select 2;
		_target =			_this select 3;
		_lastRequest = [];
		
		//----------------------------------------------------
		
		_key = ["X39_XLib_Configuration", "X39_XLib_fnc_RequestSystem_Accept"] call X39_XLib_fnc_Generic_ModProperties_getKey;//profileNamespace getVariable ["X39_XLib_fnc_RequestSystem_Accept", [-1, false, false, false]];
		_txt = "";
		if(_key select 0 == -1) then
		{
			_txt = localize "X39_XLib_RequestSystem_KeyNotSet";
		}
		else
		{
			_txt = (_key select 0) call X39_XLib_fnc_dikCodeToChar;
			if(_key select 1) then { _txt = format["SHIFT + %1", _txt]; };
			if(_key select 2) then { _txt = format["CTRL + %1", _txt]; };
			if(_key select 3) then { _txt = format["ALT + %1", _txt]; };
		};
		displayControl(IDC_XLIB_ADUI_RSCTEXT_1001) ctrlSetText format[localize "X39_XLib_RequestSystem_RequestAccept", _txt];
		
		//----------------------------------------------------
		
		_key = ["X39_XLib_Configuration", "X39_XLib_fnc_RequestSystem_Deny"] call X39_XLib_fnc_Generic_ModProperties_getKey;//profileNamespace getVariable ["X39_XLib_fnc_RequestSystem_Deny", [-1, false, false, false]];
		_txt = "";
		if(_key select 0 == -1) then
		{
			_txt = localize "X39_XLib_RequestSystem_KeyNotSet";
		}
		else
		{
			_txt = (_key select 0) call X39_XLib_fnc_dikCodeToChar;
			if(_key select 1) then { _txt = format["SHIFT + %1", _txt]; };
			if(_key select 2) then { _txt = format["CTRL + %1", _txt]; };
			if(_key select 3) then { _txt = format["ALT + %1", _txt]; };
		};
		displayControl(IDC_XLIB_ADUI_RSCTEXT_1002) ctrlSetText format[localize "X39_XLib_RequestSystem_RequestDeny", _txt];
		
		//----------------------------------------------------
		
		
		while{!isNil {uiNamespace getVariable "XLib_RequestSystem_Ui"}} do
		{
			scopeName "loopScope";
			waitUntil {sleep 0.0001; !X39_XLib_fnc_RequestSystem_BlockLocalRequestChanges};
			if(count X39_XLib_fnc_RequestSystem_LocalRequests == 0) exitWith {breakOut "loopScope";};
			X39_XLib_fnc_RequestSystem_CurrentRequest = X39_XLib_fnc_RequestSystem_LocalRequests select 0;
			if(isNil "X39_XLib_fnc_RequestSystem_CurrentRequest") exitWith {X39_XLib_fnc_RequestSystem_CurrentRequest = []; breakOut "loopScope";};
			if(str _lastRequest != str X39_XLib_fnc_RequestSystem_CurrentRequest) then
			{
				X39_XLib_fnc_RequestSystem_currentRequestStartTime = diag_ticktime;
			};
			
			if(count X39_XLib_fnc_RequestSystem_LocalRequests > 1) then
			{
				displayControl(IDC_XLIB_ADUI_RSCTEXT_1003) ctrlSetText format[localize "X39_XLib_RequestSystem_PendingRequests", count X39_XLib_fnc_RequestSystem_LocalRequests];
				if(!ctrlShown displayControl(IDC_XLIB_ADUI_RSCTEXT_1003)) then
				{
					displayControl(IDC_XLIB_ADUI_IGUIBACK_2203) ctrlShow true;
					displayControl(IDC_XLIB_ADUI_RSCTEXT_1003) ctrlShow true;
					//displayControl(IDC_XLIB_ADUI_IGUIBACK_2203) ctrlSetFade 0;
					//displayControl(IDC_XLIB_ADUI_RSCTEXT_1003) ctrlSetFade 0;
					//displayControl(IDC_XLIB_ADUI_IGUIBACK_2203) ctrlCommit 0.25;
					//displayControl(IDC_XLIB_ADUI_RSCTEXT_1003) ctrlCommit 0.25;
				};
			}
			else
			{
				if(ctrlShown displayControl(IDC_XLIB_ADUI_RSCTEXT_1003)) then
				{
					displayControl(IDC_XLIB_ADUI_RSCTEXT_1003) ctrlSetText format[localize "X39_XLib_RequestSystem_PendingRequests", count X39_XLib_fnc_RequestSystem_LocalRequests];
					//displayControl(IDC_XLIB_ADUI_IGUIBACK_2203) ctrlSetFade 1;
					//displayControl(IDC_XLIB_ADUI_RSCTEXT_1003) ctrlSetFade 1;
					//displayControl(IDC_XLIB_ADUI_IGUIBACK_2203) ctrlCommit 0.25;
					//displayControl(IDC_XLIB_ADUI_RSCTEXT_1003) ctrlCommit 0.25;
					//uiSleep 0.25;
					displayControl(IDC_XLIB_ADUI_IGUIBACK_2203) ctrlShow false;
					displayControl(IDC_XLIB_ADUI_RSCTEXT_1003) ctrlShow false;
				};
			};
			displayControl(IDC_XLIB_ADUI_RSCTEXT_1000) ctrlSetText (X39_XLib_fnc_RequestSystem_CurrentRequest select 0);
			if(diag_ticktime - X39_XLib_fnc_RequestSystem_currentRequestStartTime > REQUESTSYSTEM_TIMEOUT) then
			{
				if(X39_XLib_fnc_RequestSystem_CurrentRequest select 3) then
				{
					[] call X39_XLib_fnc_RequestSystem_acceptRequest;
				}
				else
				{
					[] call X39_XLib_fnc_RequestSystem_denyRequest;
				};
			};
		};
		("XLib_var_RequestSystem_Ui_RscLayer" call BIS_fnc_rscLayer) cutText ["","PLAIN"];
	};
};
X39_XLib_fnc_RequestSystem_uiHandle