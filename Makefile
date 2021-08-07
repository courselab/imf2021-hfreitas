CC=gcc 
CFLAGS=-m32 -o
LDFLAGS=-Wl,-rpath=$(PWD) -L$(PWD) -lcypher
OUTPUT=decode


decode: decode.o dummy.o
	${CC} $< dummy.o ${LDFLAGS} ${CFLAGS} ${OUTPUT}

dummy.o: dummy.c
	${CC} -m32 $< -c
.PHONY: clean
clean:
	rm -f decode
