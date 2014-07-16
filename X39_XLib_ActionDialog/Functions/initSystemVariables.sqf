#include "\X39_XLib_ActionDialog\default.hpp"
#include "\X39_XLib_ActionDialog\ActionDialogV1.defs"
/*	
 *	sets the system variables values which later will be used in the actions
 *	
 *	@Param1 - BOOL - false if self, true if cursorTarget
 *	@Return - NA
 */
if(_this select 0) then
{
	X39_XLib_var_ActionDialog_Target = cursorTarget;
}
else
{
	X39_XLib_var_ActionDialog_Target = player;
};

X39_XLib_var_ActionDialog_Executor = player;
X39_XLib_var_ActionDialog_IsSelf = X39_XLib_var_ActionDialog_Executor == X39_XLib_var_ActionDialog_Target;
X39_XLib_var_ActionDialog_ExecutorInVehicle = vehicle X39_XLib_var_ActionDialog_Executor != X39_XLib_var_ActionDialog_Executor;