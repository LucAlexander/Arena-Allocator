CC=gcc
CCWIN=x86_64-w64-mingw32-gcc
CFLAGS=-lm -o
CDEBUGFLAGS=-Wall -g
OUT=arenarun
FILES=memarena.c memarena.h 
LNAME=libArenaAllocator.a

compile:
	$(CC) main.c $(FILES) $(CLIBS) $(CFLAGS) $(OUT) 
	
compile-windows:
	$(CCWIN) winmain.c $(FILES) $(CLIBSWIN) $(CLIBS) $(CFLAGS) $(OUT).exe

compile-linked:
	$(CC) main.c -L. -lArenaAllocator $(CLIBS) $(CFLAGS) $(OUT)

debug:
	$(CC) main.c $(FILES) $(CLIBS) $(CDEBUGFLAGS) $(CFLAGS) $(OUT)

debug-windows:
	$(CCWIN) winmain.c $(FILES) $(CLIBS) $(CDEBUGFLAGS) $(CFLAGS) $(OUT).exe

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
	rm -f $(OUT).exe
