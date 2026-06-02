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

import p1
import p2

func foo(a: Int8) {
    return 1
}

func foo(a: Int16) {
    return 2
}

func foo(a: Int32) {
    return 3
}

func foo(a: Int64) {
    return 4
}

func foo(a: UInt64) {
    return 5
}

main(): Int64 {
    var a1 = foo(Int8(1))
    var a2 = foo(Int16(1))
    var a3 = foo(Int32(1))
    var a4 = foo(Int64(1))
    var a5 = foo(UInt64(1))
    if (a1 != 1) {
        return 1
    }
    if (a2 != 2) {
        return 2
    }
    if (a3 != 3) {
        return 3
    }
    if (a4 != 4) {
        return 4
    }
    if (a5 != 5) {
        return 5
    }
    var a11 = p1.foo(Int8(1))
    var a12 = p1.foo(Int16(1))
    var a13 = p2.foo(Int32(1))
    var a14 = p2.foo(Int64(1))
    var a15 = foo(Int8(1))
    if (a11 != 11) {
        return 6
    }
    if (a12 != 12) {
        return 7
    }
    if (a13 != 23) {
        return 8
    }
    if (a14 != 24) {
        return 9
    }
    if (a15 != 1) {
        return 10
    }
    return 0
}
