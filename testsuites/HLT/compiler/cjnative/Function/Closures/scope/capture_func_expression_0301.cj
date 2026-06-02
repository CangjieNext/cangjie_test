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
    func goo2() {
        var a = {
            =>
            var x = a;
            return x
        }
        return a
    }
    func goo3() {
        var a = {=> return a}
        return a
    }
    func goo4() {
        var a = {
            =>
            a;
            return Int32(1)
        }
        return a
    }
    func goo5() {
        var a = {=> a}
        return a
    }
    func goo7() {
        var a = {=> b}
        return a
    }
    res = goo2()() + goo3()() + goo4()() + goo5()() + goo7()()
}

main(): Int64 {
    if (res != 5) {
        return 1
    }
    return 0
}
