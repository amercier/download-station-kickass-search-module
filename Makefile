.PHONY: clean

all: dist/download-station-kickass-search-module.dlm

dist/download-station-kickass-search-module.dlm: dist
	tar -cvzf dist/download-station-kickass-search-module.dlm -C src .

dist:
	mkdir dist

clean:
	rm -rf dist
