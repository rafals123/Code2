.PHONY: clean install
.SUFFIXES: .c .o .h .so .a




#pliki obiektowe

objetosc.o: objetosc.c
	gcc -c objetosc.c
	
pole.o: pole.c
	gcc -c pole.c
	
main.o: main.c
	gcc -c main.c
	

#Biblioteka statyczna - obliczanie pola
libpole.a: pole.o
	ar rs libpole.a pole.o

#Biblioteka dynamiczna - obliczanie objetosci
libobjetosc.so: objetosc.o
	gcc -shared -o libobjetosc.so objetosc.o
	
#plik wykonywalny

Code2: main.o libpole.a libobjetosc.so
	gcc -o Code2 main.o libpole.a libobjetosc.so
	
	

#instalacja programu 

install: Code2
	#nadanie uprawnien
	sudo chmod 777 Code2 
	sudo cp Code2 /usr/local/bin
	sudo cp libobjetosc.so /usr/lib
	sudo cp libpole.a /usr/lib
	
clean:
	rm -f *o *.a *.so Code2
	sudo rm -f /usr/local/bin/Code2
	sudo rm -f /usr/lib/libobjetosc.so
	sudo rm -f /usr/lib/libpole.a
	
