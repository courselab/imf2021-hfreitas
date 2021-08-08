CC=gcc 
CFLAGS=-m32 -o
LDFLAGS=-Wl,-rpath=$(PWD) -L$(PWD) -lcypher
OUTPUT=decode


decode: decode.o change.o dummy.o
	${CC} $< change.o dummy.o ${LDFLAGS} ${CFLAGS} ${OUTPUT}

dummy.o: dummy.c
	${CC} -m32 $< -c

change.o: change.S
	as -32 $< -o $@

.PHONY: clean dist
clean:
	rm -f decode dummy.o change.o

dist: 
	tar zcvf decode.tgz Makefile dummy.c change.S decode.o libcypher.so
