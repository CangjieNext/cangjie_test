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
    func foo1():Int32 {
        return 2
    }
}

interface I3 <: I1 & I2 {
    func foo1():Int32 {
        return 3
    }
}

open class A  {
    public open func foo1():Int32 {
        return 4
    }
}


class B <: A & I1 & I2 {
    public override func foo1():Int32 {
        return 5
    }
}

class C <: I3 {
    public func foo1():Int32 {
        return 6
    }
}


main() {
    let call_ca =  A().foo1()
    let call_cb =  B().foo1()
    let call_cc =  C().foo1()
    return 0
}






