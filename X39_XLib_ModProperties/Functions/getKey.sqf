#include "\X39_XLib_ModProperties\default.hpp"
/**
 *	automatically callen in preInit
 *	Initializes the internal variables
 *
 *	@ParamsCount 2
 *	@Param1 - STRING - Name of the properties baseclass you want to access
 *	@Param2 - STRING - Name of the propertie you want to get
 *	@Return - NA
 *	@Author - X39|Cpt. HM Murdock
 */
params[["_baseClass", "", [""]], "_propertie", "", [""]]
private "_value";
X39_XLib_var_ModProperties_getFunction = compile getText (configFile >> "XLib" >> "modProperties" >> _baseClass >> "getFunction");

_value = profileNamespace getVariable [_propertie, nil];
if(isNil "_value") then
{
	_value = [getText (_currentClass >> "variable")] call X39_XLib_var_ModProperties_getFunction;
};
_value