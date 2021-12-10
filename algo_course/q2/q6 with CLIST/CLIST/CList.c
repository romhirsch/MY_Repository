/**************/
/*   CList.c   */
/**************/


#include <stdio.h>
#include <stdlib.h>
#include "CList.h"


//////////////////////////////////////////
// Init
// Aim:		create new list
// Input:	pointer to the list structure
// Output:	TRUE if succeeded
//////////////////////////////////////////
BOOL CL_init(CLIST* pList)
{
	if ( pList == NULL ) return False;	// no list to initialize
	pList->head.next = &pList->head;
	pList->tail = &pList->head;
	return True;
}
/////////////////////////////////////////////////////////////////
// Insert
// Aim:		add new node
// Input:	pointer to the circularly list
//				pointer to the node BEFORE the place for the new one
//				a value to be stored in the new node
// Output:	pointer to the new node
/////////////////////////////////////////////////////////////////
NODE* CL_insert(CLIST *pList , NODE* pNode, DATA Value)
{
	NODE* tmp;

	if ( !pNode || !pList) return NULL;

	tmp = (NODE*)malloc(sizeof(NODE));	// new node

	if ( tmp != NULL )  {
		tmp->key = Value;
		tmp->next = pNode->next;
		pNode->next = tmp;
		if(pNode == pList->tail)
			pList->tail = tmp;
		pList->tail->next = pList->head.next;
	}
	return tmp;
}
int CL_print(CLIST* pList)
{
	NODE	*tmp  = pList->head.next; //tmp points to the first node
	int		c = 0;

	if ( !pList ) return 0;
	if(pList->tail == &pList->head)		//is the list empty?
		return 0;
	printf("\n");
	do
	{
		printf("%d, " , tmp->key);
		tmp=tmp->next;
		c++;
	}while(tmp!=pList->tail->next);
	printf("\n");
	return c;
}
