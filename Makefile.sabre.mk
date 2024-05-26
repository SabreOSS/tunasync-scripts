DOCKER_IMAGE_NAME ?= sabre/gh-core-team/nix-tunasync
DOCKER_IMAGE_VERSION ?= 0.1.1

build-image:
	docker build -t "${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_VERSION}" -f dockerfiles/nix-channels-custom/Dockerfile .

upload-image:
	@ngp nexus docker upload "${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_VERSION}" "gh-core-team/nix-tunasync:${DOCKER_IMAGE_VERSION}"

all: build-image upload-image