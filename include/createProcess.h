
#include <systemc.h>
SC_MODULE(createProcess){
    void process_name(void);
    SC_CTOR(createProcess){
        cout<<"CTOR, createProcess!"<<endl;
        SC_THREAD(process_name);
    }
};
