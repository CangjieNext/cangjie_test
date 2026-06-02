/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../p1 ../p2
// EXEC: %compiler %cmp_opt %compile_lib_opt ./p1/*.cj -o a.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt ./p2/*.cj -o b.%middle
// EXEC: %compiler %cmp_opt a.%middle b.%middle %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

package p3

import p1
import p2

main() {
    let b = p1.C() // OK, class C in package p1 is used.
    let c = p2.C() // OK, class C in package p1 is used.
    if (b.c12 != 1) {
        return 1
    }
    if (c.c22 != 2) {
        return 2
    }
    return 0
}
