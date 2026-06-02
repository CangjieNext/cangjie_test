/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>

extern bool testfunc(bool (*a)(bool, bool))
{
    bool res = a(false, true);
    if (res == false) {
        return true;
    } else {
        printf("fail\n");
        return false;
    }
}
