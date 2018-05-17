SOURCE=resume.md
BUILD_DIR=build
DIST_DIR=dist
DESTINATION=resume.pdf

# Build

all: prepare html pdf ## Build resume in all formats

prepare:
	mkdir -p ${BUILD_DIR}
	
html: prepare	## Build HTML format
	pandoc --section-divs -f markdown -t html5 -o ${BUILD_DIR}/resume.html ${SOURCE}
	mkdir -p ${DIST_DIR}/html/
	cp ${BUILD_DIR}/resume.html ${DIST_DIR}/html/resume.html

pdf: prepare html	## Build PDF format
	mkdir -p ${DIST_DIR}/pdf/
	pandoc ${BUILD_DIR}/resume.html -o ${DIST_DIR}/pdf/${DESTINATION}

# Clean

clean:
	rm -rf build

dist-clean: clean
	rm -rf dist

.DEFAULT_GOAL := help
.PHONY: help
help:	## Show this help
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'
