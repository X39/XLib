#define __mainImportHPP_addToClassTree(NAME) class NAME : RscStandardDisplay {\
	class controls: controls\
	{\
		class X39_XLib_escMenuHook :X39_XLib_escMenuHookBase{};\
	};\
};




class X39_XLib_escMenuHookBase: RscButtonMenu {
	idc = 1001;
	x = "1 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX)";
	y = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + safezoneH - ( ((safezoneW / safezoneH) min 1.2) / 1.2))";
	w = "15 * (((safezoneW / safezoneH) min 1.2) / 40)";
	h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	
	text = $STR_X39_XLib_ModProperties_escHook_DisplayText;
	tooltip = $STR_X39_XLib_ModProperties_escHook_Tooltip;
	action = "_res = [] spawn X39_XLib_fnc_ModProperties_createDialog;";
};
	
//__mainImportHPP_addToClassTree(RscDisplayMain)
__mainImportHPP_addToClassTree(RscDisplayInterrupt)
__mainImportHPP_addToClassTree(RscDisplayMPInterrupt)
__mainImportHPP_addToClassTree(RscDisplayInterruptEditor3D)
__mainImportHPP_addToClassTree(RscDisplayInterruptEditorPreview)