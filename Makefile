all: build

update_and_build:
	$(MAKE) git_pull
	$(MAKE) build

git_pull:
	git pull

build:
	mdbook build

clean:
	mdbook clean

.PHONY: all build clean update_and_build
