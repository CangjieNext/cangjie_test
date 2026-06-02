/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_03_a04_01

  @Level:         1

  @Assertion: 6.1.2.3(4)
              In this case, the execution sequence of the variable initialization
              is before the call of the super class’s constructor,
              it is prohibited to use qualified names with super
              to access the member variables of the superclass
              in the initial value expression of the instance member variables.

  @Description: Check that initialization of instance member variables is executed
                before the constructors of superclasses

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

var order = ""

open class A {
    init() {
        order += "_9"
    }
}

open class B <: A {
    B() {
        order += "_10"
    }
}

open class C <: B {
    init(x: Int64) {
        order += "_11"
    }
}

open class D <: C {
    D(x: Bool) {
        super(1)
        order += "_12"
    }
}

func initializer(x: String) {
    order += x
    return 1
}

class Test <: D {
    init() {
        super(true)
    }

    public var m1 = initializer("_1")
    public let m2 = initializer("_2")
    protected var m3 = initializer("_3")
    protected let m4 = initializer("_4")
    private var m5 = initializer("_5")
    private let m6 = initializer("_6")
    var m7 = initializer("_7")
    let m8 = initializer("_8")
}

main() {
    Test()
    Assert.equals("_1_2_3_4_5_6_7_8_9_10_11_12", order)
}