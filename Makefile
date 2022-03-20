PYTHON_VERSION=3.9.2
PROJECT=spark-pandas-nb

VENV_NAME=${PROJECT}-pyenv
VENV_DIR=~/.pyenv/versions/${PYTHON_VERSION}/envs/${VENV_NAME}
PYTHON_BIN_DIR=${VENV_DIR}/bin
NOTEBOOK_CMD=${PYTHON_BIN_DIR}/jupyter notebook

PYTHON_EXEC=${PYTHON_BIN_DIR}/python
PIP_EXEC=${PYTHON_BIN_DIR}/pip
PIP_COMPILE_EXEC=${PYTHON_BIN_DIR}/pip-compile



check-python-dependencies:
	@echo "Checking for dependencies..."
	which pyenv || (echo "Please install: https://github.com/pyenv/pyenv" && exit 1)
	which pyenv-virtualenv || (echo "Please install: https://github.com/pyenv/pyenv-virtualenv" && exit 1)

create-virtualenv: check-python-dependencies
	@echo "Installing python and creating virtualenv..."
	pyenv install -s ${PYTHON_VERSION}
	pyenv virtualenv -f ${PYTHON_VERSION} ${VENV_NAME}
	${PIP_EXEC} install -U pip
	${PIP_EXEC} install pip-tools black

pip-compile:
	${PIP_COMPILE_EXEC} requirements/requirements.in --output-file requirements.txt

pip-compile-upgrade:
	${PIP_COMPILE_EXEC} -U requirements/requirements.in --output-file requirements.txt

pip-install:
	${PIP_EXEC} install -r requirements.txt

clean:
	pyenv uninstall -f ${VENV_NAME}

black:
	${BLACK_EXEC} .

black-check:
	${BLACK_EXEC} --check .

run-notebooks:
	${NOTEBOOK_CMD} notebooks
