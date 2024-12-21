.PHONY: build test typecheck clean examples

build:
	poetry install

test:
	python -c "import aa_client"
	pytest -s -vv tests/test_requestqueue.py

test-integration:
	pytest -v tests/test_client.py

test-examples:
	cd examples; pytest -v *.py
	cd examples; yes | python3 load_dataframe.py
	cd examples; python3 working_hours.py 'activitywatch|aa-|github.com' fakedata

lint:
	ruff check .

lint-fix:
	ruff check --fix .

typecheck:
	poetry run mypy

format:
	ruff format .

clean:
	rm -rf build dist
	rm -rf aa_client/__pycache__
