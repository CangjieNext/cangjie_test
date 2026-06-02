/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_17_01_a03_01

  @Level:         1

  @Assertion:   4.17.1(3) Examples of using the is operator:
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

                    var testVT = 1 is Int64 // testVT = true
                    testVT = 1 is String // testVT = false
                    testVT = true is Int64 // testVT = false
                
                    testVT = [1, 2, 3] is Array<Int64> // testVT = true
                    let base1: Base = Base()
                    let base2: Base = Derived1() 
                    let base3: Base = Derived2()

                    let derived1: Derived1 = Derived1() 
                    let derived2: Derived2 = Derived2()

                    var test = base1 is Base // test = true
                    test = base1 is Derived1 // test = false
                    test = base1 is Derived2 // test = false
                    test = base2 is Base // test = true
                    test = base2 is Derived1 // test = true
                    test = base2 is Derived2 // test = false
                    test = base3 is Base // test = true
                    test = base3 is Derived1 // test = false
                    test = base3 is Derived2 // test = true

                    test = derived1 is Base // test = true 
                    test = derived1 is Derived1 // test = true 
                    test = derived1 is Derived2 // test = false 
                    test = derived2 is Base // test = true 
                    test = derived2 is Derived1 // test = false 
                    test = derived2 is Derived2 // test = true

                    return 0
                }
  @Description: Check the given example.
  @Mode: run
  @Negative: no
  @Structure: single

*/

import utils.assert.Assert

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

    var testVT = 1 is Int64 // testVT = true
    Assert.equals(true, testVT)
    testVT = 1 is String // testVT = false
    Assert.equals(false, testVT)
    testVT = true is Int64 // testVT = false
    Assert.equals(false, testVT)

    testVT = [1, 2, 3] is Array<Int64> // testVT = true
    Assert.equals(true, testVT)
    let base1: Base = Base()
    let base2: Base = Derived1() 
    let base3: Base = Derived2()

    let derived1: Derived1 = Derived1() 
    let derived2: Derived2 = Derived2()

    var test = base1 is Base // test = true
    Assert.equals(true, test)
    test = base1 is Derived1 // test = false
    Assert.equals(false, test)
    test = base1 is Derived2 // test = false
    Assert.equals(false, test)
    test = base2 is Base // test = true
    Assert.equals(true, test)
    test = base2 is Derived1 // test = true
    Assert.equals(true, test)
    test = base2 is Derived2 // test = false
    Assert.equals(false, test)
    test = base3 is Base // test = true
    Assert.equals(true, test)
    test = base3 is Derived1 // test = false
    Assert.equals(false, test)
    test = base3 is Derived2 // test = true
    Assert.equals(true, test)

    test = derived1 is Base // test = true 
    Assert.equals(true, test)
    test = derived1 is Derived1 // test = true 
    Assert.equals(true, test)
    test = derived1 is Derived2 // test = false 
    Assert.equals(false, test)
    test = derived2 is Base // test = true
    Assert.equals(true, test)
    test = derived2 is Derived1 // test = false 
    Assert.equals(false, test)
    test = derived2 is Derived2 // test = true
    Assert.equals(true, test)

    return 0
}
