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

var a: Coo = Coo()
let b: Coo = Coo()
var c: Roo = Roo()
let d: Roo = Roo()
var m: Int32 = 1
let n: Int32 = 1
var foo01 = {
    x: () -> Int32 =>
    a.a = x() + 2
    m = 2
    var res = a.a + m;
    res
}
var foo02 = {
    x: () -> Int32 =>
    var res = n;
    res
}

main(): Int64 {
    if (foo01({=> 1}) != 5) {
        return 1
    }
    if (foo02({=> 1}) != 1) {
        return 1
    }
    if (case01()({=> 1}) != 5) {
        return 2
    }
    if (case02()({=> 1}) != 5) {
        return 3
    }
    if (case03()({=> 1}) != 3) {
        return 4
    }
    if (case04()({=> 1}) != 5) {
        return 5
    }
    if (case05()({=> 1}) != 5) {
        return 6
    }
    return 0
}

func case01() { // class:var-var
    return foo01
}

func case02() { // class:var-var
    return {
        x: () -> Int32 =>
        a.a = x() + 2
        m = 2
        var res = a.a + m;
        res
    }
}

func case03() { // just visit
    return {x: () -> Int32 => return x() + b.b}
}

func case04() { // class:let-var
    return {
        x: () -> Int32 =>
        b.a = x() + 2
        m = 2
        var res = b.a + m;
        res
    }
}

func case05() { // struct:var-var
    return {
        x: () -> Int32 =>
        c.a = x() + 2
        m = 2
        var res = c.a + m;
        res
    }
}

class Coo {
    public var a: Int32 = 1
    public let b: Int32 = 2
}

struct Roo {
    public var a: Int32 = 1
    public var b: Int32 = 2
}
