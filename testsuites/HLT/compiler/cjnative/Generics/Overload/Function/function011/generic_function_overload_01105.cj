/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

open class A {}

open class B <: A {}

func foo<X>(a: X, b: X): Int64 {
    1
} // foo1

func foo<X>(a: A, b: X): Int64 {
    0
} // foo2

main() {
    foo(A(), B())
}

// foo1(x) { foo2(x) }
// X1 <: A    ,    X1 <: X2
// false

// foo2(x){ foo1(x) }
// A <: X1     ,   X2 <: X1
// {A, X2} <: X1
// X1 = join(A, X2) = Any
// ?
// ASSERT: scan sema_ambiguous_match
