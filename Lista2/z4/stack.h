#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h> 



typedef struct node Node;
typedef struct list List;

struct node
{
    int info;
    Node *ptr;
};
 
struct list{
    Node* head;
    int count;
};

List* create()
{
    List* list = (List*) malloc(sizeof(List*));
    list->head = NULL;
    list->count=0;
    return list;
}

void push(List* list,int data)
{
    Node* element = (Node*) malloc(sizeof(Node*));
    element->info = data;

    if(list->count == 0){
        list->head = element;
        element->ptr = NULL;
    }
    else{
        element->ptr = list->head;
        list->head = element;
    }

    ++list->count;
}

int pop(List* list)
{
   if(list->count > 1){
        int value = list->head->info;
        Node* temp = list->head;

        list->head = temp->ptr;
        free(temp);
        --list->count;
        return value;
    }else if(list->count == 1){
        int value = list->head->info;
        free(list->head);
        --list->count;
        return value;
    }
    else{

        return -1;
    }
}

int topelement(List* list)
{   
    return(list->head->info);
}
 
bool empty(List* list)
{
    if (list->head == NULL)
        return 1;
    else
	return 0;
}
 
void clean(List* list){
    Node* element;
    while(list->count > 1){
        element = list->head;
        list->head = list->head->ptr;
        free(element);
        --list->count;
    }
    free(list);
    list->head = NULL;
}

    
