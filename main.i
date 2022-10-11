# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
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
# 2 "main.c" 2
# 1 "print.h" 1
# 26 "print.h"
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 1 3 4
# 9 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 1 3 4
# 12 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 1 3 4







# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 1 3 4
# 28 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_newlib_version.h" 1 3 4
# 29 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 2 3 4
# 9 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 2 3 4
# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4

# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int8_t;

typedef unsigned char __uint8_t;
# 55 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int16_t;

typedef short unsigned int __uint16_t;
# 77 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int32_t;

typedef long unsigned int __uint32_t;
# 103 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int64_t;

typedef long long unsigned int __uint64_t;
# 134 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int_least8_t;

typedef unsigned char __uint_least8_t;
# 160 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int_least16_t;

typedef short unsigned int __uint_least16_t;
# 182 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int_least32_t;

typedef long unsigned int __uint_least32_t;
# 200 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int_least64_t;

typedef long long unsigned int __uint_least64_t;
# 214 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __intmax_t;







typedef long long unsigned int __uintmax_t;







typedef int __intptr_t;

typedef unsigned int __uintptr_t;
# 13 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 1 3 4
# 35 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 187 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 14 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 1 3 4
# 20 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 3 4
typedef __int8_t int8_t ;



typedef __uint8_t uint8_t ;







typedef __int16_t int16_t ;



typedef __uint16_t uint16_t ;







typedef __int32_t int32_t ;



typedef __uint32_t uint32_t ;







typedef __int64_t int64_t ;



typedef __uint64_t uint64_t ;






typedef __intmax_t intmax_t;




typedef __uintmax_t uintmax_t;




typedef __intptr_t intptr_t;




typedef __uintptr_t uintptr_t;
# 15 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4






typedef __int_least8_t int_least8_t;
typedef __uint_least8_t uint_least8_t;




typedef __int_least16_t int_least16_t;
typedef __uint_least16_t uint_least16_t;




typedef __int_least32_t int_least32_t;
typedef __uint_least32_t uint_least32_t;




typedef __int_least64_t int_least64_t;
typedef __uint_least64_t uint_least64_t;
# 51 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast8_t;
  typedef unsigned int uint_fast8_t;
# 61 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast16_t;
  typedef unsigned int uint_fast16_t;
# 71 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast32_t;
  typedef unsigned int uint_fast32_t;
# 81 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef long long int int_fast64_t;
  typedef long long unsigned int uint_fast64_t;
# 10 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 2 3 4
# 27 "print.h" 2
# 36 "print.h"

# 36 "print.h"
void mgba_printf_level(int level, const char* ptr, ...);
void mgba_printf(const char* string, ...);
void mgba_break(void);
uint8_t mgba_open(void);
void mgba_close(void);
# 3 "main.c" 2

void initialize();
void update();
void waitForVBlank();
void draw();
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
    (*(volatile u16 *) 0x04000000) = 3 | (1<<10);

    buttons = (*(volatile u16 *)0x04000130);
    oldButtons = 0;


    drawSky(0, 0, 240, 35);
    drawSand(0, 0, 240, 160);
}

int main() {
    currFrame = 0;
    isLooping = 0;
    direction = 1;

    mgba_open();
    mgba_printf("Debugging initialized");

    initialize();
    while (1) {
        update();
        if (isLooping && (direction != 0)) {
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
        if (isLooping && (direction == 0)) {
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
        buttons = (*(volatile u16 *)0x04000130);
        waitForVBlank();
        draw();
    }
}

void update() {
    if (((!(~oldButtons & ((1<<0)))) && (~buttons & ((1<<0))))) {
        mgba_printf("button a pressed");
        if (currFrame == 3) {
            currFrame = 0;
            changed = 1;
        } else {
            currFrame++;
            changed = 1;
        }
    }
    if (((!(~oldButtons & ((1<<1)))) && (~buttons & ((1<<1))))) {
        mgba_printf("button b pressed");
        if (currFrame == 0) {
            currFrame = 3;
            changed = 1;
        } else {
            currFrame--;
            changed = 1;
        }
    }
    if (((!(~oldButtons & ((1<<3)))) && (~buttons & ((1<<3))))) {
        mgba_printf("start pressed");
        timeStep = 50;
        isLooping = !(isLooping);
    }
    if (((!(~oldButtons & ((1<<2)))) && (~buttons & ((1<<2))))) {
        timeStep = 50;
        direction = !(direction);
    }
    if (((!(~oldButtons & ((1<<5)))) && (~buttons & ((1<<5))))) {
        timeStep = 50;
        currFrame = 0;
        changed = 1;
    }
    if (((!(~oldButtons & ((1<<4)))) && (~buttons & ((1<<4))))) {
        timeStep = 50;
        currFrame = 3;
        changed = 1;
    }
    if (((!(~oldButtons & ((1<<6)))) && (~buttons & ((1<<6))))) {
        time = 0;
        if (timeStep > 26) {
            mgba_printf("increment timestep by 5");
            timeStep -= 5;
            mgba_printf("timeStep: %d", timeStep);
        }
    }
    if (((!(~oldButtons & ((1<<7)))) && (~buttons & ((1<<7))))) {
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
    drawSky(0, 0, 240, 35);
    drawSand(0, 0, 240, 160);
}
