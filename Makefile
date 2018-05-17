SOURCE=resume.md
BUILD_DIR=build
DIST_DIR=dist
DESTINATION=resume.pdf

# Build

build: prepare html pdf ## Build resume

prepare:
	mkdir -p ${BUILD_DIR} ${DIST_DIR}
	
html: prepare
	pandoc --section-divs -f markdown -t html5 -o ${BUILD_DIR}/resume.html ${SOURCE}

pdf: prepare html
	pandoc ${BUILD_DIR}/resume.html -o ${DIST_DIR}/${DESTINATION}

# Clean

clean:
	rm -rf build

dist-clean: clean
	rm -rf dist

.DEFAULT_GOAL := help
.PHONY: help
help:	## Show this help
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'
