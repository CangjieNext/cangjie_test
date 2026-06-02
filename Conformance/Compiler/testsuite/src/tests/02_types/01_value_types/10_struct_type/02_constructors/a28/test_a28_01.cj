/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 02_01_10_02_a28_01

  @Level:         1

  @Assertion: 2.1.10.2(28)
              A struct can define one primary constructor.

  @Description: Check that a struct can define one primary constructor

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

var last_constructor = ""

// No parameters
struct A {
    A() {
        last_constructor = "A"
    }
}

// Parameters
struct B {
    B(x: Int64) {
        last_constructor = "B"
    }
}

// Generic no parameters
struct C<T> {
    C() {
        last_constructor = "C"
    }
}

// Generic parameters
struct D<T> {
    D(x: T) {
        last_constructor = "D"
    }
}

main() {
    let case1 = A()
    Assert.equals("A", last_constructor)

    let case2 = B(1)
    Assert.equals("B", last_constructor)

    let case3 = C<Bool>()
    Assert.equals("C", last_constructor)

    let case4 = D<String>("1")
    Assert.equals("D", last_constructor)
}