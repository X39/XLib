#include "ui.defs"
#define GUI_GRID_H (safezoneH * 0.0165)



class XLib_ReviveModule_Ui {
	idd = IDC_XLIB_REVIVEMODULE_IDD;
	onLoad = "uiNamespace setVariable['XLib_ReviveModule_Ui', _this select 0];";
	onUnload = "uiNamespace setVariable['XLib_ReviveModule_Ui', displayNull];";
	duration = 32000;
	fadeIn = 0;
	fadeOut = 0;
	enableSimulation = 1;
	author = "X39|Cpt. HM Murdock";
	class controls {
		class RscText_1000: RscText
		{
			idc = IDC_XLIB_REVIVEMODULE_UI_RSCTEXT_1000;
			text = "You are dead ..."; //--- ToDo: Localize;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {0.15,0.15,0.15,0.75};
		};
		class RscText_1001: RscText
		{
			idc = IDC_XLIB_REVIVEMODULE_UI_RSCTEXT_1001;
			text = "Time left: XXX"; //--- ToDo: Localize;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {0.15,0.15,0.15,0.75};
		};
		class RscText_1002: RscText
		{
			idc = IDC_XLIB_REVIVEMODULE_UI_RSCTEXT_1002;
			text = "<NAME> might can revive you"; //--- ToDo: Localize;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {0.15,0.15,0.15,0.75};
		};
		class RscText_1003: RscText
		{
			idc = IDC_XLIB_REVIVEMODULE_UI_RSCTEXT_1003;
			text = "Powered by: XLib - Revive module"; //--- ToDo: Localize;
			x = -0.000156274 * safezoneW + safezoneX;
			y = 0.00500001 * safezoneH + safezoneY;
			w = 1.00031 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscButton_1600: RscButton
		{
			idc = IDC_XLIB_REVIVEMODULE_UI_RSCBUTTON_1600;
			text = "Respawn"; //--- ToDo: Localize;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.066 * safezoneH;
			colorBackground[] = {0.15,0.15,0.15,0.75};
			colorActive[] = {0.2,0.2,0.2,0.75};
		};
	};
};