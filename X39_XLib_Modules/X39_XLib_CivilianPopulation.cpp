class X39_XLib_CivilianPopulation: Module_F
{
	author = "X39|Cpt. HM Murdock";
	scope = 2; // Editor visibility; 2 will show it in the menu, 1 will hide it.
	displayName = "Civilian Population - Manager"; // Name displayed in the menu
	icon = "\X39_XLib_Modules\Res\CivilianModule_Manager"; // Map icon. Delete this entry to use the default icon
	category = "X39_XLib";
	side = 7;

	function = "X39_XLib_Modules_fnc_X39_XLib_CivilianModule";
	functionPriority = 1;
	isGlobal = 1;
	isPersistent = 1;
	isTriggerActivated = 0;
	isDisposable = 0;
	class Arguments
	{
		class MaxPlayer
		{
			displayName = "MaxCivilianPerPlayer";
			description = "How many civilians can a single player spawn at maximum";
			typeName = "NUMBER";
			defaultValue = 3;
		};
		class MaxTotal
		{
			displayName = "MaxCivilianByModule";
			description = "The absolute maximum of civilians all time (if this is reached, no civ. will spawn anymore till one despawns)";
			typeName = "NUMBER";
			defaultValue = 20;
		};
		class CivilianClasses
		{
			displayName = "MaxCivilianByModule";
			description = "The absolute maximum of civilians all time (if this is reached, no civ. will spawn anymore till one despawns)";
			typeName = "STRING";
			defaultValue = "['C_man_1', 'C_man_1_1_F, 'C_man_1_2_F, 'C_man_1_3_F, 'C_man_polo_1_F, 'C_man_polo_2_F, 'C_man_polo_3_F, 'C_man_polo_4_F, 'C_man_polo_5_F, 'C_man_polo_6_F, 'C_Orestes, 'C_Nikos, 'C_man_p_fugitive_F, 'C_man_p_fugitive_F_afro, 'C_man_p_fugitive_F_euro, 'C_man_p_fugitive_F_asia, 'C_man_p_beggar_F, 'C_man_p_beggar_F_afro, 'C_man_p_beggar_F_euro, 'C_man_p_beggar_F_asia, 'C_man_w_worker_F, 'C_man_hunter_1_F, 'C_man_p_shorts_1_F, 'C_man_p_shorts_1_F_afro']";
		};
		class AddFiredNearEventHandler
		{
			displayName = "Add FiredNear EH";
			description = "Could increase performance if turned off";
			typeName = "NUMBER";
			class values : ArgumentsBaseUnits
			{
				class opt_1	{name = "Yes"; value = 1; default = 1;};
				class opt_2	{name = "No"; value = 0; default = 0;};
			};
		};
	};
	class ModuleDescription: ModuleDescription
	{
		description = "Will spawn civilians dynamicly in a given range<br />Link with CP-Areal to get it working";	
		sync[] = {"arealModule"};	
		class arealModule
		{
			description = "Defines the used areas for the civilian population module";
			displayName = "Civilian Population - Areal";
			icon = "\X39_GM_Insurgency\Res\INS_3.paa";
			position = 1;
			direction = 0;
			optional = 1;
			duplicate = 1;
			side = 3;
		};
	};
};
class X39_XLib_CivilianPopulation: Module_F
{
	author = "X39|Cpt. HM Murdock";
	scope = 2; // Editor visibility; 2 will show it in the menu, 1 will hide it.
	displayName = "Civilian Population - Areal"; // Name displayed in the menu
	icon = "\X39_XLib_Modules\Res\CivilianModule_Areal"; // Map icon. Delete this entry to use the default icon
	category = "X39_XLib";
	side = 7;
	
	functionPriority = 1;
	isGlobal = 1;
	isPersistent = 1;
	isTriggerActivated = 0;
	isDisposable = 0;
	class Arguments
	{
		class SpawnRange
		{
			displayName = "Spawn Range";
			description = "Which distance should be checked each tick for buildings and roads to spawn civilians in";
			typeName = "NUMBER";
			defaultValue = 500;
		};
		class DespawnRange
		{
			displayName = "Despawn Range";
			description = "At which distance should the unit be despawned?";
			typeName = "NUMBER";
			defaultValue = 500;
		};
	};
	class ModuleDescription: ModuleDescription
	{
		description = "See 'Civilian Population - Manager'";	
};