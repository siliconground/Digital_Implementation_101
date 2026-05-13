set log file counter_lec.log -replace
read library ../lib/slow_vdd1v0_basicCells.lib -liberty -both
read design ../rtl/counter.v -verilog -golden
read design ../syn/outputs/counter_netlist.v -verilog -revised
set system mode lec
add compare point -all
compare 


