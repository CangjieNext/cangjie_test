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
#include <stdlib.h>
#include <stddef.h>

char* testfunc()
{
    char* str = "Hello World\n";
    size_t inputSize = strlen(str);
    char* res = (char*)malloc(inputSize + 1);
    if (res == NULL) {
        return NULL;
    }
    char* temp = res;
    while ((*temp++ = *str++) != '\0') {}
    *temp = '\0';
    return res;
}

void fflushOut(){
    if (fflush(stdout) == EOF) {
        perror("fflush failed");
    }
}
