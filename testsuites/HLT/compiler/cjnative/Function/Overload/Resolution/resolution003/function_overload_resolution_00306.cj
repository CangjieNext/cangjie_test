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

open class C <: A {}

open class E <: C {}

open class B {}

open class D <: B {}

open class F <: D {}

func test(a: (A, B)): Int64 {
    return 1
}

func test(a: (C, D)): Int64 {
    return 2
}

main() {
    if (test((E(), F())) == 2) {
        return 0
    }
    return 1
}
