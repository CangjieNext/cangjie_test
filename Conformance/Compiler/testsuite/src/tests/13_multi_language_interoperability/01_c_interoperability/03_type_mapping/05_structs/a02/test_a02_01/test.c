/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <math.h>
#include <stdint.h>

struct Point2D {
    float x;
    float y;
};

float distance(struct Point2D start, struct Point2D end) {
    float delta_x = (end.x - start.x);
    float delta_y = (end.y - start.y);
    return sqrt(delta_x * delta_x + delta_y * delta_y);
} 
