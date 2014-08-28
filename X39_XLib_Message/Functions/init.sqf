#include "\X39_XLib_Message\default.hpp"
/*
		
 	@Return - N/A
 	@Author - Phyma
 */
 
if (isNull "X39_XLib_Message_isRunning") then {
	assignValue(X39_XLib_Message_isRunning,false);
};

if (isNull "X39_XLib_Message_Accepted") then {
	assignValue(X39_XLib_Message_Accepted,false);
};