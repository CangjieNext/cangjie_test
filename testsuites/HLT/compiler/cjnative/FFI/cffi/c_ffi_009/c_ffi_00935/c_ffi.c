/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <inttypes.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>

struct teststruct {
    uint64_t ui64;
    bool b;
};

int8_t testfunc(struct teststruct st)
{
    if ((st.ui64 == 18446744073709500000) && (st.b = true)) {
        printf("pass\n");
    }

    return 0;
}
