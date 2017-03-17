
PYTHON = python
PANDOC = pandoc
PYLINT = pylint

EMAIL = "saidsef@gmail.com"
NAME = "cloudflare"

all: README.rst CHANGELOG.md

README.rst: README.md
	$(PANDOC) --from=markdown --to=rst < README.md > README.rst

CHANGELOG.md: FORCE
	cp /dev/null CHANGELOG.md
	echo '# Change Log' >> CHANGELOG.md
	echo '' >> CHANGELOG.md
	git log --date=iso-local --pretty=format:' - %ci [%h](https://github.com/saidsef/cloudflare/commit/%H) %s' >> CHANGELOG.md
	echo '' >> CHANGELOG.md

FORCE:

test: all
# to be done
