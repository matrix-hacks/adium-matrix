DEFAULT_BUILDCONFIGURATION=Debug

BUILDCONFIGURATION?=$(DEFAULT_BUILDCONFIGURATION)

DEFAULT_ADIUM_PLUGINS_DIR=$(HOME)/Library/Application\ Support/Adium\ 2.0/PlugIns
ADIUM_PLUGINS_DIR?=$(DEFAULT_ADIUM_PLUGINS_DIR)

build:
	xcodebuild -project AdiumMatrix.xcodeproj -configuration $(BUILDCONFIGURATION) build

clean:
	rm -rf ./build

install:
	rm -rf $(ADIUM_PLUGINS_DIR)/AdiumMatrix.AdiumLibpurplePlugin
	mkdir -p $(ADIUM_PLUGINS_DIR)
	cp -r ./build/$(BUILDCONFIGURATION)/AdiumMatrix.AdiumLibpurplePlugin $(ADIUM_PLUGINS_DIR)
	test -d $(ADIUM_PLUGINS_DIR)/AdiumMatrix.AdiumLibpurplePlugin

.PHONY: build clean install
