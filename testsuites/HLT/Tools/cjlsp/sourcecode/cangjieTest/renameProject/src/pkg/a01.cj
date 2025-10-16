/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.pkg

public open class Base1{
    var name:String = "Alice"
}
class Derived1<:Base1 {
    var age:UInt8=18
}

class Derived2<:Base1 {
    var gender:String = "female"
}

func acx1(){
    let base1_new:Base1 = Base1()
    let base2:Base1 = Derived1()
    let base3:Base1 = Derived2()
    let derived1:Derived1 = Derived1()
    let derived2:Derived2 = Derived2()
    let castop1 = base1_new as Base1
    let castop2 = base1_new as Derived1
    let castop3 = base1_new as Derived2
    let castop4 = base2 as Base1
    let castop5 = base2 as Derived1
    let castop6 = base2 as Derived2
    let castop7 = base3 as Base1
    let castop8 = base3 as Derived1
    let castop9 = base3 as Derived2
    let castop10 = derived1 as Base1
    let castop11 = derived1 as Derived1
    let castop12 = derived1 as Derived2
    let castop13 = derived2 as Base1
    let castop14 = derived2 as Derived1
    let castop15 = derived2 as Derived2

}
