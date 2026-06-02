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
// EXEC-PIPE-1: %compiler %cmp_opt a.%middle b.%middle %f -o %output 2>&1 | compare %f

package p0

import p1
import p2

var foo = 1

main(): Int64 {
    var a1 = foo
    var a2 = foo
    var a3 = p1.foo
    var a4 = p2.foo
    if (a1 != 1) {
        return 1
    }
    return 0
}
// ASSERT: scan sema_ambiguous_use
