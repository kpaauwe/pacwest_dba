

G = g++-4.9# only installed on otter
CFLAGS = -I/usr/local/lib/Oracle/instantclient_11_2/sdk/include
LFLAGS = -L/usr/local/lib/Oracle/instantclient_11_2 -locci -lociei
all: pacwestDBA 

pacwestDBA.o: pacwestDBA.cpp
	$(G) -c $(CFLAGS) pacwestDBA.cpp

pacwestDBA: pacwestDBA.o
	$(G) $(LFLAGS) -o pacwestDBA pacwestDBA.o

run: pacwestDBA
	./pacwestDBA

clean:
	rm -f *.o pacwestDBA