#include <stdio.h>
#include <stdlib.h>
#include "queue.h"
#include "stack.h"


QUEUE copyQ(QUEUE* pque);

void main()
{
	QUEUE	que;
	QUEUE	que_s;
	// Initialization
	Q_init(&que);
	//Operations
	Q_enque(&que, 0);
	Q_enque(&que, 10);
	Q_enque(&que, 56);
	Q_enque(&que, 210);
	Q_enque(&que, 8);
	Q_enque(&que, -10);
	Q_enque(&que, 11);
	Q_enque(&que, 2);
	printf("\n Original Queue:");
	Q_print(&que);
	que_s = copyQ(&que);
	printf("\n Copy Queue:");
	Q_print(&que_s);
	printf("\n Original after function Queue:");
	Q_print(&que);
	printf("\n\n\n");



	// Finish work
	Q_free(&que);
	system("pause");
}

QUEUE copyQ(QUEUE* pque)
{
	QUEUE que1,tmpQue;
	Q_init(&tmpQue);
	Q_init(&que1);
	DATA n;
	while (!Q_isEmpty(pque))
	{
		n = Q_deque(pque);
		Q_enque(&que1, n);
		Q_enque(&tmpQue, n);
	}
	while (!Q_isEmpty(&tmpQue))
		Q_enque(pque, Q_deque(&tmpQue));
	Q_free(&tmpQue);
	return que1;
}