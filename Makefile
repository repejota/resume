SOURCE=resume
DESTINATION=resume
BUILD_DIR=build
DIST_DIR=dist

# Build

all:		pdf
all:		## Build resume in all formats

prepare:
	@mkdir -p ${BUILD_DIR}
	@mkdir -p ${DIST_DIR}

pdf:		prepare
pdf:		## Build resume in PDF format
	@mkdir -p ${DIST_DIR}/pdf
	@pandoc ${SOURCE}.md \
		--verbose \
		--standalone \
		--output ${DIST_DIR}/pdf/${DESTINATION}.pdf

# Clean

clean:		## Delete generated intermediate files
	@rm -rf build

dist-clean: clean
dist-clean:	## Delete generated distribution files
	@rm -rf dist

include Makefile.help.mk
