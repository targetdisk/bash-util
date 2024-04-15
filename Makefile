UNAME := $(shell uname)
ifeq ($(UNAME),Linux)
	OPEN=xdg-open
	PREFIX ?= /usr/local
else ifeq ($(UNAME),Darwin)
	OPEN=open
	PREFIX ?= $(HOME)/.local
else ifeq ($(OS),Windows_NT)
	OPEN=start
	PREFIX ?= /usr/local
else
	OPEN=xdg-open
	PREFIX ?= /usr/local
endif

INSTALL ?= install

HELPERS := $(wildcard *.bash)
DIST_HELPERS := $(foreach HELPER,$(HELPERS),dist/lib/bash-util/$(HELPER))
DIST_HELPER_LINKS := $(foreach HELPER,$(HELPERS),dist/bin/$(HELPER))

SCRIPTS := $(shell for fsname in $(wildcard scripts/*); \
		   do [ ! -d $$fsname ] && echo $$fsname || :; done)
DIST_SCRIPTS := $(foreach SCRIPT,$(SCRIPTS),dist/bin/$(shell basename $(SCRIPT)))

dist: dist/bin dist/lib/bash-util $(DIST_HELPERS) $(DIST_HELPER_LINKS) $(DIST_SCRIPTS) $(PREFIX)/bin/util

dist/bin:
	mkdir -pv $@

dist/bin/%.bash: %.bash
	ln -s ../lib/bash-util/$*.bash $@

dist/bin/%: scripts/% dist/bin
	sed 's/^\(.\s\+\)\("\)*.\+\/util\//\1\2$(shell \
		sed 's/\([$\/]\)/\\\1/g' <<<$(PREFIX))\/lib\/bash-util\//' < $< > $@
	chmod 755 $@

dist/lib/bash-util:
	mkdir -pv $@

dist/lib/bash-util/%.bash: %.bash
	cp $< $@
	chmod 644 $@

$(PREFIX)/bin/util:
	ln -s $(PREFIX)/lib/bash-util $(PREFIX)/bin/util

install: dist
	cd dist && \
		for each in *; \
			do cp -rv "$$each" "$(PREFIX)/$$each"; \
		done

clean:
	rm -rf dist

.PHONY: dist install README

### README #####################################################################

pub.css:
	wget https://github.com/manuelp/pandoc-stylesheet/raw/acac36b976966f76544176161ba826d519b6f40c/pub.css

# Requires Pandoc to be installed
README.html: README.md pub.css
	pandoc $< -s -c pub.css -o README.html
	$(OPEN) README.html

README: README.html
