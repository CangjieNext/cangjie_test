/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

class A<T> {}

class B<T> {}

func foo<X>(a: A<X>, b: B<X>): Int64 {
    1
} // foo1

func foo<X>(a: A<X>, b: B<Int32>): Int64 {
    2
} // foo2

main() {
    foo(A<Int32>(), B<Int32>())
}
// ASSERT: scan sema_ambiguous_match
