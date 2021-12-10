#include <stdio.h>
#include <math.h>

int options(int balls, int cells)
{
	if (cells == 0)
	{
		if (balls == 0)
			return 1;
		return 0;
	}
	return options(balls - 2, cells - 1) + options(balls, cells - 1);
}

void main()
{
	int res;
	int ball, cell;
	printf("enter int num Balls: ");
	scanf("%d", &ball);
	printf("enter int num Cells: ");
	scanf("%d", &cell);
	res = options(ball, cell);
	printf("Result : %d", res);

}





