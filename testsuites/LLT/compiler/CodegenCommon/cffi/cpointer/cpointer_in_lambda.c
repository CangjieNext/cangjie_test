// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

#include <stdint.h>
int64_t varA = 10;
int64_t varB = 20;

int64_t* testA()
{
    return &varA;
}

int64_t* testB()
{
    return &varB;
}
