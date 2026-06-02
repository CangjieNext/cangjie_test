// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
#include <stdint.h>
#include <stdio.h>

int32_t ComparePrintf(int8_t* ptr)
{
    int8_t* p1 = (int8_t*)printf;
    if (p1 != ptr) {
        return 1;
    }
    return 0;
}

typedef int32_t (*func_t)();
typedef int32_t (*func_t2)(const char*);

int32_t ExecuteRandInC_1(func_t f)
{
    return f();
}

int32_t ExecuteRandInC_2(void* ptr)
{
    func_t f = (func_t)ptr;
    return f();
}

int32_t ExecuteRandInC_3(void* ptr)
{
    func_t f = (func_t2)ptr;
    return f("Hello World\n");
}
