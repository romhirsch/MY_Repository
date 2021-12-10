#include <stdio.h>
#include <math.h>

double series(int n)
{
	if (n == 3)
		return 3;
	else if (n == 2)
		return 2;
	else if (n == 1)
		return 1;
	return (series(n-1)+series(n-2))/(n*series(n-3));
}

void main()
{
	int num;
	double res;
	printf("enter index series: ");
	scanf("%d", &num);
	res = series(num);
	printf("Result M%d: %f",num,res);

}





