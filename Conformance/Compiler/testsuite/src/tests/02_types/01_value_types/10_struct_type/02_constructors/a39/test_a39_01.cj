/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:02_01_10_02_a39_01

  @Level:         1

  @Assertion: 2.1.10.2(39)
              It is not allowed to invoke a constructor via this outside of the constructor body.

  @Description: Check that it's allowed to call this inside a constructor

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

var order = ""

struct A {
    init() {
        order += "_0"
    }
    init(x: Int64) {
        this()
        order += "_1"
    }
}

struct B {
    init(x: Int64) {
        order += "_2"
    }
    init() {
        this(1)
        order += "_3"
    }
}

struct C {
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
    A(1)
    Assert.equals("_0_1", order)
    B()
    Assert.equals("_0_1_2_3", order)
    C(10, 20)
    Assert.equals("_0_1_2_3_4_5_6", order)
}