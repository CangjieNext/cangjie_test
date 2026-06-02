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
    double a[3];
};

void test(struct S *s) {
    (*s).a[0] = 0.0;
}

// Pass an array
void cfoo1(double *a) {
    a[0] = 0.0;
}
void cfoo2(double a[4]) {
    a[1] = 0.0;
}
void cfoo3(double *a) {
    a[2] = 0.0;
}
void cfoo4(double a[4]) {
    a[3] = 0.0;
}

// return an array
double ret[4] = {1.0, 2.0, 3.0, 4.0};
double *getArrayPtr() {
    return ret;
}
