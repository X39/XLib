#include "\X39_XLib_Core\default.hpp"
/**
 *	Returns units direction as string (Example: NNE)
 *
 *	@ParamsCount 1
 *	@Param1 - OBJECT - Unit
 *	@Return - STRING - String containing the bearing
 *	@Author - X39|Cpt. HM Murdock
 */
private["_unit", "_dir"];
_unit = [_this, 0, objNull, [objNull, 0]] call BIS_fnc_param;
if(typeName _unit != "SCALAR") then
{
	if(isNull _unit) exitWith{_unit = 0;};
	_unit = ((eyeDirection _unit select 0) atan2 (eyeDirection _unit select 1)) % 360;
	if(_unit < 0) then
	{
		_unit = 360 + _unit;
	};
	
};
_dir = round ((_unit % 360) / (360 / 16));
if(_dir < 0) then
{
	_dir = _dir + 16;
};
if(_dir < 8) then
{
	if(_dir == 0) exitWith {"N"};
	if(_dir == 1) exitWith {"NNE"};
	if(_dir == 2) exitWith {"NE"};
	if(_dir == 3) exitWith {"ENE"};
	if(_dir == 4) exitWith {"E"};
	if(_dir == 5) exitWith {"ESE"};
	if(_dir == 6) exitWith {"SE"};
	if(_dir == 7) exitWith {"SSE"};
	""
}
else
{
	if(_dir == 8) exitWith {"S"};
	if(_dir == 9) exitWith {"SSW"};
	if(_dir == 10) exitWith {"SW"};
	if(_dir == 11) exitWith {"WSW"};
	if(_dir == 12) exitWith {"W"};
	if(_dir == 13) exitWith {"WNW"};
	if(_dir == 14) exitWith {"NW"};
	if(_dir == 15) exitWith {"NNW"};
	if(_dir == 16) exitWith {"N"};
	""
};