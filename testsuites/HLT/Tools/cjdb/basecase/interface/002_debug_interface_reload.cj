/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

interface I1 {
    func foo1():Int32 {
        return 1
    }
}

interface I2 {
    func foo1(a: Int32):Int32 {
        return a
    }
}


class A <: I1 & I2 {
    public func foo1():Int32 {
        return 2
    }
    public func foo1(a: Int32):Int32 {
        return a + 2
    }
}

class B <: I1 & I2 {}




main() {
    let call_ca1 =  A().foo1()
    let call_ca2 =  A().foo1(2)
    let call_cb1 =  B().foo1()
    let call_cb2 =  B().foo1(2)
    return 0
}






