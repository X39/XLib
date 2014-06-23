#define return
#define assignVariableToNamespace(VAR,NAMESPACE,VALUE)	\
	if(isNil{NAMESPACE getVariable VAR}) then			\
	{													\
		NAMESPACE setVariable [VAR, VALUE];				\
	};
#define getNamespacePath(X) format["X39_XLib_EH_NS_%1", X]
#define getEventHandlersPath(X,Y) format["X39_XLib_EH_NS_%1_%2", X, Y]

#define printErrorMessage(X) diag_log format["X39_XLib_EH: '%1'", X];
//#define DEBUG

#ifndef DEBUG
	#define DEBUG_LOG(X) 
	#define DEBUG_CODE(X) 
#else
	#define DEBUG_LOG(X) diag_log (X);
	#define DEBUG_CODE(X) X;
#endif