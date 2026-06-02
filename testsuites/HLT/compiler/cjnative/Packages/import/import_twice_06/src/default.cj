/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: p1
// EXEC: %compiler %cmp_opt %compile_lib_opt p1/a.cj -o a.%middle
// EXEC: %compiler %cmp_opt %f a.%middle -o %output 2>&1
// RUN-EXEC: %run %run_opt %output %run_args

import p1
import p1.a
import p1.a as aoo

main(): Int64 {
    if (a != 1) {
        return 1
    }
    if (aoo != 1) {
        return 1
    }
    if (p1.a != 1) {
        return 1
    }
    return 0
}
