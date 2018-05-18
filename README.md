# resume

My resume

## Requirements

* Pandoc
* LaTeX (for PDF rendering)

## Setup development environment

### For OSX:

First install pandoc and LaTeX support:

```
$ brew install pandoc
$ brek cask install basictex
```

## How to build

Execute `make help` to list all formats available:

```
$ make help
all:             Build resume in all formats
pdf:             Build resume in PDF format
clean:           Delete generated intermediate files
dist-clean:      Delete generated distribution files
help:            Show this help ( default )
````
