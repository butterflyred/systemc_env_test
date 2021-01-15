
LIB_DIR=-L/usr/local/systemc-2.3.3/lib-linux64
INC_DIR=-I/usr/local/systemc-2.3.3/include
LIB=-lsystemc

APP=main
APP2=createProcess

all:
	g++ -std=c++11 -o $(APP) $(APP).cpp $(APP2).cpp $(LIB_DIR) $(INC_DIR) $(LIB)
clean:
	rm -rf $(APP)
