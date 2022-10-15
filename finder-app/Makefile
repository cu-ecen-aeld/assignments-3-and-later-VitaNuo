default: writer

writer.o: writer.c
ifeq ($(CROSS_COMPILE),aarch64-none-linux-gnu-)
	aarch64-none-linux-gnu-gcc -c writer.c -o writer.o
else
	gcc -c writer.c -o writer.o
endif

writer: writer.o
ifeq ($(CROSS_COMPILE),aarch64-none-linux-gnu-)
	aarch64-none-linux-gnu-gcc writer.o -o writer
else
	gcc writer.o -o writer
endif

clean:
	-rm -f writer.o
	-rm -f writer
