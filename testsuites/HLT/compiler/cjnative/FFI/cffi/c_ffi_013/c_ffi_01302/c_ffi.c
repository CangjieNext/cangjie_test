/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <stdint.h>

double nativeFun(double (*callback)(double, double, double, double, double, double, double, double, double, double))
{
    return callback(4, 8, 15, 16, 23, 42, 108, -1, 37, 3.14159265);
}
