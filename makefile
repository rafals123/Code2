.PHONY: clean install
.SUFFIXES: .c .o .h .so .a


#ZMIENNE PRZECHOWUJACE SCIEZKE DO KATALOGOW SYSTEMOWYCH (instalacja programu Code2)

sciezka_plik=/usr/local/bin
sciezka_bibliotek=/usr/lib

#pliki obiektowe

objetosc.o: objetosc.c
	gcc -c objetosc.c
	
pole.o: pole.c
	gcc -c pole.c
	
main.o: main.c
	gcc -c main.c
	

#Biblioteka statyczna - obliczanie pola
libpole.a: pole.o
	ar rs $@ $^

#Biblioteka dynamiczna - obliczanie objetosci
libobjetosc.so: objetosc.o
	gcc -shared -o $@ $^
	
#plik wykonywalny

Code2: main.o libpole.a libobjetosc.so
	gcc -o $@ $^
	
	

#instalacja programu 

install: Code2
	#nadanie uprawnien
	sudo chmod 777 Code2 
	sudo cp Code2 $(sciezka_plik)
	sudo cp libobjetosc.so $(sciezka_bibliotek)
	sudo cp libpole.a $(sciezka_bibliotek)
	
clean:
	rm -f *o *.a *.so Code2
	sudo rm -f $(sciezka_plik)/Code2
	sudo rm -f $(sciezka_bibliotek)/libobjetosc.so
	sudo rm -f $(sciezka_bibliotek)/libpole.a
	
