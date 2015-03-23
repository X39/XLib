/**
 *	checks if a unit is in an open area (terrain)
 *	!WARNING!
 *	As this function requires calls of terrainIntersect it is time intensive!
 *	([player, 15, 2.5] ~ 0.26s on AMD Phenom II X6 1090T BlackEdition)
 *
 *	@ParamsCount - 1
 *	@Param1 - OBJECT - unit to check
 *	@Param2 - SCALAR - Optional range
 *	@Param3 - SCALAR - Optional height offset
 *	@Return - BOOL - true if unit is in the open or false when not
 *	@Author - X39|Cpt. HM Murdock
 */
private["_unit", "_range", "_height", "_posX", "_posY", "_posZ", "_flag"];
_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_range = [_this, 1, 30, [0]] call BIS_fnc_param;
_height = [_this, 2, 2.5, [0]] call BIS_fnc_param;
if(isNull _unit) exitWith {diag_log "_unit is null!";};

_posX = (getPosAsl _unit) select 0;
_posY = (getPosAsl _unit) select 1;
_posZ = (getPosAsl _unit) select 2;
_flag = true;
if(	 terrainIntersectASL [[_posX + _range, _posY + _range, _posZ + _height], [_posX - _range, _posY - _range, _posZ + _height]] ||
	{terrainIntersectASL [[_posX - _range, _posY + _range, _posZ + _height], [_posX + _range, _posY - _range, _posZ + _height]] ||
	{terrainIntersectASL [[_posX + _range, _posY + _range, _posZ + _height], [_posX + _range, _posY - _range, _posZ + _height]] ||
	{terrainIntersectASL [[_posX + _range, _posY + _range, _posZ + _height], [_posX - _range, _posY + _range, _posZ + _height]] ||
	{terrainIntersectASL [[_posX - _range, _posY - _range, _posZ + _height], [_posX - _range, _posY + _range, _posZ + _height]] ||
	{terrainIntersectASL [[_posX - _range, _posY - _range, _posZ + _height], [_posX + _range, _posY - _range, _posZ + _height]]}}}}})
then
{
	_flag = false;
};
_flag