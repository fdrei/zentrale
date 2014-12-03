SHELL := /bin/bash

MODULES = node_modules
BUILD_DIR = build
APP_DIR = app
BIN = $(MODULES)/.bin
GULP = $(BIN)/gulp
COFFEE= $(BIN)/coffee

source_files := $(wildcard app/*.coffee)
build_files  := $(source_files:%.coffee=build/%.js)
app_bundle   := build/app.js

.PHONY: all clean test

all: install $(app_bundle)

$(app_bundle): $(build_files)
	cp app/index.html build/app

install: modules $(GULP)

build/%.js: %.coffee
	$(COFFEE) -co $(dir $@) $<

modules:
	npm install

$(GULP): modules
	$(GULP)

start: all
	$(BUILD_DIR)/Atom.app/Contents/MacOS/Atom $(BUILD_DIR)/app

clean:
	rm -rf $(MODULES) $(BUILD_DIR)
