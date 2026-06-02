/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <stdint.h>

struct Data
{
    int32_t a;
    int32_t b;
};

struct Data getData(int32_t a, int32_t b)
{
    struct Data data;
    data.a = a - b;
    data.b = a + b;
    return data;
}
