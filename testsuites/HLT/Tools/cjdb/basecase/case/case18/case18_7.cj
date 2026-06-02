/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

open class Base {
    var name: String = "Alice"
}
class Derived1 <: Base {
    var age: UInt8 = 18
}
class Derived2 <: Base {
    var gender: String = "female"
}

main(): Int64 {

    var testVT = 1 is Int64            // testVT = true
    testVT = 1 is String               // testVT = false
    testVT = true is Int64             // testVT = false
    testVT = [1, 2, 3] is Array<Int64> // testVT = true

    let base1: Base = Base()
    let base2: Base = Derived1()
    let base3: Base = Derived2()

    let derived1: Derived1 = Derived1()
    let derived2: Derived2 = Derived2()

    var test = base1 is Base          // test = true
    test = base1 is Derived1          // test = false
    test = base1 is Derived2          // test = false
    test = base2 is Base              // test = true
    test = base2 is Derived1          // test = true
    test = base2 is Derived2          // test = false
    test = base3 is Base              // test = true
    test = base3 is Derived1          // test = false
    test = base3 is Derived2          // test = true

    test = derived1 is Base           // test = true
    test = derived1 is Derived1       // test = true
    test = derived1 is Derived2       // test = false
    test = derived2 is Base           // test = true
    test = derived2 is Derived1       // test = false
    test = derived2 is Derived2       // test = true

    return 0
}
