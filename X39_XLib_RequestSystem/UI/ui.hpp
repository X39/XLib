#include "ui.defs"
 
#ifndef GUI_GRID_H
        #define GUI_GRID_H (safezoneH * 0.0165)
#endif
 
 
 
class XLib_RequestSystem_Ui {
	idd = IDC_XLIB_ADUI_IDD;
	onLoad = "uiNamespace setVariable['XLib_RequestSystem_Ui', _this select 0];";
	onUnload = "uiNamespace setVariable['XLib_RequestSystem_Ui', displayNull];";
	duration = 32000;
	fadeIn = 0;
	fadeOut = 0;
	enableSimulation = 1;

	class controls
	{
		class IGUIBack_2202: IGUIBack
		{
			idc = IDC_XLIB_ADUI_IGUIBACK_2202;
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.038 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.132 * safezoneH;
			shown = false;
		};
		class RscText_1000: RscText
		{
			idc = IDC_XLIB_ADUI_RSCTEXT_1000;
			text = "Are you sure you want that?"; //--- ToDo: Localize;
			x = 0.402031 * safezoneW + safezoneX;
			y = 0.049 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.11 * safezoneH;
			colorText[] = {1,1,1,1};
			sizeEx = 1.2 * GUI_GRID_H;
		};
		class IGUIBack_2200: IGUIBack
		{
			idc = IDC_XLIB_ADUI_IGUIBACK_2200;
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.173 * safezoneH + safezoneY;
			w = 0.102125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class IGUIBack_2201: IGUIBack
		{
			idc = IDC_XLIB_ADUI_IGUIBACK_2201;
			x = 0.501 * safezoneW + safezoneX;
			y = 0.173 * safezoneH + safezoneY;
			w = 0.102125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscText_1001: RscText
		{
			idc = IDC_XLIB_ADUI_RSCTEXT_1001;
			text = "Yes [X]"; //--- ToDo: Localize;
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.173 * safezoneH + safezoneY;
			w = 0.102125 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0,1,0,1};
		};
		class RscText_1002: RscText
		{
			idc = IDC_XLIB_ADUI_RSCTEXT_1002;
			text = "No [CTRL+X]"; //--- ToDo: Localize;
			x = 0.501 * safezoneW + safezoneX;
			y = 0.173 * safezoneH + safezoneY;
			w = 0.102125 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,0,0,1};
		};
		class IGUIBack_2203: IGUIBack
		{
			idc = IDC_XLIB_ADUI_IGUIBACK_2203;
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.014 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscText_1003: RscText
		{
			idc = IDC_XLIB_ADUI_RSCTEXT_1003;
			text = "Pending Requests: 1"; //--- ToDo: Localize;
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.014 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.022 * safezoneH;
		};

	};
};