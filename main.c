#include "myLib.h"
#include "struct.h"

// Prototypes
void initialize();
void update();
void draw();

// Button Variables
unsigned short buttons;
unsigned short oldButtons;

// Background Variables
unsigned short bgColor;

// Blue Rectangle Variables
int bRow;
int bCol;
int bOldRow;
int bOldCol;
int bRDel;
int bCDel;
int bHeight;
int bWidth;

//Ball variables
BALL balls[5];
unsigned short ballColor;


int main() {

	initialize();

	while(1) {

		// TODO #3.6: Update the button variables each frame
		oldButtons = buttons;
		buttons = BUTTONS;

		update();
		waitForVBlank();
		draw();
	}
}

// Sets up the display and the game objects
void initialize() {
	REG_DISPCTL = MODE3 | BG2_ENABLE;

	// TODO #3.3: Intialize your button variables

	buttons = BUTTONS;
	oldButtons = 0;


	// Initialize background
	bgColor = BLACK;
	fillScreen(bgColor);

	// Initialize blue rectangle
	bRow = 120;
	bCol = 120;
	bOldRow = bRow;
	bOldCol = bCol;
	bRDel = 1;
	bCDel = 1;
	bHeight = 20;
	bWidth = 5;
}

// Performs all of the game's calculations
void update() {

	// if (BUTTON_PRESSED(BUTTON_START)) {
	    // If we need a new ball
	    for (int i = 0; i < 5; i++) {
	        // Loop through the pool
	        if (!balls[i].active) {     // Find the first inactive
	            initBall(&balls[i]);    // Initialize it somehow
	            balls[i].active = 1;    // Set it active
	            break;                  // End the loop
	        }
	    }
	// }
	// Change the background color if Start is pressed
	// if (BUTTON_PRESSED(BUTTON_A)) {
	// 	if (bgColor == CYAN)
	// 		bgColor = YELLOW;
	// 	else
	// 		bgColor = CYAN;
	// 	fillScreen(bgColor);
	// }

	// Move the blue rectangle with the buttons
	// TODO #4: Make the blue rectangle move with the arrow keys
	if (BUTTON_HELD(BUTTON_LEFT)) {
		bCol -= 1;
	}

	if (BUTTON_HELD(BUTTON_RIGHT)) {
		bCol += 1;
	}

	//use balls in active pool
	for (int i = 0; i < 5; i++) {
        if (balls[i].active) {
            updateBall(&balls[i]);
        }
    }

}

void updateBall(BALL *a) {
    // if (a->row > 0 && a->row + a->size < SCREENHEIGHT) {
    //     a->row += a->rdel;
    // }

    a->row += 1;

    if (a->row > SCREENHEIGHT) {
    	a->active = 0;
	}

    if (collision(a->row, a->col, a->size, a->size, bRow, bCol, bHeight, bWidth)) {
        a->active = 0;
        //erase previous location
    }
}

// Performs all of the writing to the screen
void draw() {

	// UNCOMMENT #1
	// Erase the previous locations
	drawRect(bOldRow, bOldCol, bHeight, bWidth, bgColor);

	// Draw the new locations
	drawRect(bRow, bCol, bHeight, bWidth, WHITE);

	// Update old variables
	bOldRow = bRow;
	bOldCol = bCol;

	//draw Balls
	for (int i = 0; i < 5; i++) {
		if (!balls[i].active && !balls[i].erased) {
			eraseBall(&balls[i]);
			balls[i].erased = 1;
		}
        if (balls[i].active) {
            drawBall(&balls[i]);
        }
    }
}

void eraseBall (BALL *a) {
    drawRect(a->row, a->col, a->size, a->size, bgColor);

}

void drawBall(BALL *a) {

    //erase previous location
    drawRect(a->oldRow, a->oldCol, a->size, a->size, bgColor);

    //draw new location
    drawRect(a->row, a->col, a->size, a->size, a->color);

    a->oldRow = a->row;
    a->oldCol = a->col;
}
