/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

interface I1 {
    func foo1(): Unit
}

interface I2 {
    func foo1(a: Int32):Unit {
        return
    }
}


class A <: I1 & I2 {
    public func foo1():Unit {
        return
    }
}


interface I3 {
    func f1(): Unit // Default implementation not included
    func f2(a!: Int64): Unit
    static func f3(): Unit {}
    mut func f4(): Unit
}

class B <: I3 {
    public func f1():Unit {
        return
    }
    public func f2(a!: Int64): Unit {
        return
    }
    public func f4():Unit {
        return
    }
}


interface I4 {
    func f1(a: This): This      // ok
    func f2(): This         // ok
}





main() {
    let call_ca1 =  A().foo1()
    let call_ca2 =  A().foo1(2)
    let call_cb1 =  B().f1()
    let call_cb2 =  B().f2(a: 2)
    let call_cb4 =  B().f4()

    return 0
}






