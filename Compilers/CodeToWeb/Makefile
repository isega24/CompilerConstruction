main: main.c
	gcc -o main main.c
main.c: main.l
	flex -o main.c -l main.l

all: main
	./main < example.cpp > example.html
	google-chrome example.html
