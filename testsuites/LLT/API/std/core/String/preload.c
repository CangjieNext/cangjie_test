/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// gcc -shared -fPIC -o my_preload.so preload.c
// LD_PRELOAD=./my_preload.so your_target_program

#include <stdio.h>
#include <dlfcn.h>
#include <stdbool.h>

// 假设原始函数的签名是int CJ_CORE_CanUseSIMD(int a, int b)
// 这里我们假设函数只有一个整数参数，并返回一个整数
bool CJ_CORE_CanUseSIMD(void)
{
    return false;
}