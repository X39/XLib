/**
 *	!FUNCTION IS NOT CALLSAFE!
 *	Executes !SMALL! commands automatically local to given unit
 *
 *	@ParamsCount - 1
 *	@Param1 - OBJECT - unit
 *	@Param2 - STRING - Code to be executed
 *	@Param3 - ARRAY - Arguments
 *	@Author - X39|Cpt. HM Murdock
 */
if(!local (_this select 0)) exitWith {[_this, _fnc_scriptName, _this select 0, false] spawn BIS_fnc_MP;};
(_this select 2) call compile (_this select 1);