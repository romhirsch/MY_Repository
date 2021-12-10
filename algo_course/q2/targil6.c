#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include "CList.h"

void FourthLargest(const CLIST* A, const CLIST* B);

void main()
{
	CLIST clst1;
	CL_init(&clst1);

	CL_insert(&clst1, &clst1.head, -10);
	CL_insert(&clst1, &clst1.head, -10);
	CL_insert(&clst1, &clst1.head, 18);
	CL_insert(&clst1, &clst1.head, 20);
	CL_insert(&clst1, &clst1.head, 25);

	puts("\nList1  :");
	CL_print(&clst1);
	CLIST clst2;
	CL_init(&clst2);

	CL_insert(&clst2, &clst2.head, -10);
	CL_insert(&clst2, &clst2.head, 1);
	CL_insert(&clst2, &clst2.head, 19);
	CL_insert(&clst2, &clst2.head, 20);
	CL_insert(&clst2, &clst2.head, 90);

	puts("\n\nList2:");
	CL_print(&clst2);
	FourthLargest(&clst1, &clst2);

}

void FourthLargest(const CLIST* A, const CLIST* B)
{
	DATA FourthLargest;
	int count = 0;
	DATA prev = 9999;
	NODE* p1, * p2;
	p1 = A->head.next;
	p2 = B->head.next;
	while(count!=4)
	{ 
		if (p1->key > p2->key)
		{ 
			if (prev != p1->key)
				count++;
			prev = p1->key;
			FourthLargest = p1->key;
			p1 = p1->next;
		}
		else
		{ 
			if (prev != p2->key)
				count++;

			prev = p2->key;
			FourthLargest = p2->key;
			p2 = p2->next;

		}
	}
	printf("\n\FourthLargest = %d\n\n", FourthLargest);
}	

