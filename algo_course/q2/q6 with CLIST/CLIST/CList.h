/********************************************/
/*   list.h                                 */
/*   a dynamic  linked list with a header   */
/********************************************/


#ifndef _CLIST_
#define _CLIST_

#include "def.h"


/*** Definitions ***/

// List
typedef struct 
{
	NODE head;
	NODE *tail;
}CLIST;


/*** Function prototypes ***/

BOOL CL_init(CLIST* pList);					// create new list
NODE* CL_insert(CLIST *pList , NODE* pNode, DATA Value);	//add new node after *pNode

//BOOL L_delete(NODE* pNode);					// erase node after *pNode

//NODE* L_find(NODE* pNode, DATA Value);		// return a pointer to the node 

//BOOL L_free(LIST* pList);					// free list memory

int CL_print(CLIST* pList);					// print the list content

#endif
