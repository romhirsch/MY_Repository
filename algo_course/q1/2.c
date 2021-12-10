#include <stdio.h>
#include <math.h>

void printDigits(unsigned n) {
	if (n == 0)
		return;
	printDigits(n / 10);
	printf("%d*", n % 10);

}

void main()
{
	unsigned n; 
	printf("enter int num: ");
	scanf_s("%u", &n);
	printf("Result:\n");
	printDigits(n);
}
