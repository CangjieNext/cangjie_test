/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-1: %compiler %cmp_opt %f -o %output

open class A<X, Y> {}

open class B<X, Y> <: A<X, Y> {}

open class C<X, Y> <: A<X, Y> {}

func foo<X, Y>(a: B<X, Y>, b: C<X, Y>): Int64 {
    1
} // foo1

func foo<X, Y>(a: B<Y, X>, b: C<Y, X>): Int64 {
    0
} // foo2

main() {
    foo(B<Int32, Int64>(), C<Int32, Int64>())
}

// ASSERT: regex :13:.* ambiguous match for function call
