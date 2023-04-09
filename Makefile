src_files = $(filter-out fnl/config/macros.fnl, $(wildcard fnl/config/*.fnl))
src_files2 = $(wildcard fnl/config/plugins/*.fnl)
out_files = $(src_files:fnl/config/%.fnl=lua/config/%.lua)
out_files2 = $(src_files2:fnl/config/plugins/%.fnl=lua/config/plugins/%.lua)

all: compile compile2

compile: $(out_files)
compile2: $(out_files2)

lua/config/%.lua: fnl/config/%.fnl
	fennel --compile $< > $@

lua/config/plugins/%.lua: fnl/config/plugins/%.fnl
	fennel --compile $< > $@
