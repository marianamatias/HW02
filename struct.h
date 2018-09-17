#ifndef HEADER_FILE
#define HEADER_FILE
#include <time.h>
#include <stdlib.h>

#include <stdio.h>

// numbers in range [lower, upper].
int random(int lower, int upper) {
    int num = (rand() %
       (upper - lower + 1)) + lower;

    return num;
}

typedef struct {
    int row;
    int col;
    int size;
    int cdel;
    int rdel;
    int oldRow;
    int oldCol;
    unsigned short color;
    int active;
    int erased;
} BALL;

void drawBall(BALL *);
void eraseBall (BALL *a);

void initBall(BALL *a) {
    a->row = 0;
    a->col = random(0, 240);
    a->size = 5;
    a->cdel = 1;
    a->rdel = 1;
    a->oldRow = 0;
    a->oldCol = 0;
    a->color = YELLOW;
    a->active = 0;
    a->erased = 0;
}


#endif