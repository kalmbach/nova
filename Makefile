all: run

run: build
	clear && docker run -it --rm nova

build:
	docker build -t nova .
