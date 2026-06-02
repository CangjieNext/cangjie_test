/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

class B {
    var x: Int64 = 10
}

interface fatherInterface {
    func foo1(): Int64
    func foo2(a: Array<B>): B {
        a[foo1()]
    }
}

interface MyInterface <: fatherInterface {
    func foo3(): B {
        foo2([B(), B()])
    }
}

extend Bool <: MyInterface {
    func f() {
        var a: B = B()
        a.x = 1
        return a.x
    }
    public func foo1() {
        f()
    }
}

main() {
    var b1: fatherInterface = true
    var b2: MyInterface = true
    var b3: Bool = true

    if (b2.foo3().x == 10 && b1.foo2([B(), B()]) is B && b2.foo2([B(), B()]) is B) {
        if (b3.foo3().x == 10 && b3.foo2([B(), B()]) is B) {
            return 0
        }
    }
    return 1
}
