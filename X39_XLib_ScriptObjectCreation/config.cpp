class CfgPatches{
	class X39_XLib_ScriptObjectCreation{
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
class CfgFunctions 
{
	class X39_XLib
	{
		class ScriptObjectCreation
		{
			//OBJECT POOL
			//class ObjectPool_init:X39_XLib_Function_TypeB				{file = "\X39_XLib_ScriptObjectCreation\XLib\Functions\ObjectPool\init.sqf";};				//X39_XLib_fnc_ObjectPool_init
			class ObjectPool_addObject:X39_XLib_Function_TypeA			{file = "\X39_XLib_ScriptObjectCreation\XLib\Functions\ObjectPool\addObject.sqf";};			//X39_XLib_fnc_ObjectPool_addObject
			class ObjectPool_createObjectPool:X39_XLib_Function_TypeA	{file = "\X39_XLib_ScriptObjectCreation\XLib\Functions\ObjectPool\createObjectPool.sqf";};	//X39_XLib_fnc_ObjectPool_createObjectPool
			class ObjectPool_getObject:X39_XLib_Function_TypeA			{file = "\X39_XLib_ScriptObjectCreation\XLib\Functions\ObjectPool\getObject.sqf";};			//X39_XLib_fnc_ObjectPool_getObject
			class ObjectPool_removeObject:X39_XLib_Function_TypeA		{file = "\X39_XLib_ScriptObjectCreation\XLib\Functions\ObjectPool\removeObject.sqf";};		//X39_XLib_fnc_ObjectPool_removeObject
			class ObjectPool_countObjects:X39_XLib_Function_TypeA		{file = "\X39_XLib_ScriptObjectCreation\XLib\Functions\ObjectPool\countObjects.sqf";};		//X39_XLib_fnc_ObjectPool_countObjects
			class ObjectPool_getObjects:X39_XLib_Function_TypeA			{file = "\X39_XLib_ScriptObjectCreation\XLib\Functions\ObjectPool\getObjects.sqf";};			//X39_XLib_fnc_ObjectPool_getObjects
		};
	};
};