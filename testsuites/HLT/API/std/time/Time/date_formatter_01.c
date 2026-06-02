/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <time.h>

char* getSymbolA()
{
    char* c[] = {",", "/", "-", "#", "@", "%", "^", "&", "*", "_", "=", "+"};
    int len = sizeof(c)/sizeof(c[0]);
    
    time_t now = time(NULL);
    if (now == (time_t)(-1)) {
        perror("time failed");
        return NULL;
    }
    
    srand((unsigned)now);
    int n = rand() % 12;

    return c[n];
}

char* getSymbolB()
{
    char* c[] = {"/", "-", "#", "@", "%", "^", "&", "*", "_", "=", "+", ","};
    int len = sizeof(c)/sizeof(c[0]);
    
    time_t now = time(NULL);
    if (now == (time_t)(-1)) {
        perror("time failed");
        return NULL;
    }
    
    srand((unsigned)now);
    int n = rand() % 12;

    return c[n];
}

void strcat_new(char* dst, size_t dst_sz, const char* src)
{
    size_t dst_len = strlen(dst);
    size_t src_len = strlen(src);
    if (dst_len + src_len + 1 > dst_sz) {
        printf("overflow!");
        return;
    }
    strcpy(dst + dst_len, src);
}

char* getDate(char* y, char* symA, char* m, char* symB, char* d)
{
    size_t num = (size_t)(strlen(y) + strlen(symA) + strlen(m) + strlen(symB) + strlen(d) + 1);
    char* date = (char*)calloc(num, sizeof(char));

    strcat_new(date, num, y);
    strcat_new(date, num, symA);
    strcat_new(date, num, m);
    strcat_new(date, num, symB);
    strcat_new(date, num, d);

    return date;
}