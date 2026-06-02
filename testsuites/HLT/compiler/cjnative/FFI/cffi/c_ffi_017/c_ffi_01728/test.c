/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <stdbool.h>
#include <stdio.h>

struct S {
    char *a[3];
};

void test(struct S *s) {
    (*s).a[0] = "0";
}

// Pass an array
void cfoo1(char **a) {
    a[0] = "0";
}
void cfoo2(char *a[4]) {
    a[1] = "0";
}
void cfoo3(char **a) {
    a[2] = "0";
}
void cfoo4(char *a[4]) {
    a[3] = "0";
}

// return an array
char* ret[4] = {"0", "1", "2", "3"};
char **getArrayPtr() {
    return ret;
}
