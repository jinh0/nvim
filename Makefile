src_files = $(wildcard fnl/config/*.fnl)
out_files = $(src_files:fnl/config/%.fnl=lua/config/%.lua)

compile: $(out_files)

lua/config/%.lua: fnl/config/%.fnl
	fennel --compile $< > $@
