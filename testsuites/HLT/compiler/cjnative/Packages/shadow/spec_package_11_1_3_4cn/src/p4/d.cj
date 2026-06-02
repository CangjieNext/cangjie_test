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
// EXEC: %compiler %cmp_opt %compile_lib_opt ./p3/*.cj -o p3.%middle
// EXEC-PIPE-1: %compiler %cmp_opt p1.%middle p2.%middle p3.%middle %f -o %output 2>&1 | compare %f

import p1.foo // Shadow
import p2.foo // Shadow
import p3.foo // Shadow

func foo(a: UInt64) {
    return 5
} // f5

main(): Int64 {
    foo(Int32(1))
    foo(Int16(1))
    foo(Int8(1))
    foo(Int64(1))
    foo()
    return 0
}
// ASSERT: scan sema_ambiguous_use
