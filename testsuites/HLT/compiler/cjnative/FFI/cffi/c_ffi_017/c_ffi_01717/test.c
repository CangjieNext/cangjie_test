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
    int8_t a[3];
};

void test(struct S *s) {
    (*s).a[0] = 0;
}

// Pass an array
void cfoo1(int8_t *a) {
    a[0] = 0;
}
void cfoo2(int8_t a[4]) {
    a[1] = 0;
}
void cfoo3(int8_t *a) {
    a[2] = 0;
}
void cfoo4(int8_t a[4]) {
    a[3] = 0;
}

// return an array
int8_t ret[4] = {1, 2, 3, 4};
int8_t *getArrayPtr() {
    return ret;
}
