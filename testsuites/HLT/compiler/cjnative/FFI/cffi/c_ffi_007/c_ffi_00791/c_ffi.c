/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

float* testfunc1()
{
    float* ptr = (float*)malloc(sizeof(float) * 3);
    if (ptr == NULL) {
        return NULL;
    }
    ptr[0] = 1.0;
    ptr[1] = 2.0;
    ptr[2] = 3.0;
    return ptr;
}

double* testfunc2()
{
    double* ptr = (double*)malloc(sizeof(double) * 3);
    if (ptr == NULL) {
        return NULL;
    }
    ptr[0] = 3.0;
    ptr[1] = 2.0;
    ptr[2] = 1.0;
    return ptr;
}
