.SUFFIXES: .sflp .sfl .h .v

SFLP = core.sflp chatmask.sflp vga_ctrl.sflp seg7_ctrl.sflp GPU.sflp sin_table.sflp cos_table.sflp drawGouraud.sflp inv_table.sflp
SFLS = $(SFLP:.sflp=.sfl)
HEAD = $(SFLP:.sflp=.h)
VLOG = $(SFLS:.sfl=.v)

MAKEFLAGS += --no-print-directory

sfl2vl:
	make sfl
	make vl
# VisualStudioŒü‚¯
#	verilator --cc core.v --Mdir obj_dir_msvc --compiler msvc --public --l2-name v
	verilator --lint-only core.v
	# ok

sfl: $(SFLS)

vl: $(VLOG)

.sflp.sfl:
	sflp $< $@

.sfl.v:
	sfl2vl $< -O2

clean:
	rm -f $(SFLP:.sflp=.sfl) $(SFLP:.sflp=.h) $(SFLS:.sfl=.v)
