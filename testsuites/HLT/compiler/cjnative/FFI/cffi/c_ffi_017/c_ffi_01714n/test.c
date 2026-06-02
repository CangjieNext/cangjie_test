/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <stdint.h>
#include <stdio.h>

// Pass an array
void cfoo1(int** a)
{
    *((int*)a) = 0;
}
void cfoo2(int a[1][3])
{
    a[0][0] = 0;
}

// return an array
int ret[1][3] = {{1, 2, 3}};
int** getArrayPtr()
{
    return ret;
}
