// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>

typedef bool (*callback_t)(int8_t* arg);

void xxx(callback_t cb, int8_t* arg)
{
    cb(arg);
}

bool cb(int8_t* arg)
{
    printf("arg: %ld\n", arg);
    if (arg == NULL) {
        return false;
    }
    return true;
}
