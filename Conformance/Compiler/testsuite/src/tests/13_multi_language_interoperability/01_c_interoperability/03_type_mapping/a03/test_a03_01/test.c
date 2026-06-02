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
    int32_t x;
    int32_t y;
};

struct Point2D func_01() {
    struct Point2D result = { 666, -77 };
    return result;
}
