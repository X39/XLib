_obj = [_this, 0, objnull, [objnull]] call BIS_fnc_param;
_obj addAction [localize "STR_A3_BIS_fnc_initIntelObject_take", {
		deleteVehicle (_this select 0);
		_caller = _this select 1;
		//_cache = X39_XLib_Modules_var_X39_XLib_AmmoCaches_ammoCaches select floor random (count X39_XLib_Modules_var_X39_XLib_AmmoCaches_ammoCaches);
		
		_smallestDistance = player distance (X39_XLib_Modules_var_X39_XLib_AmmoCaches_ammoCaches select 0);
		_cache = objNull;
		{
			if(player distance _x < _smallestDistance) then
			{
				_smallestDistance = player distance _x;
				_cache = _x;
			};
			false
		}count X39_XLib_Modules_var_X39_XLib_AmmoCaches_ammoCaches;
		_markers = _cache getVariable["X39_XLib_Modules_var_X39_XLib_AmmoCaches_markers", []];
		_i = count _markers;
		
		if(_i >= count X39_XLib_Modules_var_X39_XLib_AmmoCaches_MarkerDistances) then
		{
			_i = (count X39_XLib_Modules_var_X39_XLib_AmmoCaches_MarkerDistances) - 1;
		};
		
		_distance = X39_XLib_Modules_var_X39_XLib_AmmoCaches_MarkerDistances select _i;
		_marker = createMarker [format["%1%2", position _cache, count _markers], [((((random (_distance / 2)) + (_distance / 2)) - (_distance / 2)) * 2) * (if(floor random 2 == 0) then { -1 } else { 1 }) + (position _cache select 0), ((((random (_distance / 2)) + (_distance / 2)) - (_distance / 2)) * 2) * (if(floor random 2 == 0) then { -1 } else { 1 }) + (position _cache select 1)]];
		_marker setMarkerShape "ICON";
		_marker setMarkerType "mil_unknown";
		_marker setMarkerSize [0.5 , 0.5];
		_marker setMarkerColor "ColorRed";
		_marker setMarkerAlpha 1;
		_marker setMarkerText str _distance;
		_markers set[count _markers, _marker];
		_cache setVariable["X39_XLib_Modules_var_X39_XLib_AmmoCaches_markers", _markers, true];
	}];
//_obj spawn {sleep 300; if(!isNull _this) then {deleteVehicle _this};};