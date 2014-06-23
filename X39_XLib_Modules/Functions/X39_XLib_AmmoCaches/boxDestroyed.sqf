hint format["%1 from %2 AmmoCaches have been destroyed!", X39_XLib_Modules_var_X39_XLib_AmmoCaches_ammoCacheCountTarget - (count X39_XLib_Modules_var_X39_XLib_AmmoCaches_ammoCaches), X39_XLib_Modules_var_X39_XLib_AmmoCaches_ammoCacheCountTarget];
if(count X39_XLib_Modules_var_X39_XLib_AmmoCaches_ammoCaches == 0) then
{
	["end1"] call BIS_fnc_endMission;
};