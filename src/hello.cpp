#include "systemc.h"
#include "createProcess.h"
#include "hello.h"

// class hello : public sc_module{
// public:
//         hello(sc_module_name name) : sc_module(name){
//                 cout<<"Hello,SystemC!"<<endl;
//         }
// };

int sc_main(int argc,char** argv){
        createProcess* u_createProcess;
        u_createProcess= new createProcess("u_createProcess");
        hello h("hello");
        
        #define CLK_CYCLE (5.0)
	#define TIME_SCALE (SC_NS)
        sc_time clkprd(CLK_CYCLE, TIME_SCALE);
	sc_time clkdly(0, TIME_SCALE);
	sc_clock clock("clock", clkprd, 0.5, clkdly, true);
        
        sc_start(CLK_CYCLE*2, TIME_SCALE);
        
        return 0;
}
