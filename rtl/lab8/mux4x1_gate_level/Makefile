clean: 
	rm -rf cds.lib hdl.var *.lib waves.shm *.log *.key
set: 
	touch cds.lib hdl.var
	mkdir mux.lib
	echo "define mux_lib ./mux.lib" >> ./cds.lib
	echo "define WORK mux_lib" >> ./hdl.var
compile:
	xmvlog -MESS ./*v
elab:
	xmelab -MESS -access rwc mux_4_to_1_gate
	xmelab -MESS -access rwc tb_mux_4_to_1

sim:
	xmsim -MESS tb_mux_4_to_1


all: clean set compile elab sim
