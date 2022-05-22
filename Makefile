CC=gcc
CFLAGS=-lm -o
CDEBUGFLAGS=-Wall -g
OUT=arenarun
FILES=memarena.c memarena.h 
LNAME=libArenaAllocator.a

compile:
	$(CC) main.c $(FILES) $(CLIBS) $(CFLAGS) $(OUT) 
debug:
	$(CC) main.c $(FILES) $(CLIBS) $(CDEBUGFLAGS) $(CFLAGS) $(OUT)

build:
	mkdir object
	$(CC) -c memarena.c -o ./object/memarena.o
	ar rcs $(LNAME) ./object/*.o

destruct:
	rm -rf ./object
	rm -rf $(LNAME)

rebuild:
	make destruct
	make build

clean:
	rm -f $(OUT)
