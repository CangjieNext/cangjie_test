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

open class Test {}

class ClsTest <: Test {
    public var t0: Int32 = 10
    public var c0: Test = Test()
}

struct RcdTest {
    public var a0: Int32 = 20
    public var a1: ClsTest = ClsTest()
    public var a2: Test = Test()
    public func f1(): Test {
        return a2
    }
}

var a0: Int8 = 1
var a1: Int16 = 2
var a2: Int32 = 3
var a3: Int64 = 4
var rcd: RcdTest = RcdTest()
var cls: ClsTest = ClsTest()
var ts: Test = Test()

struct RcdTest2 {
    public var a0: Int8 = 0
    public var a1: Int16 = 0
    public var a2: Int32 = 0
    public var a3: Int64 = 0
    public var rcd: RcdTest = RcdTest()
    public var cls: ClsTest = ClsTest()
    public var ts: Test = Test()
}

main(): Int64 {
    rcd.a0 = 10
    rcd.a1 = cls
    rcd.a2 = ts
    var tmp: RcdTest2 = RcdTest2()
    tmp.a0 = 1
    tmp.a1 = a1
    tmp.a2 = a2
    tmp.a3 = a3
    tmp.rcd = rcd
    tmp.cls = cls
    tmp.ts = ts

    if (rcd.a1.t0 == 10 && tmp.a0 == 1 && tmp.rcd.a0 == 10 && tmp.cls.t0 == 10) {
        return 0
    }
    return 1
}
