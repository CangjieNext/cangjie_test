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
}

// new and return
func test1(): Base {
    let obj: Base = Base()
    return obj
}
// load and return
func test2(mm: Base): Super {
    return mm.obj
}
// call and return
func test3(): Base {
    let obj: Base = test1()
    return obj
}

func testcase(mm: Base): Int64 {
    if (test1().b1 == 2 && test2(mm).s1 == 1 && test3().obj.s1 == 1) {
        return 0
    }
    return 1
}

main(): Int64 {
    var mm: Base = Base()
    return testcase(mm)
}
