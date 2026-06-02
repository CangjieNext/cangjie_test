// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: memoize.cj
// EXEC: %compiler %cmp_macro memoize.cj
// EXEC: %run_macro %compiler %cmp_opt %f -o %output %macro_debug
// EXEC: %run %run_opt %output %run_args
// cat debug_useMemoize.cj

// This is a general memoize macro for optimizing recusive functions.
// memoize macro is general for function type: (T1) -> T2.
// This is a use case to show what Cangjie's macro is capable of at compile time.

import test.*
import std.time.*
import std.collection.*

@memoize[true]
func Fib(n: Int64): Int64 {
    if (n == 0 || n == 1) {
        return n
    }
    return Fib(n - 1) + Fib(n - 2)
}

@memoize[true]
func FibPlus2(n: Int32): Int32 {
    if (n == 0 || n == 1) {
        return n
    }
    let ret = FibPlus2(n - 1) + FibPlus2(n - 2) + 2
    if (ret > 10000) {
        println("Larger than 10000")
    }
    return ret
}

main() {
    println("Fibonacci:")

    let start1 = DateTime.now().nanosecond
    let f1 = Fib(20)
    let end1 = DateTime.now().nanosecond
    println("Fib(20): ${f1}")
    println("excution time: ${(end1 - start1) / 1000} us")

    let start2 = DateTime.now().nanosecond
    let f2 = Fib(15)
    let end2 = DateTime.now().nanosecond
    println("Fib(15): ${f2}")
    println("excution time: ${(end2 - start2) / 1000} us")

    let start3 = DateTime.now().nanosecond
    let f3 = Fib(22)
    let end3 = DateTime.now().nanosecond
    println("Fib(22): ${f3}")
    println("excution time: ${(end3 - start3) / 1000} us")

    println("Fibonacci Plus 2:")
    let start11 = DateTime.now().nanosecond
    let f11 = FibPlus2(20)
    let end11 = DateTime.now().nanosecond
    println("FibPlus2(20): ${f11}")
    println("excution time: ${(end11 - start11) / 1000} us")

    let start22 = DateTime.now().nanosecond
    let f22 = FibPlus2(21)
    let end22 = DateTime.now().nanosecond
    println("FibPlus2(21): ${f22}")
    println("excution time: ${(end22 - start22) / 1000} us")

    0
}
