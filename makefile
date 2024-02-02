CFLAGS= -Wall -pedantic -std=gnu99

all: filewatcher

filewatcher:
	gcc $(CFLAGS) 'pkg-config --cflags --libs libnotify' filewatcher.c -o build/filewatcherd