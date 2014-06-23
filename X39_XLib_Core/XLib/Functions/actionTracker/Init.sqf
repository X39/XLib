#include "\X39_XLib_Core\default.hpp"
/**
 *	Starts the ActionTracker (if it is not already running)
 *
 *	@ParamsCount 0
 *	@Return - NA
 *	@Author - X39|Cpt. HM Murdock
 */
if(!isNil "X39_XLib_var_ActionTracker_running" && {X39_XLib_var_ActionTracker_running}) exitWith { diag_log "ActionTracker already initialized";};

X39_XLib_var_ActionTracker_running = false;
X39_XLib_var_ActionTracker_TrackArray = [];
X39_XLib_var_ActionTracker_Track = true;
X39_XLib_var_ActionTracker_KillTracking = false;

waitUntil {!isNil {Player}};
waitUntil {!isNull Player};
_res = [] spawn {
	private ["_counter","_id","_arr","_trackArrayHelper1","_trackArrayHelper2","_x","_cursorTargetHelper"];
	while{!X39_ActionTracker_KillTracking} do
	{
		if(X39_XLib_var_ActionTracker_Track) then
		{
			_arr = [];
			_cursorTargetHelper = cursorTarget;

			if(!(isNull _cursorTargetHelper)) then 
			{
				_trackArrayHelper1 = + X39_XLib_var_ActionTracker_TrackArray;
				_trackArrayHelper2 = [];
				while{ _cursorTargetHelper == cursorTarget } do
				{
					for [{_counter = 0},{_counter <= count _trackArrayHelper1},{_counter = _counter + 1}] do
					{
						_x = _trackArrayHelper1 select _counter;
						if(!isNil "_x") then
						{
							if(!isNil "_x" && _cursorTargetHelper isKindOf (_x select 0) && (_cursorTargetHelper distance player) < _x select 2 && (((_x select 3) select 0 && vehicle player != player) || ((_x select 3) select 1 && vehicle player == player)) && _cursorTargetHelper call (_x select 4)) then
							{
								_id = _cursorTargetHelper addAction (_x select 1);
								_arr = _arr + [_id];
								_trackArrayHelper1 set [_counter, -1];
								_trackArrayHelper1 = _trackArrayHelper1 - [-1];
								_trackArrayHelper2 = _trackArrayHelper2 + [[_id, _x]];
								
							};
						};
					};
					for [{_counter = 0},{_counter <= count _trackArrayHelper2},{_counter = _counter + 1}] do
					{
						_x = _trackArrayHelper2 select _counter;
						if(!isNil "_x") then
						{
							if((_cursorTargetHelper distance player) > (_x select 1) select 2 || ((((_x select 1) select 3) select 0 && vehicle player == player) || (((_x select 1) select 3) select 1 && vehicle player != player)) || !(_cursorTargetHelper call ((_x select 1) select 4))) then
							{
								_cursorTargetHelper removeAction (_x select 0);
								_trackArrayHelper2 set [_counter, -1];
								_trackArrayHelper2 = _trackArrayHelper2 - [-1];
								_trackArrayHelper1 = _trackArrayHelper1 + [_x select 1];
							};
						};
					};
				};
				
				{
					_cursorTargetHelper removeAction _x;
				}forEach _arr;
				
			};
			sleep 0.3;
		}
		else
		{
			sleep 3;
		};
	};
	X39_XLib_var_ActionTracker_running = false;
};
X39_XLib_var_ActionTracker_running = true;