// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

// The evaluation order of a compound subscript assignment is different from a plain one: the left
// value is evaluated first, its value is read, and only then the right expression is evaluated:
// `bar()[goo()] += foo()` evaluates bar, goo, the getter, then foo, the operator and the setter.
// The left value is evaluated only once, so the getter is called once.
// Every call appends its own digit to 'stamp', so the expected order is the number 123456.

var stamp = 0
var set = 0

func record(num: Int64) {
    stamp = stamp * 10 + num
}

class A {
    public let id: Int64

    public init(id: Int64) {
        this.id = id
    }

    public operator func [](index: Int64, value!: A): Unit {
        record(6)
        set = index + value.id
    }

    public operator func [](index: Int64): A {
        record(3)
        A(index)
    }

    public operator func +(other: A): A {
        record(5)
        A(id + other.id)
    }
}

func foo(): A {
    record(4)
    A(10)
}

func goo(): Int64 {
    record(2)
    20
}

func bar(): A {
    record(1)
    A(0)
}

main(): Int64 {
    bar()[goo()] += foo()
    // The getter reads A(20) and 'foo' returns A(10), so the operator returns A(30) and the setter
    // is called with the index 20 and A(30).
    if (stamp != 123456 || set != 50) {
        return 1
    }
    return 0
}
