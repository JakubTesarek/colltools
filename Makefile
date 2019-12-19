proj_dir = colltools

all:
	@echo 'test | clean | build | doc'

test:
	python -m doctest -v $(proj_dir)/*.py
	py.test tests \
		--cov $(proj_dir) \
		--cov-report html \
		--cov-report term \
		--cov-fail-under=100
	pylint $(proj_dir)
	mypy $(proj_dir)

clean:
	rm -rf *.pyc __pycache__
	rm -rf $(proj_dir).egg-info build dist
	rm -rf .mypy_cache
	rm -rf .pytest_cache
	rm -rf htmlcov .coverage
	cd docs && $(MAKE) clean


build: clean
	python setup.py sdist bdist_wheel


doc:
	cd docs && $(MAKE) spelling
	cd docs && $(MAKE) html
