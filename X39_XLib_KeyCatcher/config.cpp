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
			class KeyCatcher_init:X39_XLib_Function_TypeB {file = "\X39_XLib_KeyCatcher\Functions\init.sqf";};
			class registerKey:X39_XLib_Function_TypeA {file = "\X39_XLib_KeyCatcher\Functions\registerKey.sqf";};
			class unregisterKey:X39_XLib_Function_TypeA {file = "\X39_XLib_KeyCatcher\Functions\unregisterKey.sqf";};
			class KeyCatcher_cb_KeyDown:X39_XLib_Function_TypeA {file = "\X39_XLib_KeyCatcher\Functions\cb_KeyDown.sqf";};
		};
	};
};