#define assignVariable(X,Y) if(isNil {X})then{X = Y;};
#define return


//#define DEBUG

#ifndef DEBUG
	#define DEBUG_LOG(X) 
	#define DEBUG_CODE(X) 
	#define COMMA 
#else
	#define DEBUG_LOG(X) diag_log (X);
	#define DEBUG_CODE(X) X;
	#define COMMA ,
#endif