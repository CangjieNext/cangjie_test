/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

open class A {}

open class D <: A {}

open class G <: D {}

open class B {}

open class E <: B {}

open class H <: E {}

open class C {}

open class F <: C {}

open class I <: F {}

func test(a: (A, B, C)): Int64 {
    return 1
}

func test(a: (D, E, F)): Int64 {
    return 2
}

main() {
    if (test((G(), H(), I())) == 2) {
        return 0
    }
    return 1
}
