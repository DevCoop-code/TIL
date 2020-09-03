#include <stdio.h>
#include <stdlib.h>

typedef struct tagNode{
    int Data;
    struct tagNode* NextNode;
} Node;

/*
TODO:
Node 생성 및 소멸
Node 추가
Node 탐색
Node 삭제
Node 삽입
*/

void addNode(Node* newNode);
void removeNode(Node* newNode);
Node* searchNode(int index);
void insertNode(Node* newNode);

int inputData();

int main() {
    printf("Welcome to LinkedList DataBase\n");
    char act;
    int index = 0;

    Node* head = NULL;
    while(1) {
        printf("Please Select your Activity (ADD(A) / REMOVE(R) / SEARCH(S) / INSERT(I) / QUIT(Q)) : ");
        scanf("%c", &act);
        fflush(stdin);
        switch (act) {
            case 'a':
            case 'A':
            printf("=ADD= \n");
            printf("Add Data: ");
            int add_data = inputData();

            // Generate new node
            Node* newNode = (Node*)malloc(sizeof(Node));
            newNode->Data = add_data;
            newNode->NextNode = NULL;
            
            if (head == NULL) {
                printf("Assign new node to HEAD \n");
                head = newNode;
            } else {
                Node* addNode = head->NextNode;
                if (addNode == NULL) {
                    addNode = newNode;
                    head->NextNode = addNode;
                } else {
                    while (1) {
                        if (addNode->NextNode == NULL) {
                            addNode->NextNode = newNode;
                            break;
                        } else {
                            addNode = addNode->NextNode; 
                        }
                    }
                }
            }

            break;

            case 'r':
            case 'R':
            printf("=REMOVE= \n");
            printf("Remove Data: ");
            int removed_data = inputData();

            Node* RemoveNode = head;
            Node* PreviousNode;
            while (1) {
                if (RemoveNode == NULL) {
                    break;
                } else {
                    // 삭제하고자 하는 데이터가 Head 데이터일 경우
                    if (head->Data == removed_data) {
                        head = RemoveNode->NextNode;
                        free(RemoveNode);
                    }
                    else if (RemoveNode->Data == removed_data) {
                        printf("Find the Data start to remove");
                        
                        PreviousNode->NextNode = RemoveNode->NextNode;
                        free(RemoveNode);
                        RemoveNode = PreviousNode;
                    }
                    PreviousNode = RemoveNode;
                    RemoveNode = RemoveNode->NextNode;
                }
            }
            break;

            case 's':
            case 'S':
            printf("=SEARCH= \n");
            printf("[Data: [%d]] \n", head->Data);
            Node* searchNode = head->NextNode;
            while (1) {
                if (searchNode == NULL) {
                    printf("=SEARCH END= \n");
                    break;
                } else {
                    printf("[Data: [%d]] \n", searchNode->Data);
                    searchNode = searchNode->NextNode; 
                }
            }
            break;

            case 'i':
            case 'I':
            printf("=INSERT= \n");
            printf("Insert Data: ");
            int insert_data = inputData();
            printf("\n");

            Node* insertNewNode = (Node*)malloc(sizeof(Node));
            insertNewNode->Data = insert_data;
            insertNewNode->NextNode = NULL;
            
            printf("Insert Location: ");
            int insert_loc = inputData();
            printf("\n");

            Node* InsertNode = head;
            int insertedIndex = 1;
            while (1) {
                if (InsertNode == NULL) {
                    break;
                } else {
                    if (insertedIndex == insert_loc) {
                        insertNewNode->NextNode = InsertNode->NextNode;
                        InsertNode->NextNode = insertNewNode;
                        insertedIndex++;
                    }
                }
                InsertNode = InsertNode->NextNode;
                insertedIndex++;
            }
            
            break;

            case 'q':
            case 'Q':
            printf("=Bye Bye= \n");
            Node* removeNode = head->NextNode;
            printf("Remove the Node: %d \n", head->Data);
            free(head);
            while (1) {
                if (removeNode->NextNode == NULL) {
                    printf("Remove the Node: %d \n", removeNode->Data);
                    free(removeNode);
                    break;
                } else {
                    Node* legacyNode = removeNode;
                    removeNode = legacyNode->NextNode;
                    printf("Remove the Node: %d \n", legacyNode->Data);
                    free(legacyNode);
                }
            }
            exit(1);
            break;

            default:
            printf("%c is not recommended command \n", act);
            break;
        }
        // scanf("%d", &data);
    }
    return 0;
}

// void generateLinkedList(Node* head, Node* tail) {
//     Node* headNode = (Node*)malloc(sizeof(Node));
//     headNode->Data = -1;
//     headNode->NextNode = tail;
//     head = headNode;

//     Node* tailNode = (Node*)malloc(sizeof(Node));
//     tailNode->Data = -1;
//     tailNode->NextNode = NULL;
//     tail = tailNode;
// }

int inputData() {
    int data;
    scanf("%d", &data);
    fflush(stdin);

    return data;
}