ENV_NAME?=args-passing-reproducer
PYTHON_VERSION?=3.10

set-vars:
	conda run -n $(ENV_NAME) conda env \
		config vars set TOOL_PATH="$$(pwd)"

setup-env:
	conda create -y -n ${ENV_NAME} python=${PYTHON_VERSION}
	$(MAKE) set-vars

create-env:
	conda env create -y -f environment.yml
	$(MAKE) set-vars

list-packages:
	conda run -n $(ENV_NAME) conda list

export-env:
	conda run -n $(ENV_NAME) conda env export > environment.yml

remove-env:
	conda env remove -y --name $(ENV_NAME)