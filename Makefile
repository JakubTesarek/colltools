all:
	@echo 'test | clean'

test:
	python -m doctest -v colltools/*.py
	py.test tests \
		--cov colltools \
		--cov-report html \
		--cov-report term \
		--cov-fail-under=100
	pylint colltools
	mypy colltools

clean:
	rm -rf *.pyc __pycache__
	rm -rf colltools.egg-info build dist

build: clean
	python setup.py sdist bdist_wheel
