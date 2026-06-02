/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <stdint.h>
#include <stdio.h>

struct S {
    float a[3];
};

void test(struct S *s) {
    (*s).a[0] = 0.0;
}

// Pass an array
void cfoo1(float *a) {
    a[0] = 0.0;
}
void cfoo2(float a[4]) {
    a[1] = 0.0;
}
void cfoo3(float *a) {
    a[2] = 0.0;
}
void cfoo4(float a[4]) {
    a[3] = 0.0;
}

// return an array
float ret[4] = {1.0, 2.0, 3.0, 4.0};
float *getArrayPtr() {
    return ret;
}
