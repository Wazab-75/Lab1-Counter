#!/bin/sh

#clean up
rm -rf obj_dir
rm -f counter.vcd

# run Verilator to translate Veriolg to C++, including testbench
verilator -Wall --cc --trace counter.sv --exe counter_tb.cpp

# build C++ project via automatically generated Makefile
make -j -C obj_dir -f Vcounter.mk Vcounter

# run the simulation
obj_dir/Vcounter

#then you can run = source ./doit.sh