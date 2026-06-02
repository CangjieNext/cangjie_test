/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a59_01

  @Level:         1

  @Assertion: 6.1.2.1(59)
              Outside the constructor, it is not allowed to call the constructor of this class through the this.

  @Description: Check that it's allowed to call this inside a constructor

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

var order = ""

abstract class A {
    init() {
        order += "_0"
    }
    init(x: Int64) {
        this()
        order += "_1"
    }
}

open class B <: A {
    init(x: Int64) {
        super(x)
        order += "_2"
    }
    init() {
        this(1)
        order += "_3"
    }
}

class C <: B {
    init() {
        order += "_4"
    }

    init(x: Int64) {
        this()
        order += "_5"
    }

    init(x: Int64, y: Int64) {
        this(x)
        order += "_6"
    }
}

main() {
    C(10, 20)
    Assert.equals("_0_1_2_3_4_5_6", order)
}