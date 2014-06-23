#include "modPropertiesIncludes.hpp"

class XLib {
	class modProperties {
		class propertyBase {
			scope = 0;
			variable = "";
			display = "";
			image = "";
			type = -1;
			valueType = "";
			default[] = {};
			
			validationCode = "true";
			description = "NA";
			class values { };
		};
		class valueBase {
			scope = 0;
			display = "NA";
			displayShort = "";
			value = 1;
		};
		class modBase {
			scope = 0;
			name = "test";
			image = "";
			setFunction = "profileNamespace setVariable [_this select 0, _this select 1]";
			getFunction = "profileNamespace getVariable (_this select 0)";
			
			class properties { };
		};
		class XLib_Testing: modBase {
			scope = 2;
			name = "Powered by XLib";
			class properties {
			};
		};
	};
};