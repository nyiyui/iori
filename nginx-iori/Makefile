all: logo.ico

logo.ico: logo.png
	convert logo.png -define icon:auto-resize=128,64,48,32,16 logo.ico

logo.png: logo.svg
	convert logo.svg -resize 128x128 logo.png

clean:
	rm -f logo.png logo.ico

.PHONY: build clean
