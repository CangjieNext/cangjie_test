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

    public func foo(): Super {
        let obj = this
        return obj
    }
}

func test1(): Base {
    let obj: Base = Base()
    return obj
}

func test2(mm: Base): Super {
    return mm.obj
}

func testcase(mm: Base): Int64 {
    var tmp = mm
    let obj = test1();
    let obj2 = test2(obj)
    let su = obj.foo()
    if (obj.s1 == su.s1 && obj.s1 == obj2.s1) {
        return 0
    }
    return 1
}

main(): Int64 {
    var mm: Base = Base()
    return testcase(mm)
}
