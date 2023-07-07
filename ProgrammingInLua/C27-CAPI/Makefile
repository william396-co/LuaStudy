all: bare-bones stack

clean:
	rm -rf bare-bones stack

stack:
	gcc -o stack stack.c -llua -ldl -lm -Wall

bare-bones:
	gcc -o bare-bones bare-bones.c -llua -ldl -lm -Wall


