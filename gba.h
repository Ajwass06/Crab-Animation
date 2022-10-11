#ifndef GBA_H
#define GBA_H

//typeDef
typedef unsigned short u16;

//macros
#define OFFSET(col, row, rowLength) ((row) * (rowLength) + (col))
#define COLOR(r, g, b) ((r) | (g) << 5 | (b) << 10)
#define WHITE           COLOR(31, 31, 31)
#define BLACK           COLOR(0, 0, 0)
#define BLUE            COLOR(0, 0, 31)
#define RED             COLOR(31, 0, 0)
#define YELLOW          COLOR(31, 31, 0)
#define CYAN            COLOR(0, 31, 31)

//display macros
#define REG_DISPCTL     (*(volatile u16 *) 0x04000000)
#define MODE_3          3
#define BG2_ENABLE      (1<<10)
#define SCANLINECOUNTER (*(volatile u16 *) 0x04000006)
#define SCREENHEIGHT    160
#define SCREENWIDTH     240

extern volatile u16 *videoBuffer;

//functions
void firstFrame(); //which functions do I put here?
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
// int loop();

//user input macros/variables
#define BUTTONS         (*(volatile u16 *)0x04000130)
#define BUTTON_A        (1<<0)
#define BUTTON_B        (1<<1)
#define BUTTON_SELECT   (1<<2)
#define BUTTON_START    (1<<3)
#define BUTTON_RIGHT    (1<<4)
#define BUTTON_LEFT     (1<<5)
#define BUTTON_UP       (1<<6)
#define BUTTON_DOWN     (1<<7)
#define BUTTON_R        (1<<8)
#define BUTTON_L        (1<<9)

extern u16 oldButtons;
extern u16 buttons;
//extern int currScreen;

#define BUTTON_HELD(key)    (~BUTTONS & (key))
#define BUTTON_PRESSED(key) ((!(~oldButtons & (key))) && (~buttons & (key)))

#endif