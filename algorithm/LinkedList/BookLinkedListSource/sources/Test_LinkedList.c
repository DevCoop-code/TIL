#include "LinkedList.h"

int main(void)
{
    Node* List = NULL;
    Node* Current = NULL;
    Node* NewNode = NULL;

    // Add 5 New Nodes
    for (int i = 0; i < 5; i++)
    {
        NewNode = SLL_CreateNode(i);
        SLL_AppendNode(&List, NewNode);
    }

    NewNode = SLL_CreateNode(-1);
    SLL_AppendNode(&List, NewNode);

    NewNode = SLL_CreateNode(-2);
    SLL_AppendNode(&List, NewNode);

    // Print out the List
    int Count = SLL_GetNodeCount(List);
    for (int j = 0; j < Count; j++)
    {
        Current = SLL_GetNodeAt(List, j);
        printf("List[%d] : %d \n", j, Current->Data);
    }

    printf("\n Inserting 3000 After second Node \n");

    Current = SLL_GetNodeAt(List, 2);
    NewNode = SLL_CreateNode(3000);

    SLL_InsertAfter(Current, NewNode);

    // Print out the List
    Count = SLL_GetNodeCount(List);
    for (int j = 0; j < Count; j++)
    {
        Current = SLL_GetNodeAt(List, j);
        printf("List[%d] : %d \n", j, Current->Data);
    }

    printf("\n Destroying List..... \n");

    for (int l = 0; l < Count; l++)
    {
        Current = SLL_GetNodeAt(List, 0);

        if (Current != NULL)
        {
            SLL_RemoveNode(&List, Current);
            SLL_DestroyNode(Current);
        }
    }
    return 0;
}