clean: 
	rm -rf cds.lib hdl.var *.lib waves.shm *.log *.key *.d xrun.*
set: 
	touch cds.lib hdl.var
	mkdir worklib
	echo "define worklib ./worklib" >> ./cds.lib
	echo "define WORK worklib" >> ./hdl.var
compile: 
	xmvlog -MESS ./*v
elab: 
	xmelab -MESS -access rwc ./*.v

sim: 
	xmsim -MESS tb_reg -gui


all: clean set compile elab sim
