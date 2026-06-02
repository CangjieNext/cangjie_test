/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>

extern void testfunc1(void (*a)(double, double)) {
    a(1, 2);
}

extern void testfunc2(void (*a)(double, double)) {
    a(1, 2);
}

extern void testfunc3(void (*a)(double, double)) {
    a(1, 2);
}
