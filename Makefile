all:
	@echo 'test'

test:
	python -m doctest -v colltools/*.py
	py.test tests \
		--cov colltools \
		--cov-report html \
		--cov-report term \
		--cov-fail-under=100
	pylint colltools
	mypy colltools
