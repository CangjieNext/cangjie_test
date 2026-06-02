// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

open class Father {}

class Child <: Father {}

open class C1 {
    public open func f() {}
    public open func f1(): Father {
        Father()
    }
    public open func f2<T>(a: T) {
        return 1
    }
}

interface I {}

class C2 <: C1 & I {
    public override func f() {}
    public override func f1() {
        Child()
    }
    public override func f2<U>(b: U) {
        return 0
    }
}

main() {
    var a1 = C2() //expr a1 or expr C2()
    var a2 = a1.f1()
    var a3 = a1.f2<Int64>(3)
    0
}
