/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a50_01

  @Level:         1

  @Assertion: 6.1.2.1(50)
              Init constructors in the class can call other constructors (via this call expression)
              in the class or superclass‘s constructor(via super call expression),
              but only one of them can be called.

  @Description: Check that another constructor can be called inside a constructor

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

var order = ""

open class Parent {
    init() {
        order += "_10"
    }
    init(x: Int64) {
        order += "_0"
    }
}

class Test <: Parent {
    init() {
        super(1)
        order += "_1"
    }
    init(x: Int64) {
        this()
        order += "_2"
    }
    init(x: Int64, y: Int64) {
        this(x)
        order += "_3"
    }
    init(x: Int64, y:Int64, z: Int64) {
        this(x, y)
        order += "_4"
    }
    init(x1: Int64, x2: Int64, x3: Int64, x4: Int64) {
        this(x1, x2, x3)
        order += "_5"
    }
    init(x: String) {
        super()
        order += "_20"
    }
}

open class ParentG<T> {
    init() {
        order += "_0"
    }
}

class TestG<T> <: ParentG<T> {
    init() {
        super()
        order += "_1"
    }
    init(x: Rune) {
        this()
        order += "_2"
    }
    init(x: T) {
        this(r'a')
        order += "_3"
    }
}

main() {
    let case1 = Test(1, 2, 3, 4)
    Assert.equals("_0_1_2_3_4_5", order)

    order = ""
    let case2 = Test("")
    Assert.equals("_10_20", order)

    order = ""
    let case3 = TestG<Float64>(0.01)
    Assert.equals("_0_1_2_3", order)
}