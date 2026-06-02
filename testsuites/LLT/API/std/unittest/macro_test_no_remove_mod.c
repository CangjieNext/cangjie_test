/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <stdlib.h>
#include <stdint.h>
#include <stdio.h>

char* testfunc() {
    char* ptr = (char*)malloc(sizeof(char) * 10);
    ptr[0] = 'a';
    ptr[1] = 'b';
    ptr[2] = 'c';
    return ptr;
}
