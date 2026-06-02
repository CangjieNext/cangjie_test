/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../p1 ../p2
// EXEC: %compiler %cmp_opt %compile_lib_opt ./p1/*.cj -o p1.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt ./p2/*.cj -o p2.%middle
// EXEC: %compiler %cmp_opt p1.%middle p2.%middle %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

package p0

public import p1.foo
import p2.goo as foo

main(): Int64 {
    var a1 = foo(Int8(1))
    var a2 = foo(Int16(1))
    var a3 = foo(Int32(1))
    var a4 = foo(Int64(1))
    var a5 = foo(UInt64(1))
    if (a1 != 11) {
        return 1
    }
    if (a2 != 12) {
        return 2
    }
    if (a3 != 13) {
        return 3
    }
    if (a4 != 14) {
        return 4
    }
    if (a5 != 25) {
        return 5
    }
    return 0
}
