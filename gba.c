#include "gba.h"

volatile u16 *videoBuffer = (u16 *)0x06000000;

extern int currScreen;

void setPixel(int row, int col, u16 color) {
    videoBuffer[OFFSET(col, row, SCREENWIDTH)] = color;
}

void fillScreen(u16 color) {
    for (int i = 0; i < 38400; i++) {
        videoBuffer[i] = color;
    }
}

void drawSky(int row, int col, int width, int height) {
    for (int i = 0; i < height; i++) {
        for (int j = 0; j < width; j++) {
            setPixel(row + i, col + j, BLUE);
        }
    }
}

void drawSand(int row, int col, int width, int height) {
    for (int i = 35; i < height; i++) {
        for (int j = 0; j < width; j++) {
            setPixel(row + i, col + j, YELLOW);
        }
    }
}

void drawCrabEyes(int row, int col, u16 mainColor, u16 color2, u16 color3) {
    for (int i = 0; i < 9; i ++) { //top of eye
        setPixel(row, col + i, mainColor);
        setPixel(row + 8, col + i, mainColor);
        setPixel(row + 1, col + i, color2);
        setPixel(row + 7, col + i, color2);
        for (int m = 0; m < 9; m++) { //side of eye
            setPixel(row + m, col, mainColor);
            setPixel(row + m, col + 1, mainColor);
            setPixel(row + m, col + 8, mainColor);
            setPixel(row + m, col + 9, mainColor);
        }
        for (int j = 1; j < 8; j++) { //whites of eyes
            setPixel(row + j, col + 2, color2);
            setPixel(row + j, col + 3, color2);
            setPixel(row + j, col + 6, color2);
            setPixel(row + j, col + 7, color2);
        }
        for (int n = 2; n < 7; n++) { //pupiles
            setPixel(row + n, col + 4, color3);
            setPixel(row + n, col + 5, color3);
        }
    }
    for (int i = 0; i < 7; i++) { //stem of eyes
        for (int j = 0; j < 2; j++) {
            setPixel(row + 9 + i, col + j + 4, mainColor);
        }
    }
}

void drawCrabBody(int row, int col, u16 mainColor) {
    for (int i = 0; i < 35; i++) { //col
        for (int j = 0; j < 20; j++) { //row
            setPixel(row + j, col + i, mainColor);
        }
    }
}

void drawCrabArms(int row, int col, u16 mainColor) {
    for (int i = 0; i < 8; i++) { //arms
        for (int m = 0; m < 3; m++) {
            setPixel(row + m, col + i, mainColor);
            setPixel(row + m, col + i + 42, mainColor);
        }
    }
    for (int i = 0; i < 7; i++) {
        for (int m = 0; m < 3; m++) {
            setPixel(row + m - 2, col + i - 7, mainColor);
            setPixel(row + m - 2, col + i + 50, mainColor);
            setPixel(row + m + 2, col + i - 7, mainColor);
            setPixel(row + m + 2, col + i + 50, mainColor);
        }
    }
}

void drawCrabLegsR(int row, int col, u16 mainColor) {
    int i = 0;
    while (i < 3) {
        for (int j = 0; j < 3; j++) {
            for (int m = 0; m < 3; m++) {
                setPixel(row + i, col + m + j, mainColor);
            }
            i++;
        }
    }
    for (int i = 0; i < 3; i++) {
        for (int m = 0; m < 3; m++) {
            setPixel(row + i + 3, col + m + 3, mainColor);
        }
    }
}

void drawCrabLegsL(int row, int col, u16 mainColor) {
    int i = 0;
    while (i > -3) {
        for (int j = 0; j < 3; j++) {
            for (int m = 0; m < 3; m++) {
                setPixel(row + i, col + m + j, mainColor);
            }
            i--;
        }
    }
    for (int i = 0; i < 3; i++) {
        for (int m = 0; m < 3; m++) {
            setPixel(row + i + 1, col + m - 1, mainColor);
        }
    }
}

void drawSmileL(int row, int col, u16 mainColor) {
    int i = 0;
    while (i < 5) {
        for (int j = 0; j < 5; j++) {
            for (int m = 0; m < 2; m++) {
                setPixel(row + i, col + m + j, mainColor);
            }
            i++;
        }
    }
}

void drawSmileR(int row, int col, u16 mainColor) {
    int i = 0;
    while (i > -5) {
        for (int j = 0; j < 5; j++) {
            for (int m = 0; m < 2; m++) {
                setPixel(row + i, col + m + j, mainColor);
            }
            i--;
        }
    }
}

void drawInbetween(int row, int col, u16 mainColor) {
    for (int i = 0; i < 6; i++) {
        for (int m = 0; m < 2; m++) {
            setPixel(row + m, col + i, mainColor);
        }
    }
}

void drawExtendedArmsL(int row, int col, u16 mainColor) {
    int i = 0;
    while (i < 8) {
        for (int m = 0; m < 8; m++) {
            for (int j = 0; j < 3; j++) {
                setPixel(row + i, col + m + j, mainColor);
            }
            i++;
        }
    }
    for (int i = 0; i < 7; i++) {
        for (int m = 0; m < 3; m++) {
            setPixel(row + i - 7, col + m - 2, mainColor);
            setPixel(row + i - 7, col + m + 2, mainColor);
        }
    }
}

void drawExtendedArmsR(int row, int col, u16 mainColor) {
    int i = 0;
    while (i > -8) {
        for (int m = 0; m < 8; m++) {
            for (int j = 0; j < 3; j++) {
                setPixel(row + i, col + m + j, mainColor);
            }
            i--;
        }
    }
    for (int i = 0; i < 7; i++) {
        for (int m = 0; m < 3; m++) {
            setPixel(row + i - 14, col + m + 5, mainColor);
            setPixel(row + i - 14, col + m + 9, mainColor);
        }
    }
}

void drawExtendedLegsL(int row, int col, u16 mainColor) {
    int i = 0;
    while (i > -8) {
        for (int j = 0; j < 8; j++) {
            for (int m = 0; m < 3; m++) {
                setPixel(row + i, col + m + j, mainColor);
            }
            i--;
        }
    }
}

void drawExtendedLegsR(int row, int col, u16 mainColor) {
    int i = 0;
    while (i < 8) {
        for (int j = 0; j < 8; j++) {
            for (int m = 0; m < 3; m++) {
                setPixel(row + i, col + m + j, mainColor);
            }
            i++;
        }
    }
}

void drawSurprise(int row, int col, u16 mainColor) {
    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
            setPixel(row + j, col + i, mainColor);
        }
    }
}

void firstFrame() { //falling
    drawCrabEyes(40, 100, RED, WHITE, BLACK);
    drawCrabEyes(40, 113, RED, WHITE, BLACK);
    drawCrabBody(56, 94, RED);
    drawExtendedArmsL(50, 85, RED);
    drawExtendedArmsR(57, 128, RED);
    drawExtendedLegsL(83, 98, RED);
    drawExtendedLegsL(83, 92, RED);
    drawExtendedLegsL(83, 86, RED);
    drawExtendedLegsR(76, 127, RED);
    drawExtendedLegsR(76, 121, RED);
    drawExtendedLegsR(76, 115, RED);
    drawSurprise(70, 110, BLACK);
    currScreen = 1;
}

void secondFrame() { //standing
    drawCrabEyes(76, 100, RED, WHITE, BLACK);
    drawCrabEyes(76, 113, RED, WHITE, BLACK);
    drawCrabBody(92, 94, RED);
    drawCrabArms(98, 86, RED);
    drawCrabLegsR(112, 126, RED);
    drawCrabLegsR(107, 128, RED);
    drawCrabLegsR(102, 128, RED);
    drawCrabLegsL(114, 92, RED);
    drawCrabLegsL(109, 90, RED);
    drawCrabLegsL(104, 90, RED);
    drawSmileL(100, 102, BLACK);
    drawSmileR(104, 114, BLACK);
    drawInbetween(104, 108, BLACK);
    currScreen = 2;
}

void thirdFrame() { //right
    drawCrabEyes(86, 145, RED, WHITE, BLACK);
    drawCrabEyes(86, 158, RED, WHITE, BLACK);
    drawCrabBody(102, 145, RED);
    drawCrabArms(108, 137, RED);
    drawCrabLegsR(122, 177, RED);
    drawCrabLegsR(117, 179, RED);
    drawCrabLegsR(112, 179, RED);
    drawCrabLegsL(124, 143, RED);
    drawCrabLegsL(119, 141, RED);
    drawCrabLegsL(114, 141, RED);
    drawSurprise(113, 152, BLACK);
    currScreen = 3;
}

void fourthFrame() { //left
    drawCrabEyes(106, 60, RED, WHITE, BLACK);
    drawCrabEyes(106, 73, RED, WHITE, BLACK);
    drawCrabBody(122, 48, RED);
    drawCrabArms(128, 40, RED);
    drawCrabLegsR(142, 80, RED);
    drawCrabLegsR(137, 82, RED);
    drawCrabLegsR(132, 82, RED);
    drawCrabLegsL(144, 46, RED);
    drawCrabLegsL(139, 44, RED);
    drawCrabLegsL(134, 44, RED);
    drawSurprise(133, 74, BLACK);
    currScreen = 4;
}

void waitForVBlank() {
    while (SCANLINECOUNTER > 160);
    while (SCANLINECOUNTER < 160);
}