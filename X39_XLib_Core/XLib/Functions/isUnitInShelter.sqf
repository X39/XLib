/**
 *	!FUNCTION IS NOT CALLSAFE!
 *	checks if a unit is inside of a BoundingBox of a house
 *
 *	@ParamsCount - 1
 *	@Param1 - OBJECT - unit to check
 *	@Return - BOOL - true if unit has shelter, false if not
 *	@Author - X39|Cpt. HM Murdock
 */
private["_unit", "_house", "_BB", "_BB1", "_BB2"];
_unit = _this select 0;
_house = nearestBuilding _unit;
_BB = boundingBoxReal _house;
_BB1 = _house modelToWorld (_BB select 0);
_BB2 = _house modelToWorld (_BB select 1);
(	(position _unit select 0 < _BB1 select 0 && position _unit select 01 < _BB1 select 1 && position _unit select 2 > _BB1 select 2) &&
	(position _unit select 0 > _BB2 select 0 && position _unit select 01 > _BB2 select 1 && position _unit select 2 < _BB2 select 2)	)