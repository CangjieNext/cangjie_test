// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt --int-overflow=wrapping %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    let c1: Father = Father()
    let c2: Child = Child()
    let c3: C1 = C1()
    let c4: C2 = C2()
    if (c1.f() == 1 && c2.f1() == 1 && c3.f1().f() == 1 && c4.f1().f1() == 1) {
        return 0
    }
    return 1
}

open class Father {
    public var i1: Int32 = 1
    public func f(): Int32 {
        return i1
    }
}

class Child <: Father {
    public var i2: Int32 = 2
    public func f1(): Int32 {
        return f()
    }
}

open class C1 {
    public open func f(): Unit {}
    public open func f1(): Father {
        Father()
    }
}

interface I {
    func f() {}
}

class C2 <: C1 & I {
    public override func f(): Unit {}
    public override func f1(): Child {
        Child()
    }
}
