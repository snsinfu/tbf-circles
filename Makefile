PRODUCTS = archive/tbf05.json archive/tbf05.md
CHECKPOINTS = _pipenv.ok

.PHONY: all clean
.SUFFIXES: .want .json .md

all: $(CHECKPOINTS) $(PRODUCTS)
	@:

clean:
	pipenv --rm || :
	rm -f $(CHECKPOINTS)

.want.json:
	pipenv run python scrape_circle_info.py $$(cat $<) > $@ || rm $@

.json.md:
	pipenv run python format.py $< > $@ || rm $@

_pipenv.ok:
	pipenv install
	@touch $@
