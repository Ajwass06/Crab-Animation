#include "gba.h"
#include "print.h"

void initialize(); //set up background //set currFrame to zero
void update(); //have all the buttons
void waitForVBlank();
void draw(); //switch statement, write reset() in here, undraw the old and draw the new
void reset();

u16 bgColor;
u16 buttons;
u16 oldButtons;
int currScreen;
int isLooping;
int time;
int timeStep;
int currFrame;
int direction;
int changed;

void initialize() {
    REG_DISPCTL = MODE_3 | BG2_ENABLE;

    buttons = BUTTONS;
    oldButtons = 0;

    //initializing background color
    drawSky(0, 0, SCREENWIDTH, 35);
    drawSand(0, 0, SCREENWIDTH, SCREENHEIGHT);
}

int main() {
    currFrame = 0;
    isLooping = 0; //doesn't start looping
    direction = 1; //start looping forwards when looping

    mgba_open();
    mgba_printf("Debugging initialized");

    initialize();
    while (1) {
        update();
        if (isLooping && (direction != 0)) { //forward loop function
            time++;
            if (time == timeStep) {
                time = 0;
                if (currFrame == 3) {
                    currFrame = 0;
                    changed = 1;
                } else {
                    currFrame++;
                    changed = 1;
                }
                mgba_printf("forwards loop started");
            }
        }
        if (isLooping && (direction == 0)) { //backwards loop function
            time++;
            if (time == timeStep) {
                time = 0;
                if (currFrame == 0) {
                    currFrame = 3;
                    changed = 1;
                } else {
                    currFrame--;
                    changed = 1;
                }
                mgba_printf("backwards loop started");
            }
        }
        oldButtons = buttons;
        buttons = BUTTONS;
        waitForVBlank();
        draw();
    }
}

void update() {
    if (BUTTON_PRESSED(BUTTON_A)) { //advance to the next frame
        mgba_printf("button a pressed");
        if (currFrame == 3) {
            currFrame = 0;
            changed = 1;
        } else {
            currFrame++;
            changed = 1;
        }
    }
    if (BUTTON_PRESSED(BUTTON_B)) { //go back a frame
        mgba_printf("button b pressed");
        if (currFrame == 0) {
            currFrame = 3;
            changed = 1;
        } else {
            currFrame--;
            changed = 1;
        }
    }
    if (BUTTON_PRESSED(BUTTON_START)) { //if looping. stop looping, else, start looping
        mgba_printf("start pressed");
        timeStep = 50;
        isLooping = !(isLooping);
    }
    if (BUTTON_PRESSED(BUTTON_SELECT)) { //if looping forwards, loop backwards, if looping backwards, loop forwards
        timeStep = 50;
        direction = !(direction);
    }
    if (BUTTON_PRESSED(BUTTON_LEFT)) { //skip to last frame of animation, if looping, don't stop
        timeStep = 50;
        currFrame = 0;
        changed = 1;
    }
    if (BUTTON_PRESSED(BUTTON_RIGHT)) { //skip to first frame of animation, if looping, don't stop
        timeStep = 50;
        currFrame = 3;
        changed = 1;
    }
    if (BUTTON_PRESSED(BUTTON_UP)) { //increase playback speed of animation (max speed and 5 different increments)
        time = 0;
        if (timeStep > 26) {
            mgba_printf("increment timestep by 5"); //why does it stop looping?----------------------------------
            timeStep -= 5;
            mgba_printf("timeStep: %d", timeStep);
        }
    }
    if (BUTTON_PRESSED(BUTTON_DOWN)) { //decrease playback speed of animation (min speed and 5 different increments)
        time = 0;
        if (timeStep < 74) {
            mgba_printf("decrement timestep by 5");
            timeStep += 5;
            mgba_printf("timeStep: %d", timeStep);
        } 
    }
}

void draw() {
    if (changed) {
        reset();
        changed = 0;
    }
    switch(currFrame) {
        case 0:
            firstFrame();
            break;
        case 1:
            secondFrame();
            break;
        case 2:
            thirdFrame();
            break;
        case 3:
            fourthFrame();
            break;
    }
}

void reset() {
    drawSky(0, 0, SCREENWIDTH, 35);
    drawSand(0, 0, SCREENWIDTH, SCREENHEIGHT);
}