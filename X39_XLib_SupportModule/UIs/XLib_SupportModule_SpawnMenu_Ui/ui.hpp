#include "ui.defs"
#define GUI_GRID_H (safezoneH * 0.0165)



class XLib_SupportModule_SpawnMenu_Ui
{
	idd = IDC_XLIB_SPAWNMENU_IDD;
	onLoad = "uiNamespace setVariable['XLib_SupportModule_SpawnMenu_Ui', _this select 0];";
	onUnload = "uiNamespace setVariable['XLib_SupportModule_SpawnMenu_Ui', displayNull];";
	duration = 32000;
	fadeIn = 0;
	fadeOut = 0;
	enableSimulation = 1;
	author = "X39|Cpt. HM Murdock";
	class controls
	{
		class IGUIBack_2200: IGUIBack
		{
			idc = IDC_SPAWNMENU_IGUIBACK_2200;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.429 * safezoneH;
		};
		class label_category: RscText
		{
			idc = IDC_SPAWNMENU_LABEL_CATEGORY;
			text = "Category"; //--- ToDo: Localize;
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.190781 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0,0,0,1};
			colorBackground[] = {1,1,1,1};
		};
		class cb_category: RscCombo
		{
			idc = IDC_SPAWNMENU_CB_CATEGORY;
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.190781 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class lb_vehicles: RscListbox
		{
			idc = IDC_SPAWNMENU_LB_VEHICLES;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.391875 * safezoneW;
			h = 0.286 * safezoneH;
		};
		class label_vehicle: RscText
		{
			idc = IDC_SPAWNMENU_LABEL_VEHICLE;
			text = "Vehicle"; //--- ToDo: Localize;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.391875 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0,0,0,1};
			colorBackground[] = {1,1,1,1};
		};
		class btn_abort: RscButton
		{
			idc = IDC_SPAWNMENU_BTN_ABORT;
			text = "ABORT"; //--- ToDo: Localize;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class btn_clear: RscButton
		{
			idc = IDC_SPAWNMENU_BTN_CLEAR;
			text = "CLEAR"; //--- ToDo: Localize;
			x = 0.603125 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class btn_spawn: RscButton
		{
			idc = IDC_SPAWNMENU_BTN_SPAWN;
			text = "SPAWN"; //--- ToDo: Localize;
			x = 0.402031 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class label_spawnMenu: RscText
		{
			idc = IDC_SPAWNMENU_LABEL_SPAWNMENU;
			text = "Spawn Menu"; //--- ToDo: Localize;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0,0,0,1};
			colorBackground[] = {1,1,1,1};
		};
		class label_faction: RscText
		{
			idc = IDC_SPAWNMENU_LABEL_FACTION;
			text = "Faction"; //--- ToDo: Localize;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.190781 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0,0,0,1};
			colorBackground[] = {1,1,1,1};
		};
		class cb_faction: RscCombo
		{
			idc = IDC_SPAWNMENU_CB_FACTION;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.190781 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};