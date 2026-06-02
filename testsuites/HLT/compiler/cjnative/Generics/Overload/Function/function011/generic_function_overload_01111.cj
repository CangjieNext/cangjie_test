/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

open class A<T> {}

open class B<T> <: A<T> {}

open class C<T> <: A<T> {}

func foo<X, Y>(a: B<X>, b: C<Y>): Int64 {
    1
} // foo1

func foo<X, Y>(a: B<Y>, b: C<X>): Int64 {
    0
} // foo2

main() {
    foo(B<Int64>(), C<Int64>())
}
// ASSERT: scan sema_ambiguous_match
