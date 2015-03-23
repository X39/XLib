#include "\X39_XLib_Modules\default.hpp"
#define TICKSLEEP 1

_logic = _this select 0;
_value = _logic getVariable ["SpawnRange", -1];
if(_value == -1) exitWith { ["One or more parameters of the Civilian Population module are not configured correctly."] call BIS_fnc_halt; };
X39_XLib_Modules_var_X39_XLib_CivilianModule_SpawnRange = _value;

_value = _logic getVariable ["DespawnRange", -1];
if(_value == -1) exitWith { ["One or more parameters of the Civilian Population module are not configured correctly."] call BIS_fnc_halt; };
X39_XLib_Modules_var_X39_XLib_CivilianModule_DespawnRange = _value;

_value = _logic getVariable ["MaxPlayer", -1];
if(_value == -1) exitWith { ["One or more parameters of the Civilian Population module are not configured correctly."] call BIS_fnc_halt; };
X39_XLib_Modules_var_X39_XLib_CivilianModule_MaxPlayer = _value;

_value = _logic getVariable ["MaxTotal", -1];
if(_value == -1) exitWith { ["One or more parameters of the Civilian Population module are not configured correctly."] call BIS_fnc_halt; };
X39_XLib_Modules_var_X39_XLib_CivilianModule_MaxTotal = _value;

_value = _logic getVariable ["CivilianClasses", ""];
if(_value == "") exitWith { ["One or more parameters of the Civilian Population module are not configured correctly."] call BIS_fnc_halt; };
_value = call compile _value;
if(typeName _value != "ARRAY") exitWith { ["One or more parameters of the Civilian Population module are not configured correctly."] call BIS_fnc_halt; };
if({typeName _x == "STRING" || typeName _x == "TEXT"} count _value <= 0) exitWith { ["One or more parameters of the Civilian Population module are not configured correctly."] call BIS_fnc_halt; };
X39_XLib_Modules_var_X39_XLib_CivilianModule_CivilianClasses = _value;
X39_XLib_Modules_var_X39_XLib_CivilianModule_AddFiredNearEventHandler = (_logic getVariable ["AddFiredNearEventHandler", 0]) > 0;

X39_XLib_Modules_var_X39_XLib_CivilianCountLocal = 0;
X39_XLib_Modules_var_X39_XLib_CivilianCountGlobal = 0;
if(isServer) then
{
	X39_XLib_Modules_var_X39_XLib_CivilianGroup = createGroup CIVILIAN;
};

_logic spawn {
	waitUntil{!isNil "X39_XLib_Modules_var_X39_XLib_CivilianGroup"};
	_fnc_createUnit = {
		
	};
	_fnc_eh_firedNear = {
		
	};
//	_fnc_findNextWayPoint = {
//		
//	};
	while{true} do
	{
		_houses = nearestObjects [position player, ["house"], X39_XLib_Modules_var_X39_XLib_CivilianModule_SpawnRange];
		_buildingPos = [0,0,0];
		while {_buildingPos select 0 == 0 && _buildingPos select 1 == 0 && _buildingPos select 2 == 0} do
		{
			_house = _houses select (random count _houses);
			_buildingPos = _house buildingPos (3 + random 4);
		};
		
		_unit = [_buildingPos] call _fnc_createUnit;
		if(!isNull _unit) then
		{
			if(X39_XLib_Modules_var_X39_XLib_CivilianModule_AddFiredNearEventHandler) then { _unit addEventHandler["FiredNear", _fnc_eh_firedNear]; };
//			[_unit, 0] call _fnc_findNextWayPoint;
			
		};
		
		sleep TICKSLEEP;
	};
	[_logic] spawn X39_XLib_Modules_fnc_X39_XLib_CivilianModule;
};