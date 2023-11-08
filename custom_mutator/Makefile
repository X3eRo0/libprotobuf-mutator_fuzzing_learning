TARGET=lpm_aflpp_custom_mutator_input
CXX=clang++-11
AFLCC=/opt/AFLplusplus/afl-gcc
PB_SRC=test.pb

PROTOBUF_DIR=/opt/libprotobuf-mutator/build/external.protobuf
PROTOBUF_LIB=$(PROTOBUF_DIR)/lib/libprotobufd.a

LPM_DIR=/opt/libprotobuf-mutator
LPM_LIB=$(LPM_DIR)/build/src/libprotobuf-mutator.so.0

INC=-I$(PROTOBUF_DIR)/include -I$(LPM_DIR)

all: $(PBSRC).cc $(TARGET).so vuln

$(PBSRC).cc: test.proto
	rm -rf ./genfiles 2>&1 > /dev/null
	mkdir ./genfiles 2>&1 > /dev/null
	protoc $^ --cpp_out=./genfiles


$(TARGET).so: $(TARGET).cc $(PBSRC).cc
	$(CXX) -fPIC -c $^ $(INC)
	$(CXX) -shared -Wall -O3 -o $@ *.o $(LPM_LIB) $(PROTOBUF_LIB)

vuln: vuln.c
	$(AFLCC) -o $@ $^

test_proto_serializer: test_proto_serializer.cc $(PBSRC)
	$(CXX) -o $@ $^ $(PROTOBUF_LIB) $(INC)

.PHONY: clean
clean: 
	rm *.so *.o vuln test_proto_serializer
