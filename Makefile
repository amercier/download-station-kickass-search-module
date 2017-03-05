.PHONY: clean test test-dependencies
PHPUNIT = vendor/bin/phpunit

all: dist/download-station-kickass-search-module.dlm

dist/download-station-kickass-search-module.dlm:
	[ -d dist ] || mkdir dist
	tar -cvzf dist/download-station-kickass-search-module.dlm -C src .

vendor/composer.phar:
	[ -d vendor ] || mkdir vendor
	cd vendor && wget https://raw.githubusercontent.com/composer/getcomposer.org/master/web/installer -O - -q | php -- --quiet

vendor/bin/%: vendor/composer.phar
	php vendor/composer.phar install

test-dependencies: $(PHPUNIT)

test: $(PHPUNIT)
	$(PHPUNIT) test

clean:
	rm -rf dist vendor
