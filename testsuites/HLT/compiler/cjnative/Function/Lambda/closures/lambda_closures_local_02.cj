/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

main(): Int64 {
    return 0
}

func case01() {
    var a: Coo = Coo()
    var m: Int32 = 1
    return {
        x: () -> Int32 =>
        a.b = x() + 2
        m = 2
        var res = a.b + m;
        res
    }({=> 1})
}

func case0101() {
    var a: Coo = Coo()
    let m: Int32 = 1 // let
    return {
        x: () -> Int32 =>
        a.a = x() + 2
        m = 2
        var res = a.a + m;
        res
    }({=> 1})
}

func case02() {
    let b: Coo = Coo()
    var m: Int32 = 1
    return {
        x: () -> Int32 =>
        b.b = x() + 2
        m = 2
        var res = b.b + m;
        res
    }({=> 1})
}

func case03() {
    var c: Roo = Roo()
    var m: Int32 = 1
    return {
        x: () -> Int32 =>
        c.b = x() + 2
        m = 2
        var res = c.b + m;
        res
    }({=> 1})
}

func case04() {
    let c: Roo = Roo()
    var m: Int32 = 1
    return {
        x: () -> Int32 =>
        c.b = x() + 2
        m = 2
        var res = c.b + m;
        res
    }({=> 1})
}

func case05() {
    let c: Roo = Roo()
    var m: Int32 = 1
    return {
        x: () -> Int32 =>
        c.a = x() + 2
        m = 2
        var res = c.a + m;
        res
    }({=> 1})
}

class Coo {
    public var a: Int32 = 1
    public let b: Int32 = 2
}

struct Roo {
    public var a: Int32 = 1
    public let b: Int32 = 2
}
// ASSERT: scan sema_cannot_assign_to_immutable
