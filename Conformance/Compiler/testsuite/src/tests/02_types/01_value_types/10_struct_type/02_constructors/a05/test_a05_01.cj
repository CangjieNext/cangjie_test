/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 02_01_10_02_a05_01

  @Level:         1

  @Assertion: 2.1.10.2(5)
              The keyword func is not allowed before the primary constructor name.

  @Description: Check that a member with the same name as the struct,
                without member variable parameters and with the func keyword
                is treated as a function and not as a constructor

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

var constructor_counter = 0

struct A {
    func A() {
        constructor_counter++
    }
}

struct B {
    public func B() {
        constructor_counter++
    }
}

struct C {
    private func C() {
        constructor_counter++
    }

    func check_private() {
        C()
    }
}

struct D {
    func D(x: Int64) {
        constructor_counter++
    }
}

struct E {
    public func E(b!: String = "1") {
        constructor_counter++
    }
}

struct F {
    private func F(a: Int64) {
        constructor_counter++
    }

    func check_private() {
        F(10)
    }
}

main() {
    Assert.equals(0, constructor_counter)

    var case1 = A()
    Assert.equals(0, constructor_counter)

    var case2 = B()
    Assert.equals(0, constructor_counter)

    var case3 = C()
    Assert.equals(0, constructor_counter)

    var case4 = D()
    Assert.equals(0, constructor_counter)

    var case5 = E()
    Assert.equals(0, constructor_counter)

    var case6 = F()
    Assert.equals(0, constructor_counter)

    case1.A()
    Assert.equals(1, constructor_counter)
    
    case2.B()
    Assert.equals(2, constructor_counter)

    case3.check_private()
    Assert.equals(3, constructor_counter)

    case4.D(1)
    Assert.equals(4, constructor_counter)

    case5.E()
    Assert.equals(5, constructor_counter)

    case6.check_private()
    Assert.equals(6, constructor_counter)  
}
