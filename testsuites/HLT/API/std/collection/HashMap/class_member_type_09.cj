/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %n.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.collection.*

class Test {
    public var a: HashMap<Int32, String> = HashMap<Int32, String>([(1, "Aa"), (2, "Bb"), (3, "Cc")])
    public var b: HashMap<Int32, String>
    public init(x: HashMap<Int32, String>) {
        b = x
    }
    public func f(x: HashMap<Int32, String>): HashMap<Int32, String> {
        return x
    }
}

func run(): Int64 {
    var HashMap1: HashMap<Int32, String> = HashMap<Int32, String>([(1, "A"), (2, "B"), (3, "C")])
    var HashMap2: HashMap<Int32, String> = HashMap<Int32, String>([(1, "a"), (2, "b"), (3, "c")])
    var test: Test = Test(HashMap1)
    var res1: HashMap<Int32, String> = test.a
    var res2: HashMap<Int32, String> = test.b
    var res3: HashMap<Int32, String> = test.f(HashMap2)
    var x1 = res1.get(1)
    var x2 = res2.get(2)
    var x3 = res3.get(3)
    var y1 = match (x1) {
        case Some("Aa") => 0
        case _ => 1
    }
    var y2 = match (x2) {
        case Some("B") => 0
        case _ => 1
    }
    var y3 = match (x3) {
        case Some("c") => 0
        case _ => 1
    }
    if (y1 == 0 && y2 == 0 && y3 == 0) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
