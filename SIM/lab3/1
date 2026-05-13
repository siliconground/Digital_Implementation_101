clean:
	rm -rf cds.lib hdl.var
	rm -rf *.log *.key *.shm
	rm -rf clk.lib
	rm -rf ./fulladd4.lib
set: clean
	touch ./cds.lib
	touch ./hdl.var
	chmod +x ./cds.lib
	chmod +x ./hdl.var
	mkdir ./fulladd4.lib
	echo "define fulladd4 ./fulladd4.lib" >> ./cds.lib
	echo "define WORK fulladd4" >> ./hdl.var

compile:
	xmvlog -MESS -linedebug ./*.v
	echo "compile finished!"
elab:
	xmelab -MESS -access rwc stimulus
	echo "elaboration finished!"
sim:
	xmsim -MESS stimulus -gui
	echo "simulation starts"
all: set compile elab sim
