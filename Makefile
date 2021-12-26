all: crack

crack: crack.o
	ld -T crack.ld -o crack crack.o

crack.o: crack.s
	as -o crack.o crack.s

.PHONY:
clean:
	rm crack.o crack
