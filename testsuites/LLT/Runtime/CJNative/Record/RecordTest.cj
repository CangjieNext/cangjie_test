// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt --int-overflow=wrapping %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

class Test {
    public var t0: Int32 = 0
}

struct RcdTest {
    public var a0: Int64 = 0
    public var a1: Test = Test()
    public var a2: Int32 = 2
    public var a3: Test = Test()
    public func f1(a: Int32): Int32 {
        return a + 1
    }
    public func f2(): Int32 {
        return 1
    }
    public func f3(): Int32 {
        return 3
    }
}

var gTemp: RcdTest = RcdTest()

main(): Int64 {
    var t: RcdTest = RcdTest()
    t.a0 = 4
    t.f1(1)
    t.f2()
    t.f3()
    var temp: Test = t.a1
    temp.t0 = 1
    t.a1 = t.a3
    t.a3 = temp
    if (t.a0 == 4) {
        return 0
    }
    return 1
}
