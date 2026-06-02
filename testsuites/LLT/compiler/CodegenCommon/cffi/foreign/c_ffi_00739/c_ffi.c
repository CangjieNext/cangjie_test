// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

#include <inttypes.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

typedef struct {
    int8_t i8;
    uint8_t ui8;
} teststruct;

teststruct* AllocCStruct()
{
    teststruct* p = malloc(sizeof(teststruct));
    return p;
}

teststruct* testfunc()
{
    teststruct struct1 = {0, 0};
    struct teststruct* ptr = &struct1;
    return ptr;
}
