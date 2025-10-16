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

char* testfunc(char* a, char* b) {
    int inputSize = strlen(a);
    int resSize = inputSize + 7 + 1;
    char* res = (char*)malloc(resSize);
    if (res == NULL) {
        return NULL;
    }
    char* temp = res;
    strcpy(res, a);
    strcat(res, b);
    return res;
}
