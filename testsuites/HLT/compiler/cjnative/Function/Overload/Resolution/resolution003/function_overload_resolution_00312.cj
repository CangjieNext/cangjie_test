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

open class D <: A {}

open class G <: D {}

open class B {}

open class E <: B {}

open class H <: E {}

open class C {}

open class F <: C {}

open class I <: F {}

func test(a: (D, E, I)): Int64 {
    return 1
}

func test(a: (D, H, F)): Int64 {
    return 2
}

func test(a: (C, F, I)): Int64 {
    return 3
}

main() {
    test((G(), H(), I()))
    return 1
}
// ASSERT: scan sema_ambiguous_match
