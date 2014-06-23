#include "ui.defs"

class X39_XLib_ui_valueSelection {
	idd = 24486;
	onLoad = "uiNamespace setVariable['X39_XLib_ui_valueSelection', _this select 0];";
	onUnload = "uiNamespace setVariable['X39_XLib_ui_valueSelection', displayNull];";
	duration = 32000;
	fadeIn = 0;
	fadeOut = 0;
	enableSimulation = 1;
	
	class controls {
		class IGUIBack_2200: IGUIBack
		{
			idc = IDC_XLIB_VALUESELECTION_IGUIBACK_2200;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.384 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.17 * safezoneH;
			colorBackground[] = {0,0,0,0.4};
		};
		class label_title: X39_XLib_modProperties_RscText
		{
			idc = IDC_XLIB_VALUESELECTION_LABEL_TITLE;
			text = $STR_X39_XLib_ModProperties_valueSelectionUi_label_title;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,1,1,1};
		};
		class label_value: X39_XLib_modProperties_RscText
		{
			idc = IDC_XLIB_VALUESELECTION_LABEL_VALUE;
			text = $STR_X39_XLib_ModProperties_valueSelectionUi_label_value;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.402187 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,1,1,1};
		};
		class label_propertyName: X39_XLib_modProperties_RscText
		{
			idc = IDC_XLIB_VALUESELECTION_LABEL_PROPERTYNAME;
			text = $STR_X39_XLib_ModProperties_valueSelectionUi_label_propertyName;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.402187 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,1,1,1};
		};
		class label_propertyNameDisplay: RscText
		{
			idc = IDC_XLIB_VALUESELECTION_LABEL_PROPERTYNAMEDISPLAY;
			text = "NA";
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.402187 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class cb_valueSelection: RscCombo
		{
			idc = IDC_XLIB_VALUESELECTION_CB_VALUESELECTION;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.402187 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscButtonMenuOK_2600: RscButtonMenuOK
		{
			idc = IDC_XLIB_VALUESELECTION_RSCBUTTONMENUOK_2600;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.561 * safezoneH + safezoneY;
			w = 0.201094 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscButtonMenuCancel_2700: RscButtonMenuCancel
		{
			idc = IDC_XLIB_VALUESELECTION_RSCBUTTONMENUCANCEL_2700;
			x = 0.613437 * safezoneW + safezoneX;
			y = 0.561 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class btn_default: RscButtonMenu
		{
			idc = IDC_XLIB_VALUESELECTION_BTN_DEFAULT;
			text = $STR_X39_XLib_ModProperties_valueSelectionUi_btn_default;
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.561 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};