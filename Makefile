.PHONY: help

IP := 0.0.0.0
PORT := 3030

help:
	@cat $(firstword $(MAKEFILE_LIST))

setup: \
	install \
	public

install: \
	node_modules

public:
	mkdir $@

node_modules:
	npm install

server:
	npx http-server -a $(IP) -p $(PORT) public

watch: $(shell find public)
	npx --no-install nodemon -L -V $(foreach f,$^,--watch $(f)) --exec "make server" || exit 1

clean:
	rm -rf public
	rm -rf node_modules
