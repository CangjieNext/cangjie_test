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
    int32_t i32;
    int64_t i64;
};

int8_t testfunc(struct teststruct st)
{
    if ((st.i32 == 2147483647) && (st.i64 == 9223372036854770000)) {
        printf("pass\n");
    }

    return 0;
}
