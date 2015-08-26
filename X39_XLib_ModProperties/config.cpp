#ifndef GUI_GRID_H
	#define GUI_GRID_H (safezoneH * 0.0165)
#endif

class CfgPatches{
	class X39_XLib_ModProperties{
         units[] = {};
         weapons[] = {};
         requiredVersion = 1.0;
         requiredAddons[] = {"X39_XLib_Core"};
         author = "X39|Cpt. HM Murdock";
         mail = "killerx29@gmail.com";
	};
};
//custom config stuff
#include "modPropertiesBaseClass.cpp"

//display stuff
class RscStandardDisplay {
  class controls;
};
class RscMultiColumnListBox;
class RscPicture;
class IGUIBack;
class RscText;
class RscStructuredText;
class RscButton;
class RscCombo;
class RscEdit;
class RscSlider;
class RscListbox;
class RscButtonMenu;
class RscButtonMenuOK;
class RscButtonMenuCancel;
class RscListNBox;
class X39_XLib_modProperties_RscText: RscText
{
	colorText[] = {0,0,0,1};
	colorShadow[] = {0,0,0,0.5};
	colorBackground[] = {1,1,1,1};
	sizeEx = 1.4 * GUI_GRID_H;
};
#include "modPropertiesIncludes.hpp"

#include "UIs\escMenuHook\mainImport.hpp"

#include "UIs\ModConfigurationUi\ui.hpp"
#include "UIs\keySelectionUi\ui.hpp"
#include "UIs\valueEditingUi\ui.hpp"
#include "UIs\valueSelectionUi\ui.hpp"

//functions area
class X39_XLib_Function_TypeA;
class X39_XLib_Function_TypeB;
class X39_XLib_Function_TypeC;

class CfgFunctions {
	class X39_XLib
	{
		class Generic
		{
			class Generic_ModProperties_initMod:X39_XLib_Function_TypeB				{file = "\X39_XLib_ModProperties\Functions\initMod.sqf";};
			class Generic_ModProperties_getKey:X39_XLib_Function_TypeA				{file = "\X39_XLib_ModProperties\Functions\getKey.sqf";};
		};
		class ModProperties
		{
			class ModProperties_createDialog:X39_XLib_Function_TypeA				{file = "\X39_XLib_ModProperties\Functions\ModConfigurationUi\createDialog.sqf";};
			class ModProperties_updatePropertiesViewPort:X39_XLib_Function_TypeA	{file = "\X39_XLib_ModProperties\Functions\ModConfigurationUi\updatePropertiesViewPort.sqf";};
			class ModProperties_updateInfoViewPort:X39_XLib_Function_TypeA			{file = "\X39_XLib_ModProperties\Functions\ModConfigurationUi\updateInfoViewPort.sqf";};
			class ModProperties_mclbOnDoubleClick:X39_XLib_Function_TypeA			{file = "\X39_XLib_ModProperties\Functions\ModConfigurationUi\mclbOnDoubleClick.sqf";};
		};
		class valueEditingUi
		{
			class valueEditingUi_createDialog:X39_XLib_Function_TypeA				{file = "\X39_XLib_ModProperties\Functions\valueEditingUi\createDialog.sqf";};
		};
		class keySelectionUi
		{
			class keySelectionUi_createDialog:X39_XLib_Function_TypeA				{file = "\X39_XLib_ModProperties\Functions\keySelectionUi\createDialog.sqf";};
		};
		class valueSelectionUi
		{
			class valueSelectionUi_createDialog:X39_XLib_Function_TypeA				{file = "\X39_XLib_ModProperties\Functions\valueSelectionUi\createDialog.sqf";};
		};
	};
};