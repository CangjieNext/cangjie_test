/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <stdbool.h>
#include <stdio.h>

struct A {
    int a;
};

struct S {
    struct A *a[3];
};

void test(struct S *s, int n) {
    (*(*s).a[0]).a = 0;
}

// Pass an array
void cfoo1(struct A **a) {
    (*a[0]).a = 0;
}
void cfoo2(struct A *a[4]) {
    (*a[1]).a = 0;
}
void cfoo3(struct A **a) {
    (*a[2]).a = 0;
}
void cfoo4(struct A *a[4]) {
    (*a[3]).a = 0;
}

// return an array
struct A a1 = {1};
struct A a2 = {2};
struct A a3 = {3};
struct A a4 = {4};
struct A *ret[4] = {&a1, &a2, &a3, &a4};
struct A **getArrayPtr() {
    return ret;
}
