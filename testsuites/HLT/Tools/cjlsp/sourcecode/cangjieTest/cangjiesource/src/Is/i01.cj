/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.Is

open class Base_new {
    var name: String = "Alice"
}
class Derived1 <: Base_new {
    var age: UInt8 = 18
}

class Derived2 <: Base_new {
    var gender: String = "female"
}

func a1() {
    let aa: Base_new = Base_new()
    let base2: Base_new = Derived1()
    let base3: Base_new = Derived2()
    let derived1: Derived1 = Derived1()
    let derived2: Derived2 = Derived2()
    let castop1 = aa is Base_new
    let castop2 = aa is Derived1
    let castop3 = aa is Derived2
    let castop4 = base2 is Base_new
    let castop5 = base2 is Derived1
    let castop6 = base2 is Derived2
    let castop7 = base3 is Base_new
    let castop8 = base3 is Derived1
    let castop9 = base3 is Derived2
    let castop10 = derived1 is Base_new
    let castop11 = derived1 is Derived1
    let castop12 = derived1 is Derived2
    let castop13 = derived2 is Base_new
    let castop14 = derived2 is Derived1
    let castop15 = derived2 is Derived2
    
}
