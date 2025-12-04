// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

open class Base {
    var name:String="abc"
}
class Derived1 <: Base {
    var age:UInt8 = 18
}
class Derived2 <: Base {
    var gender:String = "dbc"
}

main():Int64 {
    let base1:Base = Base()
    let base2:Base = Derived1()
    let base3:Base = Derived2()

    let derived1:Derived1 = Derived1()
    let derived2:Derived2 = Derived2()
    
    let castOp1 = base1 as Base
    let castOp2 = base1 as Derived1
    let castOp3 = base1 as Derived2
    let castOp4 = base2 as Base
    let castOp5 = base2 as Derived1
    let castOp6 = base2 as Derived2
    0
}
