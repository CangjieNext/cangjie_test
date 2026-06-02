// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt --int-overflow=wrapping %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

struct Rcd0 {}

struct Rcd1 {
    public func foo(): Int32 {
        return 2
    }
    public func ffo(): Rcd0 {
        var r0 = Rcd0()
        return r0
    }
}

struct Rcd2 {
    public var r1: Rcd0 = Rcd0()
    public var r2: Rcd1 = Rcd1()
    public var r3: Rcd0 = Rcd1().ffo()
    public var v1: Int8 = 10
    public var v2: Int16 = 11
    public var v3: Int32 = 12
    public var v4: Int64 = 13
    public var v5: Int64 = 14

    public func foo(r: Rcd1): Int32 {
        return r.foo()
    }
}

func test0(r0: Rcd0): Int32 {
    var tmp = r0
    return 1
}

func test1(r0: Rcd0, r1: Rcd1, r2: Rcd2): Int32 {
    var a0 = r1.foo()
    var a1 = r1.ffo()
    var a2 = test0(a1)
    var a3 = r2.v3
    var a4 = test0(r0)
    return a0 + a2 + a3 + a4 // 16
}

func test2(r0: Rcd0, r1: Rcd0, r2: Rcd1, r3: Rcd1, r4: Rcd2, r5: Rcd2): Int32 {
    var a0 = test0(r0)
    var a1 = test0(r1)
    var a2 = r2.foo()
    var a3 = r3.foo()
    var a4 = r4.foo(r2)
    var a5 = r5.foo(r3)
    return a0 + a1 + a2 + a3 + a4 + a5 // 10
}

func testcase(r0: Rcd0, r1: Rcd1, r2: Rcd2): Int64 {
    var t1 = test1(r0, r1, r2)
    var t2 = test2(r0, r0, r1, r1, r2, r2)
    if (t1 == 16 && t2 == 10) {
        return 0
    }
    return 1
}

main(): Int64 {
    var r1 = Rcd0()
    var r2 = Rcd1()
    var r3 = Rcd2()
    return testcase(r1, r2, r3)
}
