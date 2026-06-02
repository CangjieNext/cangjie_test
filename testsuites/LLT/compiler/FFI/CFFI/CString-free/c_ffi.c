// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

char* testfunc(char* a) {
    char* b = " World\n";
    int len = strlen(a) + strlen(b) + 1;
    char* ret = malloc(len * sizeof(char));

    char* temp = ret;
    while (*a != '\0') {
        *temp++ = *a++;
    }
    while ((*temp++ = *b++) != '\0');
    *temp = 0;

    return ret;
}

void fflushOut(){
    fflush(stdout);
}
