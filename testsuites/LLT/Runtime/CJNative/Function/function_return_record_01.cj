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
        var r = Rcd0() // new
        return r
    }
}

struct Rcd2 {
    public var r1: Rcd0 = Rcd0()
    public var r2: Rcd1 = Rcd1()
    public func foo(r: Rcd1): Rcd0 {
        return r.foo() // call
    }
}

func test1(r0: Rcd0): Int32 {
    var tmp = r0
    return 1
}

func test2(r1: Rcd1): Rcd0 {
    return r1.foo()
}

func testcase(r0: Rcd0, r1: Rcd1, r2: Rcd2): Int32 {
    var t1 = test1(r0)
    var t2 = test2(r1)
    return t1 + test1(t2) + test1(r2.foo(r1))
}

main(): Int64 {
    var r1 = Rcd0()
    var r2 = Rcd1()
    var r3 = Rcd2()
    if (3 == testcase(r1, r2, r3)) {
        return 0
    }
    return 1
}
