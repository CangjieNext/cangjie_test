// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt --int-overflow=wrapping %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

struct Rcd0 {}

struct Rcd1 {
    public func foo(): Rcd0 {
        return Rcd0()
    }
    public func ffo(): Rcd1 {
        var r1 = Rcd1()
        return r1
    }
}

struct Rcd2 {
    public var r1: Rcd0 = Rcd0()
    public var r2: Rcd1 = Rcd1()
    public var r3: Rcd0 = Rcd1().foo()
    public var r4: Rcd1 = Rcd1().ffo()
    public var a0: Int32 = 10

    public func foo(r: Rcd1): Rcd0 {
        return r.foo()
    }
    public func ffo(r: Rcd0): Int32 {
        var tmp = r
        return 2
    }
}

func test0(r0: Rcd0): Int32 {
    var tmp = r0
    return 1
}

func test1(r: Rcd2): Int32 {
    var a0 = test0(r.r1)
    var a1 = r.r2.foo()
    var a2 = test0(a1)
    var a3 = r.foo(r.r2)
    var a4 = test0(a3)
    return a0 + a2 + a4 // 3
}

func test2(r0: Rcd0, r1: Rcd1, r2: Rcd2): Int32 {
    var a0 = r2.ffo(r0)
    var a1 = r2.foo(r1)
    var a2 = r2.ffo(a1)
    return a0 + a2 // 4
}

func testcase(r0: Rcd0, r1: Rcd1, r2: Rcd2): Int64 {
    var t1 = test1(r2)
    var t2 = test2(r0, r1, r2)
    if (t1 == 3 && t2 == 4) {
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
