#include <stdio.h>
#include <stdlib.h>
#include "objetosc.h"
#include "pole.h"

int main()
{
	float a,b; //a- kwadrat, b-szescian
	printf("Podaj dlugosc boku kwadratu: ");
	scanf("%f", &a);
	printf("Pole powierzchni kwadratu wynosi: ");
	printf("%f", pole_kwadratu(a));
	printf("\n");
	
	printf("Podaj dlugosc boku szescianu: ");
	scanf("%f", &b);
	printf("Objetosc szescianu wynosi: ");
	printf("%f", objetosc_szescianu(b));
	printf("\n");
	return 0;

}
