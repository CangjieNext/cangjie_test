/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <math.h>
#include <stdint.h>

void func_01(uint8_t buf[10]) {
    for (int64_t i = 0; i < 10; ++i) {buf[i] += 10;}
}

struct Point2D {
    float x;
    float y;
};

void invert(struct Point2D p[]) {
    p[0].x = -p[0].x;
    p[0].y = -p[0].y;
    p[1].x = -p[1].x;
    p[1].y = -p[1].y;
}
