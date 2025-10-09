/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <stdio.h>

const int MAX = 3;

typedef int (*CFunc_int)();
typedef char (*CFunc_char)();
typedef short (*CFunc_short)();
typedef long (*CFunc_long)(long);
typedef float (*CFunc_float)(float);
typedef double (*CFunc_double)();

char* StringFromC(){
    printf("String pointer from C. \n");
    static char site[] = "StringFromC";
    char* p = &site[0];
    printf("地址为：%s\n", p);
    printf("数据为：%c\n", site[0]);
    return p;
}

int* IntPointerFromC(){
    printf("Int pointer from C. \n");
    static int var_int = -154;
    int* p = &var_int;
    return p;
}

short* PointerFromShort(){
    printf("short pointer from C. \n");
    static short var_short = 124;
    short* p = &var_short;
    return p;
}

long* PointerFromLong(){
    printf("long pointer from C. \n");
    static long var_long = 120000;
    long* p = &var_long;
    return p;
}

float* PointerFromFloat(){
    static float vf = 5.0154f;
    float* p = &vf;
    return p;
}

double* PointerFromDouble(){
    static double vd = 78.45688;
    double* p = &vd;
    return p;
}

//空指针
int* PointerFromVoid(){
    static int* ptr = NULL;
    return ptr;
}

//指向指针的指针
int** PointerFromPointer(){
    static int var, *pt1, **pt2;
    var = 120;
    pt1 = &var;
    pt2 = &pt1;
    return pt2;
}

int* PointerFromArr(){
    static int var_1[] = {10, 100, 200};
    int i, *ptr[MAX];
    for (i = 0; i < MAX; i++)
     {
        ptr[i] = &var_1[i]; /* 赋值为整数的地址 */
    }
    return ptr[0];
}

int IntFromC(){
    printf("Int from C. \n");
    return 100;
}

int IntFromC_2(int para_I){
    printf("Int from C. \n");
    return para_I;
}

char CharFromC(){
    printf("Rune from C. \n");
    return 'J';
}

short shortFromC(){
    printf("short from C. \n");
    return 2;
}

long longFromC(long para_l){
    printf("long from C. \n");
    return para_l;
}

float floatFromC(float para_f){
    printf("float from C. \n");
    return para_f;
}

double doubleFromC(double para_d){
    printf("double from C. \n");
    return para_d;
}

struct stu {
    char* name;  //姓名
    int num;  //学号
    int age;  //年龄
};

struct stu structFromC(){
    struct stu stu1;
    stu1.name = "Tom";
    stu1.num = 123456;
    stu1.age = 18;
    return stu1;
}

CFunc_int getFuncPtr_I()
{
    printf("Function from C. \n");
    return IntFromC;

}

int getFuncPtr_I2(int para_I)
{
    int vI = IntFromC_2(para_I);
    // int (* p)(int) = & vI;
    return vI;
}

CFunc_char getFuncPtr_C()
{
    printf("Function from C. \n");
    return CharFromC;

}

CFunc_short getFuncPtr_S()
{
    printf("Function from C. \n");
    return shortFromC;

}

CFunc_long getFuncPtr_L()
{
    printf("Function from C. \n");
    return longFromC;


}

CFunc_float getFuncPtr_F()
{
    printf("Function from C. \n");
    return floatFromC;


}

CFunc_double getFuncPtr_D()
{
    printf("Function from C. \n");
    return doubleFromC;


}

typedef void (*callback)(int);
int set_callback(callback cb)
{
    return 120110;
};
