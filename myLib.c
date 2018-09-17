#include "myLib.h"

unsigned short *videoBuffer = (unsigned short *)0x6000000;

void setPixel(int row, int col, unsigned short color) {

	videoBuffer[OFFSET(row, col, SCREENWIDTH)] = color;
}

void drawRect(int row, int col, int height, int width, unsigned short color) {
    for (int i = 0; i < width; i++) {
        for (int j = 0; j < height; j++) {
            setPixel((row + i), (col + j), color);
        }
    }
}

void fillScreen(unsigned short color) {
    for (int i = 0; i < 38400; i++) {
        videoBuffer[OFFSET(0, i, SCREENWIDTH)] = color;
    }

    // TODO #2: Implement this function
    // Note: You may only use a single loop
}

void waitForVBlank() {

	while(SCANLINECOUNTER > 160);
	while(SCANLINECOUNTER < 160);
}

int collision(int rowA, int colA, int heightA, int widthA, int rowB, int colB, int heightB, int widthB) {

    // if (((rowA + heightA) >= rowB) && (colA >= colB)){
    //     if ((colA + widthA) <= (colB + widthB)){
    //         return 1;
    //     }
    // }

    // return 0;
    return rowA < rowB + heightB - 1 && rowA + heightA - 1 > rowB &&
           colA < colB + widthB - 1 && colA + widthA - 1 > colB;
}
