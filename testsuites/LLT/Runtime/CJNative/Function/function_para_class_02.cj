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
    public func test1(): UInt32 {
        let obj: Base = Base()
        return obj.b1
    }
    public func test2(v1: Base, v2: Base, v3: Base): UInt32 {
        let obj: Base = Base()
        obj.b1 = v1.b1 + v2.b1 + v3.b1
        return obj.b1
    }
    public func test3(v1: Base, v2: Base, v3: Base, v4: Super, v5: Super, v6: Super): UInt32 {
        let obj: Base = Base()
        obj.b1 = v1.obj.s1 + v2.obj.s1 + v3.obj.s1 + v4.s1 + v5.s1 + v6.s1
        return obj.b1
    }
}

func testcase(mm: Base): Int64 {
    var c: Base = Base()
    var r1 = c.test1()
    var r2 = c.test2(mm, mm, Base())
    var r3 = c.test3(mm, mm, Base(), mm, mm, Super())
    if (r1 == 2 && r2 == 6 && r3 == 6) {
        return 0
    }
    return 1
}

main(): Int64 {
    var mm: Base = Base()
    return testcase(mm)
}
