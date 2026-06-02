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
// EXEC-PIPE-1: %compiler %cmp_opt p1.%middle p2.%middle %f -o %output 2>&1 | compare %f

package p0

import p2.goo as foo
public import p1.foo

main(): Int64 {
    var a1 = foo(Int8(1))
    var a2 = foo(Int16(1))
    var a3 = foo(Int32(1))
    var a4 = foo(Int64(1))
    var a5 = foo(UInt64(1))
    return 0
}
// ASSERT: scan sema_ambiguous_match
