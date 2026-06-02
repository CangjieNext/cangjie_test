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

struct Rcd0 {
    public var a0: Int8 = 1
    public var a1: Int16 = 2
    public var a2: Int32 = 3
    public var a3: Int64 = 4
    public var ts: Test = Test()
}

class ClsTest <: Test {
    public var t0: Int32 = 10
    public var r0: Rcd0 = Rcd0()
    public var ts: Test = Test()
}

struct RcdTest {
    public var a0: Int32 = 20
    public var a1: ClsTest = ClsTest()
    public var a2: Test = Test()
    public var a3: Rcd0 = Rcd0()
    public func f1(): Test {
        return a2
    }
}

var rcd: RcdTest = RcdTest()
var cls: ClsTest = ClsTest()
var ts: Test = Test()
var rd: Rcd0 = Rcd0()

main(): Int64 {
    rcd.a0 = rcd.a1.t0 + rd.a2 // 13
    cls.t0 = Int32(cls.r0.a1) + Int32(rd.a3) // 6

    if (rcd.a0 + cls.t0 + rd.a2 == 22) {
        return 0
    }
    return 1
}
