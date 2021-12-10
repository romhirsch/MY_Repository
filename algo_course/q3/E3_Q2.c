#include <stdio.h>
#include <stdlib.h>
#include "stack.h"
#define LEN 60
DATA pushminnum(STACK* pStack);
void main()
{
	STACK s1;
	DATA arrays[] = { 1,2,-100,-55,3,2,4,-7,-20 };
	printf("your stack before function: ");
	S_init(&s1);
	int i = 0;
	int n = sizeof(arrays) / sizeof(arrays[0]);
	for (i = 0; i < n; i++)
		S_push(&s1, arrays[i]);
	printf("the your stack:\n");
	S_print(&s1);
	DATA min_num = pushminnum(&s1);
	printf("\nmin number in the stack : %d\n", min_num);
	printf("\nthe your stack after function:\n");
	S_print(&s1);
	S_free(&s1);
	printf("\n\n");
	system("pause");
}

DATA pushminnum(STACK *pStack)
{
	STACK s;
	DATA cnum, minnum=0;
	int c = 0;
	S_init(&s);
	while (!S_isEmpty(pStack))
	{
		cnum = S_pop(pStack);
//		printf("%d", cnum);
		S_push(&s, cnum);
		if (c == 0)
			minnum = cnum;
		c++;
		if (minnum > cnum)
		{ 
			minnum = cnum;
		}
	}
	while (!S_isEmpty(&s))
	{
		cnum = S_pop(&s);
		if (cnum!= minnum)
			S_push(pStack, cnum);
	}
	S_push(pStack, minnum);
	S_free(&s);
	return minnum;
}