/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_04_01_a06_03

  @Level:         1

  @Assertion: 6.2.4.1(6)
              The mut modifier of the implemented property
              must be the same as the corresponding property in the interface.

  @Description: Check that an enum can implement abstract properties if the 'mut' modifier is preserved

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006124

*/

import utils.assert.Assert

interface I1 {
    prop p1: Int64 {
        get() {
            0
        }
    }

    static prop p2: Int64 {
        get() {
            0
        }
    }
}

interface I2 {
    prop p1: Int64
    static prop p2: Int64
}

enum C1 <: I1 {
    EC1(Int64)

    public prop p1: Int64 {
        get() {
            11
        }
    }

    public static prop p2: Int64 {
        get() {
            12
        }
    }
}

enum C2 <: I2 {
    EC2(Int64)
    public prop p1: Int64 {
        get() {
            21
        }
    }

    public static prop p2: Int64 {
        get() {
            22
        }
    }
}

main() {
    let case1 = C1.EC1(1)
    Assert.equals(11, case1.p1)
    Assert.equals(12, C1.p2)

    let case2 = C2.EC2(2)
    Assert.equals(21, case2.p1)
    Assert.equals(22, C2.p2)
}