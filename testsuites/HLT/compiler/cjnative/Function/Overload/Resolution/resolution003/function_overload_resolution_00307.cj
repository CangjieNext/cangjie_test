/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

open class A {}

open class C <: A {}

open class E <: C {}

open class B {}

open class D <: B {}

open class F <: D {}

func test(a: (A, D)): Int64 {
    return 1
}

func test(a: (C, B)): Int64 {
    return 2
}

main() {
    test((E(), F()))
    return 1
}
// ASSERT: scan sema_ambiguous_match
