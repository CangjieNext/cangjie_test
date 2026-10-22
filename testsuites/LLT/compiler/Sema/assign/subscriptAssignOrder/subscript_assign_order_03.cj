// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

// Variants of the subscript assignment whose right value should be evaluated first: 'this' as the
// base, more than one index, and a nested subscript as the base.
// Every call appends its own digit to 'stamp', so an expected order is checked as a number.

var stamp = 0

func record(num: Int64) {
    stamp = stamp * 10 + num
}

func reset() {
    stamp = 0
}

func foo(): Int64 {
    record(1)
    7
}

func goo(): Int64 {
    record(2)
    0
}

class A {
    public var data: Array<Int64> = [0, 0]

    public operator func [](i: Int64, value!: Int64): Unit {
        record(3)
        data[i] = value
    }

    public operator func [](i: Int64, j: Int64, value!: Int64): Unit {
        record(3)
        data[i] = value + j
    }

    // `this` as the base: the right value foo(), the index goo(), the setter.
    public func useThis(): Int64 {
        reset()
        this[goo()] = foo()
        if (stamp != 123) {
            return 1
        }
        reset()
        // With two indexes: the right value foo() is evaluated first, then both indexes from left
        // to right, then the setter.
        this[goo(), goo()] = foo()
        if (stamp != 1223) {
            return 1
        }
        return 0
    }
}

// A nested subscript as the base: the right value foo() is evaluated before the index goo() of the
// nested subscript. The '[]' of an array does not record any digit, so 'stamp' is 12.
func nested(matrix: Array<Array<Int64>>) {
    matrix[goo()][0] = foo()
}

main(): Int64 {
    var a = A()
    if (a.useThis() != 0) {
        return 1
    }
    reset()
    var matrix: Array<Array<Int64>> = [[0]]
    nested(matrix)
    if (stamp != 12 || matrix[0][0] != 7) {
        return 1
    }
    return 0
}
