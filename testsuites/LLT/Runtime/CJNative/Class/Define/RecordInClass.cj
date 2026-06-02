// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt --int-overflow=wrapping %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

class Test {
    public var t0: Int32 = 0
}

struct structTest {
    public var a0: Int64 = 0
    public var a1: Test = Test()
    public var a2: Int32 = 2
    public var a3: Test = Test()
    public var a4: Test = Test()
    public func f1(a: Int32) {
        return a + 1
    }
    public func f2() {
        return 1
    }
    public func f3() {
        return 3
    }
}

open class Father {
    public var a0: Int64 = 0
    public var a1: Test = Test()
    public var a2: Int32 = 2
    public var r0: structTest = structTest()
    public open func f1(a: Int32) {
        return a + 1
    }
    public func f2() {
        return 1
    }
    public open func f3() {
        return 3
    }
}

interface I {
    func FI1() {
        return 3
    }
    func FI2(a: Int32) {
        return a
    }
}

open class Son <: Father & I {
    public var a3: Int32 = 3
    public var a4: Test = Test()
    public var a5: Int32 = 5
    public var a6: Test = Test()
    public var r1: structTest = structTest()
    public static var a7: Int64 = 7
    public override func f1(a: Int32){
        return a - 1
    }
    public func f2(a: Int32){
        return a + 2
    }
    public func FI1(){
        return 4
    }
    public func FI2(a: Int32){
        return a + 3
    }
}

open class GrandSon <: Son {
    public var a8: Int32 = 8
    public var a9: Test = Test()
    public var a10: Int32 = 10
    public var r2: structTest = structTest()
}

var gTemp: Son = Son()

main(): Int64 {
    var t: GrandSon = GrandSon()
    t.r2.a1.t0 = 100
    t.a5 = 4
    t.f1(1)
    t.f2()
    t.f2(2)
    t.f3()
    t.FI1()
    t.FI2(2)
    var temp: Test = t.a4
    temp.t0 = 1
    t.a4 = t.a6
    t.a6 = temp

    t.a9.t0 = t.a8
    print((t.a0).toString())
    return t.a0
}
