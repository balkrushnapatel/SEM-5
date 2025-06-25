#include <stdio.h>
#include <stdlib.h>

int *queue;
int front = -1, rear = -1;
int maxSize;

// Enqueue (insert element)
void enqueue(int value) {
    if (rear == maxSize - 1) {
        printf("Queue Overflow!\n");
    } else {
        if (front == -1) front = 0;
        rear++;
        queue[rear] = value;
        printf("%d enqueued to queue.\n", value);
    }
}

// Dequeue (remove element)
void dequeue() {
    if (front == -1 || front > rear) {
        printf("Queue Underflow!\n");
    } else {
        printf("%d dequeued from queue.\n", queue[front]);
        front++;
    }
}

// Display the queue
void display() {
    if (front == -1 || front > rear) {
        printf("Queue is empty.\n");
    } else {
        printf("Queue elements: ");
        for (int i = front; i <= rear; i++) {
            printf("%d ", queue[i]);
        }
        printf("\n");
    }
}

int main() {
    int choice, value;

    printf("Enter queue size: ");
    scanf("%d", &maxSize);

    queue = (int *)malloc(maxSize * sizeof(int)); // Allocate memory dynamically

    if (queue == NULL) {
        printf("Memory allocation failed!\n");
        return 1;
    }

    while (1) {
        printf("\n--- Queue Menu ---\n");
        printf("1. Enqueue\n2. Dequeue\n3. Display\n4. Exit\n");
        printf("Enter your choice: ");
        scanf("%d", &choice);

        switch (choice) {
            case 1:
                printf("Enter value to enqueue: ");
                scanf("%d", &value);
                enqueue(value);
                break;
            case 2:
                dequeue();
                break;
            case 3:
                display();
                break;
            case 4:
                free(queue);
                printf("Exiting...\n");
                return 0;
            default:
                printf("Invalid choice! Try again.\n");
        }
    }

    return 0;
}
