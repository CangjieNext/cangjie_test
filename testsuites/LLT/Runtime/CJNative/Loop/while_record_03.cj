// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt --int-overflow=wrapping %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

class Test {
    public var t: Int32 = 10
}

struct RcdTest {
    public var a0: Int64 = 0
    public var a1: Test = Test()
    public var a2: Int32 = 10
    public func f1(a: Int32): Int32 {
        return a2 + a
    }
    public func f2(): Int32 {
        return 1
    }
    public func f3(): Int32 {
        return 3
    }
}

main(): Int64 {
    var i = 0
    var j = 0
    var st: RcdTest = RcdTest()
    while (i < 10) {
        while (j < 20) {
            st.a2 = st.f1(1)
            j++
        }
        i++
    }
    if (st.a2 == 30) {
        return 0
    }
    return 1
}
