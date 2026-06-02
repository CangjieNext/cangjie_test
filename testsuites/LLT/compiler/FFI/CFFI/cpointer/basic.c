// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
#include <stdio.h>
#include <stdlib.h>

size_t* getCPtrInt(size_t num)
{
    size_t* a = (size_t*)malloc(sizeof(size_t));
    a[0] = num;
    return a;
}
