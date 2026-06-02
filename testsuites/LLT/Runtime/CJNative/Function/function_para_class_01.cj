// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt --int-overflow=wrapping %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

open class Super {
    public var s1: UInt32 = 1
}

class Base <: Super {
    public var b1: UInt32 = 2
    public var obj: Super = Super()

    // new
    public func test1(): Unit {
        let obj: Base = Base()
    }
    // new and return
    public func test2(): Base {
        let obj: Base = Base()
        return obj
    }
    // load
    public func test3(mm: Base): Unit {
        let obj: Super = mm.obj
    }
    // load and return
    public func test4(mm: Base): Super {
        return mm.obj
    }
    // call
    public func test5(): Unit {
        let obj: Base = test2()
    }
    // call and return
    public func test6(): Base {
        let obj: Base = test2()
        return obj
    }
}

func testcase(mm: Base): Int64 {
    var c: Base = Base()
    c.test1()
    c.test2()
    c.test3(mm)
    c.test4(mm)
    c.test5()
    c.test6()
    if (c.test2().b1 == 2 && c.test4(mm).s1 == 1 && c.test6().obj.s1 == 1) {
        return 0
    }
    return 1
}

main(): Int64 {
    var mm: Base = Base()
    return testcase(mm)
}
