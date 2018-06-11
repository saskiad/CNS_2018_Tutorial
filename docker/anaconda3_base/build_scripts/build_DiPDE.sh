#!/bin/bash

USE_CONDA=true
CONDA_ENV=''
BUILD_PATH=/home/build
INSTALL_PATH=/home/shared

# Check scripts options
while [[ $# -gt 0 ]]; do
	case "$1" in
		--no-conda) USE_CONDA=false ;;
		-e|--conda-env) CONDA_ENV=$2; shift ;;
		-b|--build-path) BUILD_PATH=$2; shift ;;
		-i|"--install-path") INSTALL_PATH=$2; shift ;;
	esac
	shift
done

# activate conda environment if specified
if [[ ! -z ${CONDA_ENV} ]]; then
	source activate ${CONDA_ENV}
fi

if [[ ${USE_CONDA}=true ]]; then
	# install using conda
	conda install -y -c nicholasc dipde=0.2.1=py36_3
else
	# TODO: get and build latest version of Dipde from source
	echo "ERROR: At the moment DiPDE can only be installed through conda"
	exit 1
fi
