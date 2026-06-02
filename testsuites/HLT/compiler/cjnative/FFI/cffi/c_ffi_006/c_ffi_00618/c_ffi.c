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

int testfunc(char* input)
{
    char* eos = input;
    char ch;
    while ((ch = *eos++) != '\0') {
    }
    return (eos - input - 1);
}

void fflushOut(){
    if (fflush(stdout) == EOF) {
        perror("fflush failed");
    }
}
