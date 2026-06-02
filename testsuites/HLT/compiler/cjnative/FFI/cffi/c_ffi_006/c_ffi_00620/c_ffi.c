/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <stdint.h>
#include <stdio.h>
#include <string.h>

int testfunc(char* a, char* b, char* c, char* d, char* e) {
    char* temp = a;
    while (*temp != '\0') {temp++;}
    while ((*temp++ = *b++) != '\0') {}
    char* temp1 = a;
    while (*temp1 != '\0') {temp1++;}
    while ((*temp1++ = *c++) != '\0') {}
    char* temp2 = a;
    while (*temp2 != '\0') {temp2++;}
    while ((*temp2++ = *d++) != '\0') {}
    char* temp3 = a;
    while (*temp3 != '\0') {temp3++;}
    while ((*temp3++ = *e++) != '\0') {}
    char *eos = a;
    char ch;
    while ((ch = *eos++) != '\0') {}
    return ( eos - a - 1 );
}
