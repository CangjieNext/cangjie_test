/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_04_01_a06_01

  @Level:         1

  @Assertion: 6.2.4.1(6)
              The mut modifier of the implemented property
              must be the same as the corresponding property in the interface.

  @Description: Check that a class can implement abstract properties if the 'mut' modifier is preserved

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006124

*/

import utils.assert.Assert

interface I1 {
    mut prop p1: Int64 {
        get() {
            0
        }
        set(v) {}
    }

    prop p2: Int64 {
        get() {
            0
        }
    }

    static mut prop p3: Int64 {
        get() {
            0
        }
        set(v) {}
    }

    static prop p4: Int64 {
        get() {
            0
        }
    }
}

interface I2 {
    mut prop p1: Int64
    prop p2: Int64
    static mut prop p3: Int64
    static prop p4: Int64
}

class C1 <: I1 {
    public mut prop p1: Int64 {
        get() {
            11
        }
        set(v) {}
    }

    public prop p2: Int64 {
        get() {
            12
        }
    }

    public static mut prop p3: Int64 {
        get() {
            13
        }
        set(v) {}
    }

    public static prop p4: Int64 {
        get() {
            14
        }
    }
}

class C2 <: I2 {
    public mut prop p1: Int64 {
        get() {
            21
        }
        set(v) {}
    }

    public prop p2: Int64 {
        get() {
            22
        }
    }

    public static mut prop p3: Int64 {
        get() {
            23
        }
        set(v) {}
    }

    public static prop p4: Int64 {
        get() {
            24
        }
    }
}

main() {
    let case1 = C1()
    Assert.equals(11, case1.p1)
    Assert.equals(12, case1.p2)
    Assert.equals(13, C1.p3)
    Assert.equals(14, C1.p4)

    let case2 = C2()
    Assert.equals(21, case2.p1)
    Assert.equals(22, case2.p2)
    Assert.equals(23, C2.p3)
    Assert.equals(24, C2.p4)
}