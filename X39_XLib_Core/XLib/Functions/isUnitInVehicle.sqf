/**
 *	!FUNCTION IS NOT CALLSAFE!
 *	checks if a unit is in a vehicle or not
 *	
 *	Call example: "player call X39_XLib_fnc_isUnitInVehicle"
 *
 *	@ParamsCount - 1
 *	@Param1 - OBJECT - unit to check
 *	@Return - BOOL - true if unit is inside of a vehicle, false if not
 *	@Author - X39|Cpt. HM Murdock
 */
private["_res"];
_res = true;
if(vehicle _this == _this) then
{
	_res = false;
};
_res