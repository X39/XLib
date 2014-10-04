class X39_XLib_ShowFactionNamesAndRank: Module_F
{
	author = "X39|Cpt. HM Murdock";
	scope = 2;
	displayName = "Display Name/Rank";
	icon = "\X39_XLib_Modules\Res\X39_XLib_ShowFactionNamesAndRank";
	category = "X39_XLib";
	side = 7;

	function = "X39_XLib_Modules_fnc_X39_XLib_ShowFactionNamesAndRank";
	functionPriority = 1;
	isGlobal = 1;
	isPersistent = 1;
	isTriggerActivated = 1;
	isDisposable = 0;
	
	//Zeus depending config stuff
	curatorCost = 0;
	scopeCurator = 2;
	
	class Arguments
	{
		class displayColor
		{
			displayName = "Color";
			description = "Sets how the color should be in the format: [Red,Green,Blue,Alpha]";
			typeName = "STRING";
			defaultValue = "[0, 0, 0, 0.5]";
		};
		class allowIntersectionCheck
		{
			displayName = "Allow Intersection check";
			description = "Adds some immersion to the game (default no because armas intersect command is kinda odd ...)";
			typeName = "NUMBER";
			class values : ArgumentsBaseUnits
			{
				class opt_1		{name = "yes"; value = 1; default = 0;};
				class opt_2		{name = "no"; value = 0; default = 1;};
			};
		};
		class showType
		{
			displayName = "Disallow areal display";
			description = "Only show rank/&name when directly looking at a faction unit";
			typeName = "NUMBER";
			class values : ArgumentsBaseUnits
			{
				class opt_1		{name = "yes"; value = 1; default = 0;};
				class opt_2		{name = "no"; value = 0; default = 1;};
			};
		};
		class showRank
		{
			displayName = "Show Rank";
			description = "Sets wether to display or not the rank";
			typeName = "NUMBER";
			class values : ArgumentsBaseUnits
			{
				class opt_1		{name = "yes"; value = 1; default = 1;};
				class opt_2		{name = "no"; value = 0; default = 0;};
			};
		};
		class allowRotatingRank
		{
			displayName = "Allow rotation of rank image";
			description = "Rotates the image (fake rotation using 'abs sin (time * 100)')";
			typeName = "NUMBER";
			class values : ArgumentsBaseUnits
			{
				class opt_1		{name = "yes"; value = 1; default = 1;};
				class opt_2		{name = "no"; value = 0; default = 0;};
			};
		};
		class nameDisplayRange
		{
			displayName = "Name display range";
			description = "Sets how far the name is visible (needs to be < rankDisplayRange)";
			typeName = "STRING";
			defaultValue = "50";
		};
		class rankDisplayRange
		{
			displayName = "Rank display range";
			description = "Sets how far the rank is visible (needs to be > nameDisplayRange)";
			typeName = "STRING";
			defaultValue = "100";
		};
	};
	class ModuleDescription: ModuleDescription
	{
		description = "Displays name (up to 50 meter) & rank (up to 100 meter) of any unit on the side of the player on the HUD";		
	};
};