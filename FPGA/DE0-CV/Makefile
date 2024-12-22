.SUFFIXES: .sflp .sfl .h .v

SFLP = core.sflp Dithering_5to4.sflp Dithering_6to4.sflp Dithering_7to4.sflp Dithering_8to4.sflp
SFLS = $(SFLP:.sflp=.sfl)
HEAD = $(SFLP:.sflp=.h)
VLOG = $(SFLS:.sfl=.v)

MAKEFLAGS += --no-print-directory

sfl2vl:
	make sfl
	make vl
# VisualStudioŒü‚¯
	verilator --cc core.v -y ../ --Mdir obj_dir_msvc --compiler msvc --public --l2-name v
#	verilator --lint-only core.v -y ../
# gccŒü‚¯
#	verilator --cc core.v --exe dithering_sim.cpp -y ../
#	cd obj_dir; make -j -f Vcore.mk Vcore; ./core; cd ../
	# ok

sfl: $(SFLS)

vl: $(VLOG)

.sflp.sfl:
	sflp $<

.sfl.v:
	sfl2vl $< -O2

clean:
	rm -f $(SFLP:.sflp=.sfl) $(SFLP:.sflp=.h) $(SFLS:.sfl=.v)
