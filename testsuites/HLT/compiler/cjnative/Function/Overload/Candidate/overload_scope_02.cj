/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    var a: Int64 = first()
    if (a != 5) {
        return 1
    }
    return 0
}

func first() {
    func goo(x: B) {
        return 1
    }
    func goo(x: Int32) {
        return 3
    }
    var x = A(1)
    var y = B(1)
    var z = 1
    func second() {
        func goo(x: A) {
            return 2
        }
        func third() {
            var a = goo(y)
            if (a == 2) {
                z++
            }
            var b = goo(1)
            if (b == 3) {
                z++
            }
        }
        third()
        var c = goo(y)
        if (c == 2) {
            z++
        }
    }
    second()
    var d = goo(y)
    if (d == 1) {
        z++
    }
    return z
}

open class A {
    public var a: Int32
    public init(x: Int32) {
        a = x + 1
    }
}

class B <: A {
    public var b: Int32
    public init(x: Int32) {
        super(x)
        b = x
    }
}
