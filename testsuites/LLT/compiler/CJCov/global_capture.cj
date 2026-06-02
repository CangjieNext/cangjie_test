// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %coverage_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

var res: Int32 = 0
var b: Int32 = 1
var c = if (true) {
    var a: Int32 = 1
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
        foo3()
    }

    func foo6(x!: Int32 = b) {
        return x
    }
    func foo7() {
        b
    }
    res += foo1()
    res += foo2()
    res += foo3()
    res += foo4()
    res += foo5()
    res += foo6()
    res += foo7()
}

main(): Int64 {
    if (res != 7) {
        return 1
    }
    return 0
}
