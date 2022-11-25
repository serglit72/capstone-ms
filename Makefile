setup:
	# Create python virtualenv & source it
	mkdir capstone
	python3 -m venv capstone/venv
	ls -la capstone/
	ls -la capstone/venv
	source capstone/venv/bin/activate
	ls -la capstone/venv

install:
	# This should be run from inside a virtualenv
	pip install --upgrade pip &&\
	pip install -r requirements.txt
	wget -O hadolint https://github.com/hadolint/hadolint/releases/download/v2.12.0/hadolint-Linux-x86_64 &&\
	chmod +x hadolint 
	ls -la capstone/venv
test:
	# Additional, optional, tests could go here
	ls -la ./tests/
	ls -la capstone/venv
	python3 -m pytest -vv ./tests/

lint:
	# See local hadolint install instructions:   https://github.com/hadolint/hadolint
	
	# This is linter for Dockerfiles
	hadolint Dockerfile
	# This is a linter for Python source code linter: https://www.pylint.org/
	# This should be run from inside a virtualenv
	pylint --disable=R,C,W1203,W1202 app.py

all: install lint test
