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

void testfunc(char* a, char* b) {
    char *ret = a;  //[3]
    while ((*a++ = *b++) != '\0') {} //[4]
}
void fflushOut(){
    if (fflush(stdout) == EOF) {
        perror("fflush failed");
    }
}
