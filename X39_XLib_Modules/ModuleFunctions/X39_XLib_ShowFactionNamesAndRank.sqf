//Please note that the reduntant coding here is done for performance reasons! If it wasnt done like this arma could lag more then it needs during the draw3D calls ...
//FONTSIZEBASE = 0.1; publicVariable "FONTSIZEBASE";X39_XLib_ShowFactionNamesAndRank_VAR_displayColor = [1,1,1,1]; publicVariable "X39_XLib_ShowFactionNamesAndRank_VAR_displayColor";
#define FONTSIZEBASE 0.1
#define SHOWRANK ((_this select 0) getVariable "showRank") call X39_XLib_fnc_scalarToBool
#define SHOWTYPE ((_this select 0) getVariable "showType") call X39_XLib_fnc_scalarToBool
#define ALLOWROTATINGRANK ((_this select 0) getVariable "allowRotatingRank") call X39_XLib_fnc_scalarToBool
#define ALLOWINTERSECTIONCHECK ((_this select 0) getVariable "allowIntersectionCheck") call X39_XLib_fnc_scalarToBool
#define ROTATIONSPEED 100

if(!isDedicated && hasInterface && isNil "X39_XLib_ShowFactionNamesAndRank_EH_Draw3D") then
{
	
	X39_XLib_ShowFactionNamesAndRank_VAR_displayColor = [] call compile ((_this select 0) getVariable "displayColor");
	X39_XLib_ShowFactionNamesAndRank_VAR_nameDisplayRange  = [] call compile ((_this select 0) getVariable ["nameDisplayRange", 50]);
	X39_XLib_ShowFactionNamesAndRank_VAR_rankDisplayRange  = [] call compile ((_this select 0) getVariable ["rankDisplayRange", 100]);
	if(ALLOWROTATINGRANK) then
	{
		if(SHOWTYPE) exitWith
		{
			if(SHOWRANK) then
			{
				X39_XLib_ShowFactionNamesAndRank_EH_Draw3D = addMissionEventHandler ["Draw3D", {
					_x = cursorTarget;
					if(isNull _x) exitWith {};
					if(_x distance player > X39_XLib_ShowFactionNamesAndRank_VAR_rankDisplayRange) exitWith {};
					if(side _x == playerSide) then
					{
						_dst = (cursorTarget distance player);
						_size = 1 - (_dst / X39_XLib_ShowFactionNamesAndRank_VAR_rankDisplayRange);
						_pos = position _x;
						_pos set[2, (_pos select 2) + 2.25];
						if(_dst < X39_XLib_ShowFactionNamesAndRank_VAR_nameDisplayRange) then
						{
							drawIcon3D [format["\A3\Ui_f\data\GUI\Cfg\Ranks\%1_gs.paa", rank _x], X39_XLib_ShowFactionNamesAndRank_VAR_displayColor, _pos, abs sin (time * ROTATIONSPEED) * _size, _size, 0, name _x, 0, FONTSIZEBASE * (_size * 0.5), "PuristaSemibold"];
						}
						else
						{
							drawIcon3D [format["\A3\Ui_f\data\GUI\Cfg\Ranks\%1_gs.paa", rank _x], X39_XLib_ShowFactionNamesAndRank_VAR_displayColor, _pos, abs sin (time * ROTATIONSPEED) * _size, _size, 0, "", 0, 0, "PuristaSemibold"];
						};
					};
					false
				}];
			}
			else
			{
				X39_XLib_ShowFactionNamesAndRank_EH_Draw3D = addMissionEventHandler ["Draw3D", {
					_x = cursorTarget;
					if(isNull _x) exitWith {};
					if(_x distance player > X39_XLib_ShowFactionNamesAndRank_VAR_nameDisplayRange) exitWith {};
					if(side _x == playerSide) then
					{
						_pos = position _x;
						_pos set[2, (_pos select 2) + 2.25];
						drawIcon3D ["", X39_XLib_ShowFactionNamesAndRank_VAR_displayColor, _pos, 0, 0, 0, name _x, 0, FONTSIZEBASE * (1 - ((_x distance player) / X39_XLib_ShowFactionNamesAndRank_VAR_rankDisplayRange) * 0.5), "PuristaSemibold"];
					};
					false
				}];
			};
		};
		if(ALLOWINTERSECTIONCHECK) then
		{
			if(SHOWRANK) then
			{
				X39_XLib_ShowFactionNamesAndRank_EH_Draw3D = addMissionEventHandler ["Draw3D", {
					_width = abs sin (time * ROTATIONSPEED);
					{
						if(side _x == playerSide) then
						{
							if(!lineIntersects[getPosAsl _x, getPosAsl player, _x, player]) then
							{
								_dst = (_x distance player);
								_size = 1 - (_dst / X39_XLib_ShowFactionNamesAndRank_VAR_rankDisplayRange);
								_pos = position _x;
								_pos set[2, (_pos select 2) + 2.25];
								if(_dst < X39_XLib_ShowFactionNamesAndRank_VAR_nameDisplayRange) then
								{
									drawIcon3D [format["\A3\Ui_f\data\GUI\Cfg\Ranks\%1_gs.paa", rank _x], X39_XLib_ShowFactionNamesAndRank_VAR_displayColor, _pos, _width * _size, _size, 0, name _x, 0, FONTSIZEBASE * (_size * 0.5), "PuristaSemibold"];
								}
								else
								{
									drawIcon3D [format["\A3\Ui_f\data\GUI\Cfg\Ranks\%1_gs.paa", rank _x], X39_XLib_ShowFactionNamesAndRank_VAR_displayColor, _pos, _width * _size, _size, 0, "", 0, 0, "PuristaSemibold"];
								};
							};
						};
						false
					}count nearestObjects[position player, ["CAManBase"], X39_XLib_ShowFactionNamesAndRank_VAR_rankDisplayRange];
				}];
			}
			else
			{
				X39_XLib_ShowFactionNamesAndRank_EH_Draw3D = addMissionEventHandler ["Draw3D", {
					{
						if(side _x == playerSide) then
						{
							if(!lineIntersects[getPosAsl _x, getPosAsl player, _x, player]) then
							{
								_pos = position _x;
								_pos set[2, (_pos select 2) + 2.25];
								drawIcon3D ["", X39_XLib_ShowFactionNamesAndRank_VAR_displayColor, _pos, 0, 0, 0, name _x, 0, FONTSIZEBASE * (1 - ((_x distance player) / X39_XLib_ShowFactionNamesAndRank_VAR_rankDisplayRange) * 0.5), "PuristaSemibold"];
							};
						};
						false
					}count nearestObjects[position player, ["CAManBase"], X39_XLib_ShowFactionNamesAndRank_VAR_nameDisplayRange];
				}];
			};
		}
		else
		{
			if(SHOWRANK) then
			{
				X39_XLib_ShowFactionNamesAndRank_EH_Draw3D = addMissionEventHandler ["Draw3D", {
					_width = abs sin (time * ROTATIONSPEED);
					{
						if(side _x == playerSide) then
						{
							_dst = (_x distance player);
							_size = 1 - (_dst / X39_XLib_ShowFactionNamesAndRank_VAR_rankDisplayRange);
							_pos = position _x;
							_pos set[2, (_pos select 2) + 2.25];
							if(_dst < X39_XLib_ShowFactionNamesAndRank_VAR_nameDisplayRange) then
							{
								drawIcon3D [format["\A3\Ui_f\data\GUI\Cfg\Ranks\%1_gs.paa", rank _x], X39_XLib_ShowFactionNamesAndRank_VAR_displayColor, _pos, _width * _size, _size, 0, name _x, 0, FONTSIZEBASE * (_size * 0.5), "PuristaSemibold"];
							}
							else
							{
								drawIcon3D [format["\A3\Ui_f\data\GUI\Cfg\Ranks\%1_gs.paa", rank _x], X39_XLib_ShowFactionNamesAndRank_VAR_displayColor, _pos, _width * _size, _size, 0, "", 0, 0, "PuristaSemibold"];
							};
						};
						false
					}count nearestObjects[position player, ["CAManBase"], X39_XLib_ShowFactionNamesAndRank_VAR_rankDisplayRange];
				}];
			}
			else
			{
				X39_XLib_ShowFactionNamesAndRank_EH_Draw3D = addMissionEventHandler ["Draw3D", {
					{
						if(side _x == playerSide) then
						{
							_pos = position _x;
							_pos set[2, (_pos select 2) + 2.25];
							drawIcon3D ["", X39_XLib_ShowFactionNamesAndRank_VAR_displayColor, _pos, 0, 0, 0, name _x, 0, FONTSIZEBASE * (1 - ((_x distance player) / X39_XLib_ShowFactionNamesAndRank_VAR_rankDisplayRange) * 0.5), "PuristaSemibold"];
						};
						false
					}count nearestObjects[position player, ["CAManBase"], X39_XLib_ShowFactionNamesAndRank_VAR_nameDisplayRange];
				}];
			};
		};
	}
	else
	{
		if(SHOWTYPE) exitWith
		{
			if(SHOWRANK) then
			{
				X39_XLib_ShowFactionNamesAndRank_EH_Draw3D = addMissionEventHandler ["Draw3D", {
					_x = cursorTarget;
					if(isNull _x) exitWith {};
					if(_x distance player > X39_XLib_ShowFactionNamesAndRank_VAR_rankDisplayRange) exitWith {};
					if(side _x == playerSide) then
					{
						_dst = (cursorTarget distance player);
						_size = 1 - (_dst / X39_XLib_ShowFactionNamesAndRank_VAR_rankDisplayRange);
						_pos = position _x;
						_pos set[2, (_pos select 2) + 2.25];
						if(_dst < X39_XLib_ShowFactionNamesAndRank_VAR_nameDisplayRange) then
						{
							drawIcon3D [format["\A3\Ui_f\data\GUI\Cfg\Ranks\%1_gs.paa", rank _x], X39_XLib_ShowFactionNamesAndRank_VAR_displayColor, _pos, _size, _size, 0, name _x, 0, FONTSIZEBASE * (_size * 0.5), "PuristaSemibold"];
						}
						else
						{
							drawIcon3D [format["\A3\Ui_f\data\GUI\Cfg\Ranks\%1_gs.paa", rank _x], X39_XLib_ShowFactionNamesAndRank_VAR_displayColor, _pos, _size, _size, 0, "", 0, 0, "PuristaSemibold"];
						};
					};
					false
				}];
			}
			else
			{
				X39_XLib_ShowFactionNamesAndRank_EH_Draw3D = addMissionEventHandler ["Draw3D", {
					_x = cursorTarget;
					if(isNull _x) exitWith {};
					if(_x distance player > X39_XLib_ShowFactionNamesAndRank_VAR_nameDisplayRange) exitWith {};
					if(side _x == playerSide) then
					{
						_pos = position _x;
						_pos set[2, (_pos select 2) + 2.25];
						drawIcon3D ["", X39_XLib_ShowFactionNamesAndRank_VAR_displayColor, _pos, 0, 0, 0, name _x, 0, FONTSIZEBASE * (1 - ((_x distance player) / X39_XLib_ShowFactionNamesAndRank_VAR_rankDisplayRange) * 0.5), "PuristaSemibold"];
					};
					false
				}];
			};
		};
		if(ALLOWINTERSECTIONCHECK) then
		{
			if(SHOWRANK) then
			{
				X39_XLib_ShowFactionNamesAndRank_EH_Draw3D = addMissionEventHandler ["Draw3D", {
					{
						if(side _x == playerSide) then
						{
							if(!lineIntersects[getPosAsl _x, getPosAsl player, _x, player]) then
							{
								_dst = (_x distance player);
								_size = 1 - (_dst / X39_XLib_ShowFactionNamesAndRank_VAR_rankDisplayRange);
								_pos = position _x;
								_pos set[2, (_pos select 2) + 2.25];
								if(_dst < X39_XLib_ShowFactionNamesAndRank_VAR_nameDisplayRange) then
								{
									drawIcon3D [format["\A3\Ui_f\data\GUI\Cfg\Ranks\%1_gs.paa", rank _x], X39_XLib_ShowFactionNamesAndRank_VAR_displayColor, _pos, _size, _size, 0, name _x, 0, FONTSIZEBASE * (_size * 0.5), "PuristaSemibold"];
								}
								else
								{
									drawIcon3D [format["\A3\Ui_f\data\GUI\Cfg\Ranks\%1_gs.paa", rank _x], X39_XLib_ShowFactionNamesAndRank_VAR_displayColor, _pos, _size, _size, 0, "", 0, 0, "PuristaSemibold"];
								};
							};
						};
						false
					}count nearestObjects[position player, ["CAManBase"], X39_XLib_ShowFactionNamesAndRank_VAR_rankDisplayRange];
				}];
			}
			else
			{
				X39_XLib_ShowFactionNamesAndRank_EH_Draw3D = addMissionEventHandler ["Draw3D", {
					{
						if(side _x == playerSide) then
						{
							if(!lineIntersects[getPosAsl _x, getPosAsl player, _x, player]) then
							{
								_pos = position _x;
								_pos set[2, (_pos select 2) + 2.25];
								drawIcon3D ["", X39_XLib_ShowFactionNamesAndRank_VAR_displayColor, _pos, 0, 0, 0, name _x, 0, FONTSIZEBASE * (1 - ((_x distance player) / X39_XLib_ShowFactionNamesAndRank_VAR_rankDisplayRange) * 0.5), "PuristaSemibold"];
							};
						};
						false
					}count nearestObjects[position player, ["CAManBase"], X39_XLib_ShowFactionNamesAndRank_VAR_nameDisplayRange];
				}];
			};
		}
		else
		{
			if(SHOWRANK) then
			{
				X39_XLib_ShowFactionNamesAndRank_EH_Draw3D = addMissionEventHandler ["Draw3D", {
					{
						if(side _x == playerSide) then
						{
							_dst = (_x distance player);
							_size = 1 - (_dst / X39_XLib_ShowFactionNamesAndRank_VAR_rankDisplayRange);
							_pos = position _x;
							_pos set[2, (_pos select 2) + 2.25];
							if(_dst < X39_XLib_ShowFactionNamesAndRank_VAR_nameDisplayRange) then
							{
								drawIcon3D [format["\A3\Ui_f\data\GUI\Cfg\Ranks\%1_gs.paa", rank _x], X39_XLib_ShowFactionNamesAndRank_VAR_displayColor, _pos, _size, _size, 0, name _x, 0, FONTSIZEBASE * (_size * 0.5), "PuristaSemibold"];
							}
							else
							{
								drawIcon3D [format["\A3\Ui_f\data\GUI\Cfg\Ranks\%1_gs.paa", rank _x], X39_XLib_ShowFactionNamesAndRank_VAR_displayColor, _pos, _size, _size, 0, "", 0, 0, "PuristaSemibold"];
							};
						};
						false
					}count nearestObjects[position player, ["CAManBase"], X39_XLib_ShowFactionNamesAndRank_VAR_rankDisplayRange];
				}];
			}
			else
			{
				X39_XLib_ShowFactionNamesAndRank_EH_Draw3D = addMissionEventHandler ["Draw3D", {
					{
						if(side _x == playerSide) then
						{
							_pos = position _x;
							_pos set[2, (_pos select 2) + 2.25];
							drawIcon3D ["", X39_XLib_ShowFactionNamesAndRank_VAR_displayColor, _pos, 0, 0, 0, name _x, 0, FONTSIZEBASE * (1 - ((_x distance player) / X39_XLib_ShowFactionNamesAndRank_VAR_rankDisplayRange) * 0.5), "PuristaSemibold"];
						};
						false
					}count nearestObjects[position player, ["CAManBase"], X39_XLib_ShowFactionNamesAndRank_VAR_nameDisplayRange];
				}];
			};
		};
	};
};