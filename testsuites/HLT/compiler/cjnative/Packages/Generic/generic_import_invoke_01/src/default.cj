/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: p1 p2
// EXEC: %compiler %cmp_opt %compile_lib_opt ./p1/*.cj -o p1.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt ./p2/*.cj -o p2.%middle
// EXEC: %compiler %cmp_opt p1.%middle p2.%middle %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import p1
import p1.goo
import p2
import p2.*

main(): Int64 {
    var a = p1.foo<Int8>(1)
    var b = goo<Int8>(1)
    var c = p2.foo<Int8>(1)
    var d = hoo<Int8>(1)
    if (a != 1) {
        return 1
    }
    if (b != 1) {
        return 1
    }
    if (c != 1) {
        return 1
    }
    if (d != 1) {
        return 1
    }
    return 0
}
