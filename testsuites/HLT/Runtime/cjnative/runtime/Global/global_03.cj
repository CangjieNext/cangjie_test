/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

class Test {}

class ClsTest {
    public var t0: Int32 = 0
    public var c0: Test = Test()
}

struct RcdTest {
    public var a0: Int32 = 0
    public var a1: ClsTest = ClsTest()
    public var a2: Int64 = 2
    public var a3: Test = Test()
    public func f1(a: Int32): Int32 {
        return a0 + a
    }
    public func f2(): Test {
        return a3
    }
}

var a0: Int8 = 0
var a1: Int16 = 0
var a2: Int32 = 0
var a3: Int64 = 0
var rcd: RcdTest = RcdTest()
var cls: ClsTest = ClsTest()
var ts: Test = Test()

main(): Int64 {
    var t: RcdTest = RcdTest()
    rcd.a0 = 10
    a2 = rcd.f1(2)
    rcd.a1.t0 = a2 - 10
    ts = t.a3
    cls = t.a1
    cls.t0 = rcd.f1(2)
    cls.c0 = t.f2()
    if (rcd.a1.t0 == 2 && cls.t0 == 12) {
        return 0
    }
    return 1
}
