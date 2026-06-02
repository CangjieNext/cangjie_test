/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

open class C0 {
    public var a: Int32 = 10
    public var b: Int32 = 20
    public open func getA(): Int32 {
        return a
    }
    public open func getB(): Int32 {
        return b
    }
}

open class C1 <: C0 {}

open class C2 <: C1 {}

open class C3 <: C1 {}

class ClassA <: C2 {
    public var a1: Int32 = 0
    public override func getA(): Int32 {
        return a
    }
}

class ClassB <: C3 {
    public var b1: Int32 = 0
    public override func getB(): Int32 {
        return b
    }
}

main(): Int64 {
    var a = ClassA()
    var b = ClassB()
    let arr0: Array<C0> = [a, b, C1(), C0()]
    let arr1: Array<C1> = [a, b, C1()]
    if (arr0[0].getA() == 10 && arr1[1].getB() == 20) {
        return 0
    }
    return 1
}
