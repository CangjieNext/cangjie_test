/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f  -o %output
// RUN-EXEC: %run %run_opt %output %run_args

var res: Int32 = 0
var b: Int32 = 1
var c = if (true) {
    let a: Int32 = 1
    func foo1(x!: Int32 = a) {
        return x
    }
    func foo2() {
        var x = a;
        return x
    }
    func foo3() {
        return a
    }
    func foo4() {
        a;
        return Int32(1)
    }
    func foo5() {
        a
    }
    func foo6(x!: Int32 = b) {
        return x
    }
    func foo7() {
        b
    }

    func goo1() {
        var a = foo1
        return a
    }
    func goo2() {
        var a = foo2
        return a
    }
    func goo3() {
        var a = foo3
        return a
    }
    func goo4() {
        var a = foo4
        return a
    }
    func goo5() {
        var a = foo5
        return a
    }
    func goo6() {
        var a = foo6
        return a
    }
    func goo7() {
        var a = foo7
        return a
    }
    res = goo1()(1) + goo2()() + goo3()() + goo4()() + goo5()() + goo6()(1) + goo7()()
}

main(): Int64 {
    if (res != 7) {
        print("${res}")
        return 1
    }
    return 0
}
