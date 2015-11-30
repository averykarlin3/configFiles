all: push.o
	gcc push.o -o push
	mv push ../push

push: push.o
	gcc push.o -o push

push.o: push.c
	gcc push.c -c

clean:
	rm *.o
	rm push
