all: build

build:
	mdbook build

clean:
	mdbook clean

.PHONY: all build clean
