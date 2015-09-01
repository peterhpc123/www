SOURCE ?= getlantern.org

run:
	cd $(SOURCE) && cactus serve

build:
	cd $(SOURCE) && rm -rf .build build && cactus build && mv .build build

deploy: build
	cd $(SOURCE)/build && s3cmd sync -P --recursive . s3://getlantern.org
