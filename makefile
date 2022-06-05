.PHONY: clean install
.SUFFIXES: .c .o .h .so .a

vpath %.h ./include
vpath %.c ./src
vpath %.a ./lib
vpath %.so ./lib

#ZMIENNE PRZECHOWUJACE SCIEZKE DO KATALOGOW SYSTEMOWYCH (instalacja programu Code2)

sciezka_plik=/usr/local/bin
sciezka_bibliotek=/usr/lib

#reguly przyrostkow
.c.o:
	gcc -c -I./include $<
#.o:
#	gcc -o $@ $^

#reguly wzorca
#%.o: %.c
#	gcc -c $^
	
lib%.a: %.o
	ar rs $@ $^

lib%.so: %.o
	gcc -shared -o $@ $^

#tworzenie katalogow bin oraz lib, do ktorych zostana przeniesione odpowiednie pliki
all:
	mkdir bin
	mkdir lib
	
#pliki obiektowe


objetosc.o: objetosc.c	
pole.o: pole.c	
main.o: main.c
	
#Biblioteka statyczna - obliczanie pola
libpole.a: pole.o

#Biblioteka dynamiczna - obliczanie objetosci
libobjetosc.so: objetosc.o
	gcc -shared -o $@ $^
#plik wykonywalny

Code2: libpole.a libobjetosc.so main.o
	gcc -o ./bin/Code2 libpole.a libobjetosc.so main.o
	
	

#instalacja programu 

install: Code2
	#nadanie uprawnien
	sudo chmod 777 Code2 
	sudo cp Code2 $(sciezka_plik)
	sudo cp libobjetosc.so $(sciezka_bibliotek)
	sudo cp libpole.a $(sciezka_bibliotek)
	mv libpole.a lib
	mv libobjetosc.so lib
	
#usuniecie plikow
clean:
	sudo rm -Rf bin lib
	sudo rm -f $(sciezka_plik)/Code2
	sudo rm -f $(sciezka_bibliotek)/libobjetosc.so
	sudo rm -f $(sciezka_bibliotek)/libpole.a
	
