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

var arr = [1, 2, 3, 4]

interface fatherInterface<T> {
    func foo1(): Range<Int64>
    func foo3(): Int64
    func foo2(a: Range<Int64>): Range<Int64> {
        foo1()
    }
}

interface MyInterface<T> <: fatherInterface<T> {
    func foo2(a: Range<Int64>): Range<Int64> {
        foo1();
        0..3
    }
}

class myClass <: MyInterface<Int32> {
    var x: Int64 = 10
    func f() {
        x = 2
        return x
    }
    public func foo1(): Range<Int64> {
        0..f()
    }
    public func foo3(): Int64 {
        x
    }
}

main() {
    var c1: fatherInterface<Int32> = myClass()
    var c2: MyInterface<Int32> = myClass()
    var c3: myClass = myClass()
    c3.foo2(0..10)
    if (arr[c1.foo2(0..10)].size == 3 && c1.foo3() == 2 && arr[c2.foo2(0..10)][2] == 3 && c2.foo3() == 2 && c3.x == 2) {
        return 0
    } else {
        return 1
    }
}
