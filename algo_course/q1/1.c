#include <stdio.h>
#include <math.h>

double S(int n)
{
	if (n == 1)
		return 1;
	return 1/pow(n,n) + S(n - 1);
}
void main()
{
	//define params
	int n;
	double res;
	printf("enter int num: ");
	scanf_s("%d", &n);//collect input from the user
	res = S(n);//call function 
	printf("S result = %lf\n", res);
}


