/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: p1
// EXEC: %compiler %cmp_opt %compile_lib_opt p1/a.cj -o p1.%middle
// EXEC: %compiler %cmp_opt %f p1.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import p1.a as aoo
import p1.b
import p1

main(): Int64 {
    if (p1.b != 2) {
        return 1
    }
    if (aoo != 1) {
        return 1
    }
    if (b != 2) {
        return 1
    }
    return 0
}
