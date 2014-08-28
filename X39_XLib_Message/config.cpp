class CfgPatches{
	class X39_XLib_KeyCatcher{
         units[] = {};
         weapons[] = {};
         requiredVersion = 1.0;
         requiredAddons[] = {"X39_XLib_Core"};
         author = "X39|Cpt. HM Murdock";
         mail = "killerx29@gmail.com";
	};
};

class X39_XLib_Function_TypeA;
class X39_XLib_Function_TypeB;
class X39_XLib_Function_TypeC;
class X39_XLib_Function_TypeD;


class CfgFunctions{
	class X39_XLib {
		class X39_XLib_KeyCatcher{	
			class Message_init:X39_XLib_Function_TypeB {file = "\X39_XLib_Message\Functions\init.sqf";};		
			class Message_createDialog:X39_XLib_Function_TypeB {file = "\X39_XLib_Message\Functions\createDialog.sqf";};
						
		};
	};
};