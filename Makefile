all: build

ssh_and_build:
	ssh popi "bash -c 'cd /data/www/vhdl_reference && make update_and_build'"

update_and_build:
	$(MAKE) git_pull
	$(MAKE) build

git_pull:
	git pull

build:
	mdbook build

clean:
	mdbook clean

.PHONY: all build clean
