.PHONY: clean test

all: dist/download-station-kickass-search-module.dlm

dist/download-station-kickass-search-module.dlm:
	[ -d dist ] || mkdir dist
	tar -cvzf dist/download-station-kickass-search-module.dlm -C src .

vendor/composer.phar:
	[ -d vendor ] || mkdir vendor
	cd vendor && wget https://raw.githubusercontent.com/composer/getcomposer.org/master/web/installer -O - -q | php -- --quiet

vendor/bin/phpunit: vendor/composer.phar
	php vendor/composer.phar install

test: vendor/bin/phpunit
	vendor/bin/phpunit test

clean:
	rm -rf dist vendor
