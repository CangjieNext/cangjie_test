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

interface faterInterface {
    func foo1(): Int64
    prop b: Int64 {
        get() {
            foo1()
        }
    }
    func foo2(): Int64
}

interface MyInterface <: faterInterface {}

class myClass<T> {
    var x: Int64 = 10
    func f() {
        x = 20
        return x
    }
}

extend<T> myClass<T> <: MyInterface {
    public func foo1(): Int64 {
        f()
    }
    public func foo2(): Int64 {
        x
    }
}

main() {
    var c1: faterInterface = myClass<String>()
    var c2: MyInterface = myClass<Int64>()
    var c3: myClass<String> = myClass<String>()

    if (c1.b == 20 && c1.foo2() == 20 && c2.b == 20 && c2.foo2() == 20 && c3.b == 20 && c3.x == 20) {
        return 0
    } else {
        return 1
    }
}
