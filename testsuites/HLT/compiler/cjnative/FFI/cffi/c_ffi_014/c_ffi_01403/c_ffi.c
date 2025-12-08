/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <securec.h>

char* testfunc(char* input)
{
    char* b = "World\n";
    int inputSize = strlen(input);
    int resSize = inputSize + strlen(b) + 1;
    char* res = (char*)malloc(resSize);
    if (res == NULL) {
        return NULL;
    }
    strcpy_s(res, resSize, input);
    strcat_s(res, resSize, b);
    return res;
}

void fflushOut(){
    if (fflush(stdout) == EOF) {
        perror("fflush failed");
    }
}
