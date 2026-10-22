// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

// The subscript of an array is assigned through the overloaded '[]' of std.core as well, so the
// right value is evaluated before the base and the index expression:
// `bar()[goo()] = foo()` evaluates foo, then bar and goo. Every call appends its own digit to
// 'stamp', so the expected order is the number 123.

var stamp = 0

func record(num: Int64) {
    stamp = stamp * 10 + num
}

let arr: Array<Int64> = [0, 1, 2]

func foo(): Int64 {
    record(1)
    42
}

func goo(): Int64 {
    record(3)
    2
}

func bar(): Array<Int64> {
    record(2)
    arr
}

main(): Int64 {
    bar()[goo()] = foo()
    if (stamp != 123 || arr[2] != 42) {
        return 1
    }
    return 0
}
