SOURCE=resume
DESTINATION=resume
BUILD_DIR=build
DIST_DIR=dist

# Build

all:		html 
all:		## Build resume in all formats

prepare:
	@mkdir -p ${BUILD_DIR}

build:		prepare
	@pandoc --verbose \
		--from markdown \
		--to html \
		--output ${BUILD_DIR}/${DESTINATION}.html \
		${SOURCE}.md

html: 		build
html:		## Build standalone (one file) HTML format
	@echo "Standalone HTML version"
	@mkdir -p ${DIST_DIR}/html/
	@pandoc --verbose \
		--from markdown \
		--to html \
		--standalone \
		--output ${DIST_DIR}/html/${DESTINATION}.html \
		${SOURCE}.md
	@echo ${DIST_DIR}/html/${DESTINATION}.html

# Clean

clean:		## Delete generated intermediate files
	@rm -rf build

dist-clean: clean
dist-clean:	## Delete generated distribution files
	@rm -rf dist

.PHONY: 	help
help:		## Show this help ( default )
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

.DEFAULT_GOAL := help
