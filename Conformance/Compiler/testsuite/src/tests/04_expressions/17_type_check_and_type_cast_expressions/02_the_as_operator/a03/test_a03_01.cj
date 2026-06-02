/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_17_02_a03_01

  @Level:         1

  @Assertion:   4.17.2(3) Examples of using the as operator:
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
                    let base1: Base = Base()
                    let base2: Base = Derived1() 
                    let base3: Base = Derived2()

                    let derived1: Derived1 = Derived1() let derived2: Derived2 = Derived2()
                    let castOP1 = base1 as Base  // castOP = Option<Base>.Some(base1)
                    let castOP2 = base1 as Derived1 // castOP = Option<Derived1>.None
                    let castOP3 = base1 as Derived2 // castOP = Option<Derived2>.None
                    let castOP4 = base2 as Base  // castOP = Option<Base>.Some(base2)
                    let castOP5 = base2 as Derived1 // castOP = Option<Derived1>.Some(base2)
                    let castOP6 = base2 as Derived2 // castOP = Option<Derived2>.None
                    let castOP7 = base3 as Base  // castOP = Option<Base>.Some(base3)
                    let castOP8 = base3 as Derived1 // castOP = Option<Derived1>.None
                    let castOP9 = base3 as Derived2 // castOP = Option<Derived2>.Some(base3)

                    let castOP10 = derived1 as Base  // castOP = Option<Base>.Some(derived1)
                    let castOP11 = derived1 as Derived1  // castOP = Option<Derived1>.Some(derived1) 
                    let castOP12 = derived1 as Derived2  // castOP = Option<Derived2>.None
                    let castOP13 = derived2 as Base  // castOP = Option<Base>.Some(derived2) 
                    let castOP14 = derived2 as Derived1  // castOP = Option<Derived1>.None
                    let castOP15 = derived2 as Derived2  // castOP = Option<Derived2>.Some(derived2)

                    return 0
                }
  @Description: Check the given example.
  @Mode: run
  @Negative: no
  @Structure: single

*/

import utils.assert.Assert

var counter : Int64 = 0

open class Base {
    var name: String = "Alice"
    let id : Int64
    init() {
      id = counter
      counter++
    }
}
class Derived1 <: Base { 
    var age: UInt8 = 18
}
class Derived2 <: Base {
    var gender: String = "female"
}

func checkNone<T>(o : Option<T>) where T <: Base {
    var val = match (o) {
        case None => false
        case Some(_) => true
    }
    Assert.isFalse(val)
}

func checkSome<T>(o : Option<T>, expected : Base) where T <: Base {
    var val = match (o) {
        case None => false
        case Some(_) => true
    }
    Assert.isTrue(val)
    Assert.equals(expected.id, o.getOrThrow().id)
}

main(): Int64 {
    let base1: Base = Base()
    let base2: Base = Derived1() 
    let base3: Base = Derived2()

    let derived1: Derived1 = Derived1()
    let derived2: Derived2 = Derived2()
    let castOP1 = base1 as Base  // castOP = Option<Base>.Some(base1)
    checkSome(castOP1, base1)
    let castOP2 = base1 as Derived1 // castOP = Option<Derived1>.None
    checkNone(castOP2)
    let castOP3 = base1 as Derived2 // castOP = Option<Derived2>.None
    checkNone(castOP3)
    let castOP4 = base2 as Base  // castOP = Option<Base>.Some(base2)
    checkSome(castOP4, base2)
    let castOP5 = base2 as Derived1 // castOP = Option<Derived1>.Some(base2)
    checkSome(castOP5, base2)
    let castOP6 = base2 as Derived2 // castOP = Option<Derived2>.None
    checkNone(castOP6)
    let castOP7 = base3 as Base  // castOP = Option<Base>.Some(base3)
    checkSome(castOP7, base3)
    let castOP8 = base3 as Derived1 // castOP = Option<Derived1>.None
    checkNone(castOP8)
    let castOP9 = base3 as Derived2 // castOP = Option<Derived2>.Some(base3)
    checkSome(castOP9, base3)

    let castOP10 = derived1 as Base  // castOP = Option<Base>.Some(derived1)
    checkSome(castOP10, derived1)
    let castOP11 = derived1 as Derived1  // castOP = Option<Derived1>.Some(derived1)
    checkSome(castOP11, derived1)
    let castOP12 = derived1 as Derived2  // castOP = Option<Derived2>.None
    checkNone(castOP12)
    let castOP13 = derived2 as Base  // castOP = Option<Base>.Some(derived2)
    checkSome(castOP13, derived2)
    let castOP14 = derived2 as Derived1  // castOP = Option<Derived1>.None
    checkNone(castOP14)
    let castOP15 = derived2 as Derived2  // castOP = Option<Derived2>.Some(derived2)
    checkSome(castOP15, derived2)


    return 0
}