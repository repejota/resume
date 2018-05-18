SOURCE=resume.md
BUILD_DIR=build
DIST_DIR=dist
DESTINATION=resume.pdf

# Build

all:		prepare html pdf 
all:		## Build resume in all formats

prepare:
	mkdir -p ${BUILD_DIR}
	
html: 		prepare	
html:		## Build HTML format
	pandoc --verbose \
		   --from markdown \
		   --to html \
		   --output ${BUILD_DIR}/resume.html \
		   ${SOURCE}
	mkdir -p ${DIST_DIR}/html/
	cp ${BUILD_DIR}/resume.html ${DIST_DIR}/html/resume.html

pdf: 		prepare html	
pdf:		## Build PDF format
	mkdir -p ${DIST_DIR}/pdf/
	pandoc ${BUILD_DIR}/resume.html -o ${DIST_DIR}/pdf/${DESTINATION}

# Clean

clean:		## Delete generated intermediate files
	rm -rf build

dist-clean: clean
dist-clean:	## Delete generated distribution files
	rm -rf dist

.PHONY: 	help
help:		## Show this help
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

.DEFAULT_GOAL := help
