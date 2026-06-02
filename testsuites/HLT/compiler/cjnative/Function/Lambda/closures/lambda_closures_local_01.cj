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

main(): Int64 {
    if (case01() != 5) {
        return 1
    }
    if (case02() != 5) {
        return 2
    }
    if (case03() != 5) {
        return 3
    }
    return 0
}

func case01() {
    var a: Coo = Coo()
    var m: Int32 = 1
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
        b.a = x() + 2
        m = 2
        var res = b.a + m;
        res
    }({=> 1})
}

func case03() {
    var c: Roo = Roo()
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
