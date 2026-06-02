/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: p1
// EXEC: %compiler %cmp_opt %compile_lib_opt ./p1/*.cj -o p1.%middle
// EXEC: %compiler %cmp_opt p1.%middle %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import p1.{A, a, b}

main(): Int64 {
    var r1 = a.a
    a.a = 2
    var r2 = a.a
    var r3 = b.a
    b.a = 3
    var r4 = b.a
    if (r1 != 1) {
        return 1
    }
    if (r2 != 2) {
        return 2
    }
    if (r3 != 2) {
        return 2
    }
    if (r4 != 3) {
        return 3
    }
    var r5 = a.b
    var r6 = b.b
    if (r5 != 1) {
        return 4
    }
    if (r6 != 2) {
        return 5
    }
    return 0
}
