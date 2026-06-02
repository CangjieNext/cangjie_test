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
    func abstractMethod2(): Int32

    static func staticMethod(): Int32 {
        return 2
    }
}

class IfaceTest <: Iface {
    public func abstractMethod(): Int32 {
        return 3
    }
    public func abstractMethod2(): Int32 {
        return 4
    }

    public static func staticMethod(): Int32 {
        return 4
    }
}

class IfaceTest2 <: Iface {
    public func abstractMethod(): Int32 {
        return 6
    }

    public func abstractMethod2(): Int32 {
        return 8
    }

    public static func staticMethod(): Int32 {
        return 8
    }
}

func ItableTest(ins: Iface): Int32 {
    return ins.abstractMethod() + ins.abstractMethod2()
}

func ItableTest2(ins1: Iface, ins2: Iface): Int32 {
    return (ins1.abstractMethod() + ins2.abstractMethod2()) / (ins2.abstractMethod() + ins1.abstractMethod2())
}

main(): Int64 {
    let test: IfaceTest = IfaceTest()
    let res1: Int32 = test.abstractMethod()
    let res2: Int32 = IfaceTest.staticMethod()

    var test2 = IfaceTest2()

    let testIf = test
    let res3: Int32 = testIf.abstractMethod()
    let res4: Int32 = testIf.defaultMethod()

    let res5 = ItableTest(test)
    let res6 = ItableTest(test2)
    let res7 = ItableTest2(test, test2)
    let res8 = ItableTest2(test2, test)

    if (res1 == 3 && res2 == 4 && res3 == 3 && res4 == 1 && res5 == 7 && res6 == 14 && res7 == 1 && res8 == 0) {
        return 0
    }
    println("failed")
    return 1
}
