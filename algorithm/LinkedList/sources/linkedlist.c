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
            int data = inputData();

            // Generate new node
            Node* newNode = (Node*)malloc(sizeof(Node));
            newNode->Data = data;
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
    printf("Add Data: ");
    scanf("%d", &data);
    fflush(stdin);

    return data;
}