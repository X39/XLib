#include "\X39_XLib_Core\default.hpp"
/**
 *	!FUNCTION IS NOT CALLSAFE!
 *	adds a new entry to the action tracker
 * 
 *	ActionArray syntax:
 * [ClassName, [AddActionArray], MinDistance,  [AllowdInVehicle, AllowedOnFoot], {CustomCondition}]	
 * -ClassName = name of the class to track as string
 * -AddActionArray = Array to give later on the AddAction command ([title, filename, (arguments, priority, showWindow, hideOnUse, shortcut, condition)])
 * -RangeForTracking = numeric range to add this
 * -UseInVehicle:
 *	|	[true, true] = Allowed inside of vehicle and on foot
 *	|	[false, true] = Allowed only on foot
 *	|	[true, false] = Allowed only in vehicle
 * -Condition = Condition to add the action as code
 *	|			PLEASE REMEMBER! Conditions will consume runTime!
 *  |			_this will contain the following:
 *  |			_this = objectTheConditionWillBeUsedOn
 *
 * EXAMPLE:
 * ["ClassNameXYZ", ["doSomething", "path/to/file/nameOfFile.sqf"], 10, [false, true] {true}]
 *
 *	@Param1 - ARRAY - ActionArray
 *	@Return - NA
 *	@Author - X39|Cpt. HM Murdock
 */

X39_XLib_var_ActionTracker_TrackArray set[count X39_XLib_var_ActionTracker_TrackArray, _this];