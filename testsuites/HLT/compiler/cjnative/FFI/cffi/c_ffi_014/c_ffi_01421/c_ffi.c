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
char* testfunc(char* input)
{
    char* b = "World\n";
    int inputSize = strlen(input);
    int resSize = inputSize + strlen(b) + 1;
    char* res = (char*)malloc(resSize);
    if (res == NULL) {
        return NULL;
    }
    strcpy(res, input);
    strcat(res, b);
    return res;
}

void fflushOut(){
    if (fflush(stdout) == EOF) {
        perror("fflush failed");
    }
}
