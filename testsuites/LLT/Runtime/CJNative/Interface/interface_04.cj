// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt --int-overflow=wrapping %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

interface Iface {
    func defaultMethod(): Int32 {
        return 1
    }

    func abstractMethod(): Int32

    static func staticMethod(): Int32 {
        return 2
    }
}

class IfaceTest <: Iface {
    public func abstractMethod(): Int32 {
        return 3
    }

    public static func staticMethod(): Int32 {
        return 4
    }
}

main(): Int64 {
    let test: IfaceTest = IfaceTest()
    let res1: Int32 = test.abstractMethod()
    let res2: Int32 = IfaceTest.staticMethod()

    let testIf = test
    let res3: Int32 = testIf.abstractMethod()
    let res4: Int32 = testIf.defaultMethod()

    if (res1 == 3 && res2 == 4 && res3 == 3 && res4 == 1) {
        return 0
    }
    return 1
}
