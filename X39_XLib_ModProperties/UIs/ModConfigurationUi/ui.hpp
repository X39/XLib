#include "ui.defs"
class X39_XLib_ui_modProperties {
	idd = 24485;
	onLoad = "uiNamespace setVariable['X39_XLib_ui_modProperties', _this select 0];";
	onUnload = "uiNamespace setVariable['X39_XLib_ui_modProperties', displayNull];";
	duration = 32000;
	fadeIn = 0;
	fadeOut = 0;
	enableSimulation = 1;
	
	class controls {
		
		class IGUIBack_2200: IGUIBack
		{
			idc = IDC_XLIB_MODCONFIGURATION_IGUIBACK_2200;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.027 * safezoneH + safezoneY;
			w = 0.598125 * safezoneW;
			h = 0.759 * safezoneH;
			colorBackground[] = {0,0,0,0.4};
		};
		class IGUIBack_2201: IGUIBack
		{
			idc = IDC_XLIB_MODCONFIGURATION_IGUIBACK_2201;
			x = 0.102969 * safezoneW + safezoneX;
			y = 0.027 * safezoneH + safezoneY;
			w = 0.190781 * safezoneW;
			h = 0.902 * safezoneH;
			colorBackground[] = {0,0,0,0.4};
		};
		class IGUIBack_2202: IGUIBack
		{
			idc = IDC_XLIB_MODCONFIGURATION_IGUIBACK_2202;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.797 * safezoneH + safezoneY;
			w = 0.598125 * safezoneW;
			h = 0.176 * safezoneH;
			colorBackground[] = {0,0,0,0.4};
		};
		class label_selection: X39_XLib_modProperties_RscText
		{
			idc = IDC_XLIB_MODCONFIGURATION_LABEL_SELECTION;
			text = $STR_X39_XLib_ModProperties_modPropertiesUi_labelSelectionText;
			x = 0.108125 * safezoneW + safezoneX;
			y = 0.038 * safezoneH + safezoneY;
			w = 0.180469 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscText_1001: X39_XLib_modProperties_RscText
		{
			idc = IDC_XLIB_MODCONFIGURATION_RSCTEXT_1001;
			text = $STR_X39_XLib_ModProperties_modPropertiesUi_labelConfigurationText;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.038 * safezoneH + safezoneY;
			w = 0.587812 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class lb_selection: RscListbox
		{
			idc = IDC_XLIB_MODCONFIGURATION_LB_SELECTION;
			x = 0.108125 * safezoneW + safezoneX;
			y = 0.071 * safezoneH + safezoneY;
			w = 0.180469 * safezoneW;
			h = 0.847 * safezoneH;
		};
		class mclb_configuration : RscListNBox
		{
			idc = IDC_XLIB_MODCONFIGURATION_MCLB_CONFIGURATION;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.071 * safezoneH + safezoneY;
			w = 0.587812 * safezoneW;
			h = 0.704 * safezoneH;
			// number of columns used, and their left positions
			// if using side buttons, space has to be reserved for those,
			// at a width of roughly 120% of rowHeight
			columns[] = {0, 0.1, 0.75};
			colorBackground[] = {0,0,0,0.4};
			// height of each row
			rowHeight = 0.05;
			sizeEx = 1.4 * GUI_GRID_H;
			drawSideArrows = 0;
			toolTip = "";
			onMouseButtonDblClick = "[] call X39_XLib_fnc_ModProperties_mclbOnDoubleClick";
		};
		class label_selectionInfo: X39_XLib_modProperties_RscText
		{
			idc = IDC_XLIB_MODCONFIGURATION_LABEL_SELECTIONINFO;
			text = $STR_X39_XLib_ModProperties_modPropertiesUi_labelConfigurationSelectionInfoText;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.808 * safezoneH + safezoneY;
			w = 0.587812 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class text_selectionInfo: RscStructuredText
		{
			idc = IDC_XLIB_MODCONFIGURATION_TEXT_SELECTIONINFO;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.841 * safezoneH + safezoneY;
			w = 0.587812 * safezoneW;
			h = 0.121 * safezoneH;
			sizeEx = 1.4 * GUI_GRID_H;
		};
		class btn_saveProfileNameSpace: RscButtonMenu
		{
			idc = IDC_XLIB_MODCONFIGURATION_BTN_SAVEPROFILENAMESPACE;
			text = $STR_X39_XLib_ModProperties_modPropertiesUi_btnSaveProfileNameSpace;
			action = "saveProfileNamespace";
			x = 0.102969 * safezoneW + safezoneX;
			y = 0.94 * safezoneH + safezoneY;
			w = 0.190781 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};
};