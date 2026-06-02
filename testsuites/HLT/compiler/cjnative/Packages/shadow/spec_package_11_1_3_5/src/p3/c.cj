/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../p1 ../p2 ../p3
// EXEC: %compiler %cmp_opt %compile_lib_opt ./p1/*.cj -o p1.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt ./p2/*.cj -o p2.%middle
// EXEC: %compiler %cmp_opt p1.%middle p2.%middle %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

package p3

import p1.Num
import p2.*

main(): Int64 {
    var a1 = Int32(1).add(2) // OK, interface Num is re-exported by pkg2.
    var c = C() // OK, C is re-exported by pkg2.
    if (a1 != 3) {
        return 1
    }
    if (c.c != 1) {
        return 2
    }
    return 0
}
