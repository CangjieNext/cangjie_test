/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <stdlib.h>
long* pointer(void)
{
    long* a = (long*)malloc(sizeof(long));
    return a;
}

long* pointer_2(void)
{
    long* a = (long*)malloc(sizeof(long) * 2);
    return a;
}
