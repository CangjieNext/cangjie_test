// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

interface TestInterface {
    func interfaceMethod(): Int32
}

open class BaseClass <: TestInterface {
    public var a: Int32 = 100
    public open func virtualMethod(i: Int32): Int32 {
        this.virtualMethod1(0)
        100 + i
    }
    public func virtualMethod1(i: Int32): Int32 {
        200 + a
    }
    public func interfaceMethod(): Int32 {
        3000
    }
    public init(a: Int32) {
        this.a = a
    }
}

class ChildClass <: BaseClass {
    public var b: Int32 = 0;
    public override func virtualMethod(i: Int32): Int32 {
        super.virtualMethod1(i);
    }
    public init() {
        super(10)
        b = 1
    }
    public init(b: Int32) {
        super(42)
        this.b = b
    }
}

func classTest(): Int32 {
    let obj: BaseClass = ChildClass(1000)
    let inf: TestInterface = obj
    return inf.interfaceMethod() + obj.virtualMethod(10000) + obj.a
}

func codegenUnitTest(): Int32 {
    return classTest()
}

main(): Int64 {
    var ret = codegenUnitTest()
    if (ret == 3284) {
        return 0
    } else {
        return -1
    }
}
