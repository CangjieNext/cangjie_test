/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
open class A {}

open class B <: A {}

func foo<X>(a: X, b: X): Int64 {
    0
} //  foo1

func foo<X>(a: B, b: X): Int64 {
    1
} // foo2

main() {
    foo(A(), B())
}
