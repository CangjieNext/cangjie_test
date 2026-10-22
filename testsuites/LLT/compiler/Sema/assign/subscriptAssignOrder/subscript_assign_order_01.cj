// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

// The right value of an assignment expression is evaluated before the left value, so for the
// subscript assignment `bar()[goo()] = foo()` the order is: the right value foo(), the base
// bar(), the index goo(), and the setter last.
// Every call appends its own digit to 'stamp', so the expected order is the number 1234.

var stamp = 0
var setIndex = 0
var setValueId = 0

func record(num: Int64) {
    stamp = stamp * 10 + num
}

class A {
    public let id: Int64

    public init(id: Int64) {
        this.id = id
    }

    public operator func [](index: Int64, value!: A): Unit {
        record(4)
        setIndex = index
        setValueId = value.id
    }
}

func foo(): A {
    record(1)
    A(7)
}

func goo(): Int64 {
    record(3)
    2
}

func bar(): A {
    record(2)
    A(0)
}

main(): Int64 {
    bar()[goo()] = foo()
    if (stamp != 1234 || setIndex != 2 || setValueId != 7) {
        return 1
    }
    return 0
}
