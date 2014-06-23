#include "ui.defs"

class X39_XLib_ui_keySelection {
	idd = 24486;
	onLoad = "uiNamespace setVariable['X39_XLib_ui_keySelection', _this select 0];";
	onUnload = "uiNamespace setVariable['X39_XLib_ui_keySelection', displayNull];";
	duration = 32000;
	fadeIn = 0;
	fadeOut = 0;
	enableSimulation = 1;
	
	class controls {
		class IGUIBack_2200: IGUIBack
		{
			idc = IDC_XLIB_KEYSELECTION_IGUIBACK_2200;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.384 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.27 * safezoneH;
			colorBackground[] = {0,0,0,0.4};
		};
		class label_title: X39_XLib_modProperties_RscText
		{
			idc = IDC_XLIB_KEYSELECTION_LABEL_TITLE;
			text = $STR_X39_XLib_ModProperties_keySelectionUi_label_title;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,1,1,1};
		};
		class label_keySelection: X39_XLib_modProperties_RscText
		{
			idc = IDC_XLIB_KEYSELECTION_LABEL_KEYSELECTION;
			text = $STR_X39_XLib_ModProperties_keySelectionUi_label_keySelection;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.402187 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,1,1,1};
		};
		class label_propertyName: X39_XLib_modProperties_RscText
		{
			idc = IDC_XLIB_KEYSELECTION_LABEL_PROPERTYNAME;
			text = $STR_X39_XLib_ModProperties_keySelectionUi_label_propertyName;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.402187 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,1,1,1};
		};
		class label_propertyNameDisplay: RscText
		{
			idc = IDC_XLIB_KEYSELECTION_LABEL_PROPERTYNAMEDISPLAY;
			text = "NA"; //--- ToDo: Localize;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.402187 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class btn_setAlt: RscButton
		{
			idc = IDC_XLIB_KEYSELECTION_BTN_SETALT;
			text = $STR_X39_XLib_ModProperties_keySelectionUi_btn_setAlt;
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class btn_setCtrl: RscButton
		{
			idc = IDC_XLIB_KEYSELECTION_BTN_SETCTRL;
			text = $STR_X39_XLib_ModProperties_keySelectionUi_btn_setCtrl;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class btn_setShift: RscButton
		{
			idc = IDC_XLIB_KEYSELECTION_BTN_SETSHIFT;
			text = $STR_X39_XLib_ModProperties_keySelectionUi_btn_setShift;
			x = 0.577344 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class label_currentButton: X39_XLib_modProperties_RscText
		{
			idc = IDC_XLIB_KEYSELECTION_LABEL_CURRENTBUTTON;
			text = $STR_X39_XLib_ModProperties_keySelectionUi_label_currentButton;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,1,1,1};
		};
		class label_currentButtonDisplay: RscText
		{
			idc = IDC_XLIB_KEYSELECTION_LABEL_CURRENTBUTTONDISPLAY;
			text = "NA"; //--- ToDo: Localize;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class label_currentButtonNumeric: X39_XLib_modProperties_RscText
		{
			idc = IDC_XLIB_KEYSELECTION_LABEL_CURRENTBUTTONNUMERIC;
			text = $STR_X39_XLib_ModProperties_keySelectionUi_label_currentButtonNumeric;
			x = 0.505157 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,1,1,1};
		};
		class label_currentButtonNumericDisplay: RscText
		{
			idc = IDC_XLIB_KEYSELECTION_LABEL_CURRENTBUTTONNUMERICDISPLAY;
			text = "NA"; //--- ToDo: Localize;
			x = 0.505157 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscButtonMenuOK_2600: RscButtonMenuOK
		{
			idc = IDC_XLIB_KEYSELECTION_RSCBUTTONMENUOK_2600;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.66 * safezoneH + safezoneY;
			w = 0.201094 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscButtonMenuCancel_2700: RscButtonMenuCancel
		{
			idc = IDC_XLIB_KEYSELECTION_RSCBUTTONMENUCANCEL_2700;
			x = 0.613437 * safezoneW + safezoneX;
			y = 0.66 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class btn_default: RscButtonMenu
		{
			text = $STR_X39_XLib_ModProperties_keySelectionUi_btn_default;
			idc = IDC_XLIB_KEYSELECTION_BTN_DEFAULT;
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.66 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};