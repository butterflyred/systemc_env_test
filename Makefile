PROJECT     = test
BUILDFLAGS  = -g3 -std=c++14 -Wuninitialized -Wno-deprecated-declarations
CXX         = g++
INCFLAGS    = -I./include -I${SYSTEMC_INC}
LDFLAGS     = -L${SYSTEMC_LIB} -lsystemc -lm -lpthread -lrt
SRC_CPPHEAD = createProcess
MAIN        = src/hello.cpp
OBJECTS     = $(SRC_CPPHEAD:=.o)
OBJ         = $(addprefix $(OBJ_DIR)/, $(OBJECTS))
OBJ_DIR     = ./obj
create-obj_dir	:=	$(shell test -d $(OBJ_DIR) || mkdir -p $(OBJ_DIR))
EXE = $(PROJECT)

all: $(EXE)

$(EXE): $(MAIN) $(OBJ) $(HEADERS)
	@echo "$@ building..."
	@$(CXX) $(INCFLAGS) $(BUILDFLAGS) $(MAIN) $(OBJ) $(LDFLAGS) -o $@
	@echo "$@ build done successfully..."

$(OBJ_DIR)/%.o:./src/%.cpp ./include/%.h
	@echo 'CXX $<'
	@$(CXX) $(INCFLAGS) $(BUILDFLAGS) -c $< -o $@

clean:
	rm -f $(EXE)
	rm -f test_offline
	rm -f *.o
	rm -f *.vcd
	rm -rf $(OBJ_DIR)
