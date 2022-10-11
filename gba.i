# 1 "gba.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "gba.c"
# 1 "gba.h" 1




typedef unsigned short u16;
# 25 "gba.h"
extern volatile u16 *videoBuffer;


void firstFrame();
void drawExtendedArmsL(int row, int col, u16 mainColor);
void drawExtendedArmsR(int row, int col, u16 mainColor);
void drawExtendedLegsL(int row, int col, u16 mainColor);
void drawExtendedLegsR(int row, int col, u16 mainColor);
void secondFrame();
void setPixel(int row, int col, u16 color);
void fillScreen(volatile u16 color);
void drawSky(int row, int col, int width, int height);
void drawSand(int row, int col, int width, int height);
void drawCrabEyes(int row, int col, u16 mainColor, u16 color2, u16 color3);
void drawCrabBody(int row, int col, u16 mainColor);
void drawCrabArms(int row, int col, u16 mainColor);
void drawCrabLegsR(int row, int col, u16 mainColor);
void drawCrabLegsL(int row, int col, u16 mainColor);
void drawSmileL(int row, int col, u16 mainColor);
void drawSmileR(int row, int col, u16 mainColor);
void drawInbetween(int row, int col, u16 mainColor);
void thirdFrame();
void fourthFrame();
void waitForVBlank();
# 64 "gba.h"
extern u16 oldButtons;
extern u16 buttons;
# 2 "gba.c" 2

volatile u16 *videoBuffer = (u16 *)0x06000000;

extern int currScreen;

void setPixel(int row, int col, u16 color) {
    videoBuffer[((row) * (240) + (col))] = color;
}

void fillScreen(u16 color) {
    for (int i = 0; i < 38400; i++) {
        videoBuffer[i] = color;
    }
}

void drawSky(int row, int col, int width, int height) {
    for (int i = 0; i < height; i++) {
        for (int j = 0; j < width; j++) {
            setPixel(row + i, col + j, ((0) | (0) << 5 | (31) << 10));
        }
    }
}

void drawSand(int row, int col, int width, int height) {
    for (int i = 35; i < height; i++) {
        for (int j = 0; j < width; j++) {
            setPixel(row + i, col + j, ((31) | (31) << 5 | (0) << 10));
        }
    }
}

void drawCrabEyes(int row, int col, u16 mainColor, u16 color2, u16 color3) {
    for (int i = 0; i < 9; i ++) {
        setPixel(row, col + i, mainColor);
        setPixel(row + 8, col + i, mainColor);
        setPixel(row + 1, col + i, color2);
        setPixel(row + 7, col + i, color2);
        for (int m = 0; m < 9; m++) {
            setPixel(row + m, col, mainColor);
            setPixel(row + m, col + 1, mainColor);
            setPixel(row + m, col + 8, mainColor);
            setPixel(row + m, col + 9, mainColor);
        }
        for (int j = 1; j < 8; j++) {
            setPixel(row + j, col + 2, color2);
            setPixel(row + j, col + 3, color2);
            setPixel(row + j, col + 6, color2);
            setPixel(row + j, col + 7, color2);
        }
        for (int n = 2; n < 7; n++) {
            setPixel(row + n, col + 4, color3);
            setPixel(row + n, col + 5, color3);
        }
    }
    for (int i = 0; i < 7; i++) {
        for (int j = 0; j < 2; j++) {
            setPixel(row + 9 + i, col + j + 4, mainColor);
        }
    }
}

void drawCrabBody(int row, int col, u16 mainColor) {
    for (int i = 0; i < 35; i++) {
        for (int j = 0; j < 20; j++) {
            setPixel(row + j, col + i, mainColor);
        }
    }
}

void drawCrabArms(int row, int col, u16 mainColor) {
    for (int i = 0; i < 8; i++) {
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

void firstFrame() {
    drawCrabEyes(40, 100, ((31) | (0) << 5 | (0) << 10), ((31) | (31) << 5 | (31) << 10), ((0) | (0) << 5 | (0) << 10));
    drawCrabEyes(40, 113, ((31) | (0) << 5 | (0) << 10), ((31) | (31) << 5 | (31) << 10), ((0) | (0) << 5 | (0) << 10));
    drawCrabBody(56, 94, ((31) | (0) << 5 | (0) << 10));
    drawExtendedArmsL(50, 85, ((31) | (0) << 5 | (0) << 10));
    drawExtendedArmsR(57, 128, ((31) | (0) << 5 | (0) << 10));
    drawExtendedLegsL(83, 98, ((31) | (0) << 5 | (0) << 10));
    drawExtendedLegsL(83, 92, ((31) | (0) << 5 | (0) << 10));
    drawExtendedLegsL(83, 86, ((31) | (0) << 5 | (0) << 10));
    drawExtendedLegsR(76, 127, ((31) | (0) << 5 | (0) << 10));
    drawExtendedLegsR(76, 121, ((31) | (0) << 5 | (0) << 10));
    drawExtendedLegsR(76, 115, ((31) | (0) << 5 | (0) << 10));
    drawSurprise(70, 110, ((0) | (0) << 5 | (0) << 10));
    currScreen = 1;
}

void secondFrame() {
    drawCrabEyes(76, 100, ((31) | (0) << 5 | (0) << 10), ((31) | (31) << 5 | (31) << 10), ((0) | (0) << 5 | (0) << 10));
    drawCrabEyes(76, 113, ((31) | (0) << 5 | (0) << 10), ((31) | (31) << 5 | (31) << 10), ((0) | (0) << 5 | (0) << 10));
    drawCrabBody(92, 94, ((31) | (0) << 5 | (0) << 10));
    drawCrabArms(98, 86, ((31) | (0) << 5 | (0) << 10));
    drawCrabLegsR(112, 126, ((31) | (0) << 5 | (0) << 10));
    drawCrabLegsR(107, 128, ((31) | (0) << 5 | (0) << 10));
    drawCrabLegsR(102, 128, ((31) | (0) << 5 | (0) << 10));
    drawCrabLegsL(114, 92, ((31) | (0) << 5 | (0) << 10));
    drawCrabLegsL(109, 90, ((31) | (0) << 5 | (0) << 10));
    drawCrabLegsL(104, 90, ((31) | (0) << 5 | (0) << 10));
    drawSmileL(100, 102, ((0) | (0) << 5 | (0) << 10));
    drawSmileR(104, 114, ((0) | (0) << 5 | (0) << 10));
    drawInbetween(104, 108, ((0) | (0) << 5 | (0) << 10));
    currScreen = 2;
}

void thirdFrame() {
    drawCrabEyes(86, 145, ((31) | (0) << 5 | (0) << 10), ((31) | (31) << 5 | (31) << 10), ((0) | (0) << 5 | (0) << 10));
    drawCrabEyes(86, 158, ((31) | (0) << 5 | (0) << 10), ((31) | (31) << 5 | (31) << 10), ((0) | (0) << 5 | (0) << 10));
    drawCrabBody(102, 145, ((31) | (0) << 5 | (0) << 10));
    drawCrabArms(108, 137, ((31) | (0) << 5 | (0) << 10));
    drawCrabLegsR(122, 177, ((31) | (0) << 5 | (0) << 10));
    drawCrabLegsR(117, 179, ((31) | (0) << 5 | (0) << 10));
    drawCrabLegsR(112, 179, ((31) | (0) << 5 | (0) << 10));
    drawCrabLegsL(124, 143, ((31) | (0) << 5 | (0) << 10));
    drawCrabLegsL(119, 141, ((31) | (0) << 5 | (0) << 10));
    drawCrabLegsL(114, 141, ((31) | (0) << 5 | (0) << 10));
    drawSurprise(113, 152, ((0) | (0) << 5 | (0) << 10));
    currScreen = 3;
}

void fourthFrame() {
    drawCrabEyes(106, 60, ((31) | (0) << 5 | (0) << 10), ((31) | (31) << 5 | (31) << 10), ((0) | (0) << 5 | (0) << 10));
    drawCrabEyes(106, 73, ((31) | (0) << 5 | (0) << 10), ((31) | (31) << 5 | (31) << 10), ((0) | (0) << 5 | (0) << 10));
    drawCrabBody(122, 48, ((31) | (0) << 5 | (0) << 10));
    drawCrabArms(128, 40, ((31) | (0) << 5 | (0) << 10));
    drawCrabLegsR(142, 80, ((31) | (0) << 5 | (0) << 10));
    drawCrabLegsR(137, 82, ((31) | (0) << 5 | (0) << 10));
    drawCrabLegsR(132, 82, ((31) | (0) << 5 | (0) << 10));
    drawCrabLegsL(144, 46, ((31) | (0) << 5 | (0) << 10));
    drawCrabLegsL(139, 44, ((31) | (0) << 5 | (0) << 10));
    drawCrabLegsL(134, 44, ((31) | (0) << 5 | (0) << 10));
    drawSurprise(133, 74, ((0) | (0) << 5 | (0) << 10));
    currScreen = 4;
}

void waitForVBlank() {
    while ((*(volatile u16 *) 0x04000006) > 160);
    while ((*(volatile u16 *) 0x04000006) < 160);
}
