#include "\X39_XLib_Modules\default.hpp"
if(!isServer) exitWith {};
_res = (_this select 0) spawn {
	private["_checkRate", "_checkRange", "_vehicleClass", "_createHelipad", "_modulePos", "_obj", "_units", "_lastObj", "_createMarker", "_markerstr"];
	_checkRate			= (_this getVariable "checkRate");
	_checkRange			= (_this getVariable "checkRange");
	_vehicleClass		= (_this getVariable "vehicleClass");
	_createHelipad		= (_this getVariable "createHelipad") call X39_XLib_fnc_IntToBool;
	_createMarker		= (_this getVariable "createMarker") call X39_XLib_fnc_IntToBool;
	_modulePos			= position _this;
	_lastObj			= objNull;
	
	if(_createHelipad) then
	{
		_obj = "Land_HelipadSquare_F" createVehicle _modulePos;
		_obj setDir direction _this;
	};
	if(_createMarker) then
	{
		_markerstr = createMarker [format["X39_XLib_Resupply_%1_%2", _modulePos, random 1000], _modulePos];
		_markerstr setMarkerShape "ICON";
		_markerstr setMarkerType "respawn_unknown";
	};
	while{true} do
	{
		DEBUG_CODE(_rand = random 10000; diag_log format["X39_XLib_Resupply: Starting new roll %1" COMMA _rand])
		_obj = _modulePos nearestObject _vehicleClass;
		if(isNull _obj) then
		{
			DEBUG_CODE(diag_log format["X39_XLib_Resupply: Roll %1 got no object" COMMA _rand])
			_lastObj = _obj;
		}
		else
		{
			DEBUG_CODE(diag_log format["X39_XLib_Resupply: Roll %1 got the following object: '%2'" COMMA _rand COMMA _obj])
			if(_obj distance _this < _checkRange && {_obj != _lastObj}) then
			{
				DEBUG_CODE(diag_log format["X39_XLib_Resupply: Rolls %1 object ('%2') is close enough for handle! Started Handle" COMMA _rand COMMA _obj])
				_lastObj = _obj;
				{[[_obj, "Servicing vehicle"], "X39_XLib_Modules_fnc_Helper_vehicleChat", _x, false] call BIS_fnc_MP; false} count (crew _obj);
				[[[_obj, 0], {(_this select 0) setFuel (_this select 1);}], "X39_XLib_Modules_fnc_Helper_execCode", _obj, false] call BIS_fnc_MP;
				{[[_obj, "Resupplying ammo ..."], "X39_XLib_Modules_fnc_Helper_vehicleChat", _x, false] call BIS_fnc_MP; false} count (crew _obj);
				sleep 1;
				
				[[[_obj, 0.25], {(_this select 0) setVehicleAmmo (_this select 1);}], "X39_XLib_Modules_fnc_Helper_execCode", _obj, false] call BIS_fnc_MP;
				{[[_obj, "Ammo: 25%"], "X39_XLib_Modules_fnc_Helper_vehicleChat", _x, false] call BIS_fnc_MP; false} count (crew _obj);
				sleep 3;
				
				[[[_obj, 0.5], {(_this select 0) setVehicleAmmo (_this select 1);}], "X39_XLib_Modules_fnc_Helper_execCode", _obj, false] call BIS_fnc_MP;
				{[[_obj, "Ammo: 50%"], "X39_XLib_Modules_fnc_Helper_vehicleChat", _x, false] call BIS_fnc_MP; false} count (crew _obj);
				sleep 3;
				
				[[[_obj, 0.75], {(_this select 0) setVehicleAmmo (_this select 1);}], "X39_XLib_Modules_fnc_Helper_execCode", _obj, false] call BIS_fnc_MP;
				{[[_obj, "Ammo: 75%"], "X39_XLib_Modules_fnc_Helper_vehicleChat", _x, false] call BIS_fnc_MP; false} count (crew _obj);
				sleep 3;
				
				[[[_obj, 1], {(_this select 0) setVehicleAmmo (_this select 1);}], "X39_XLib_Modules_fnc_Helper_execCode", _obj, false] call BIS_fnc_MP;
				{[[_obj, "Ammo: Done"], "X39_XLib_Modules_fnc_Helper_vehicleChat", _x, false] call BIS_fnc_MP; false} count (crew _obj);
				sleep 1;
				
				
				
				{[[_obj, "Refueling ..."], "X39_XLib_Modules_fnc_Helper_vehicleChat", _x, false] call BIS_fnc_MP; false} count (crew _obj);
				sleep 1;
				
				[[[_obj, 0.25], {(_this select 0) setFuel (_this select 1);}], "X39_XLib_Modules_fnc_Helper_execCode", _obj, false] call BIS_fnc_MP;
				{[[_obj, "Fuel: 25%"], "X39_XLib_Modules_fnc_Helper_vehicleChat", _x, false] call BIS_fnc_MP; false} count (crew _obj);
				sleep 3;
				
				[[[_obj, 0.50], {(_this select 0) setFuel (_this select 1);}], "X39_XLib_Modules_fnc_Helper_execCode", _obj, false] call BIS_fnc_MP;
				{[[_obj, "Fuel: 50%"], "X39_XLib_Modules_fnc_Helper_vehicleChat", _x, false] call BIS_fnc_MP; false} count (crew _obj);
				sleep 3;
				
				[[[_obj, 0.75], {(_this select 0) setFuel (_this select 1);}], "X39_XLib_Modules_fnc_Helper_execCode", _obj, false] call BIS_fnc_MP;
				{[[_obj, "Fuel: 75%"], "X39_XLib_Modules_fnc_Helper_vehicleChat", _x, false] call BIS_fnc_MP; false} count (crew _obj);
				sleep 3;
				
				[[[_obj, 1], {(_this select 0) setFuel (_this select 1);}], "X39_XLib_Modules_fnc_Helper_execCode", _obj, false] call BIS_fnc_MP;
				{[[_obj, "Fuel: Done"], "X39_XLib_Modules_fnc_Helper_vehicleChat", _x, false] call BIS_fnc_MP; false} count (crew _obj);
				sleep 1;
				
				{[[_obj, "Servicing finished!"], "X39_XLib_Modules_fnc_Helper_vehicleChat", _x, false] call BIS_fnc_MP; false} count (crew _obj);
			};
		};
		DEBUG_CODE(diag_log format["X39_XLib_Resupply: Terminating roll %1" COMMA _rand])
		sleep _checkRate;
	};
};
