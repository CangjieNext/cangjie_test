// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE:%compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

// Test Nothing as generic instantiation type.
// A<Nothing> and A<Unit>
class A<T> {}

main(): Int64 {
    foo(A<Nothing>())
    foo(A<Unit>())
    0
}

func foo(a: A<Unit>) {
    println("foo1")
}

func foo(b: A<Nothing>) {
    println("foo2")
}
