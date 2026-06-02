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
#include <stddef.h>

char* testfunc(char* input)
{
    char* b = "World\n";
    size_t inputSize = strlen(input);
    char* res = (char*)malloc(inputSize + strlen(b) + 1);
    if (res == NULL) {
        return NULL;
    }
    strcpy(res, input);
    strcat(res, b);
    return res;
}

void fflushOut()
{
    if (fflush(stdout) == EOF) {
        perror("fflush failed");
    }
}