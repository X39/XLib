#include "\X39_XLib_Core\default.hpp"
/**
 *	Removes all dead units from current mission upon call
 *
 *	@ParamsCount 0
 *	@Return - NA
 *	@Author - X39|Cpt. HM Murdock
 */
{
	deleteVehicle _x;
	false
}count allDead;
{
	if(count units _x <= 0) then
	{
		deleteGroup _x;
	};
	false
}count allGroups;