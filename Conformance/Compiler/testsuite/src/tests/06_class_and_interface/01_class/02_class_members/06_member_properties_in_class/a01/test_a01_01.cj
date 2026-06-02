/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_06_a01_01

  @Level:         1

  @Assertion: 6.1.2.6(1)
              Properties can also be defined in class,
              see Property for the syntax of defining member properties.

  @Description: Check that the get and set functions are called on access to properties

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006124

*/

import utils.assert.Assert

var getter_proof = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
var setter_proof = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

class Test {
    mut prop p1: Int64 {
        get() {
            getter_proof[0] = 1
            1
        }
        set(v) {
            setter_proof[0] = 1
        }
    }
    prop p2: Int64 {
        get() {
            getter_proof[1] = 1
            1
        }
    }

    private mut prop p3: Int64 {
        get() {
            getter_proof[2] = 1
            1
        }
        set(v) {
            setter_proof[2] = 1
        }
    }
    private prop p4: Int64 {
        get() {
            getter_proof[3] = 1
            1
        }
    }

    protected mut prop p5: Int64 {
        get() {
            getter_proof[4] = 1
            1
        }
        set(v) {
            setter_proof[4] = 1
        }
    }
    protected prop p6: Int64 {
        get() {
            getter_proof[5] = 1
            1
        }
    }

    public mut prop p7: Int64 {
        get() {
            getter_proof[6] = 1
            1
        }
        set(v) {
            setter_proof[6] = 1
        }
    }
    public prop p8: Int64 {
        get() {
            getter_proof[7] = 1
            1
        }
    }

    static mut prop p9: Int64 {
        get() {
            getter_proof[8] = 1
            1
        }
        set(v) {
            setter_proof[8] = 1
        }
    }
    static prop p10: Int64 {
        get() {
            getter_proof[9] = 1
            1
        }
    }

    private static mut prop p11: Int64 {
        get() {
            getter_proof[10] = 1
            1
        }
        set(v) {
            setter_proof[10] = 1
        }
    }
    private static prop p12: Int64 {
        get() {
            getter_proof[11] = 1
            1
        }
    }

    protected static mut prop p13: Int64 {
        get() {
            getter_proof[12] = 1
            1
        }
        set(v) {
            setter_proof[12] = 1
        }
    }
    protected static prop p14: Int64 {
        get() {
            getter_proof[13] = 1
            1
        }
    }

    public static mut prop p15: Int64 {
        get() {
            getter_proof[14] = 1
            1
        }
        set(v) {
            setter_proof[14] = 1
        }
    }
    public static prop p16: Int64 {
        get() {
            getter_proof[15] = 1
            1
        }
    }

    static func test() {
        let tst = Test()

        let t1 = tst.p1
        tst.p1 = 2

        let t2 = tst.p2

        let t3 = tst.p3
        tst.p3 = 2

        let t4 = tst.p4

        let t5 = tst.p5
        tst.p5 = 2

        let t6 = tst.p6

        let t7 = tst.p7
        tst.p7 = 2

        let t8 = tst.p8

        let t9 = Test.p9
        Test.p9 = 2

        let t10 = Test.p10

        let t11 = Test.p11
        Test.p11 = 2

        let t12 = Test.p12

        let t13 = Test.p13
        Test.p13 = 2

        let t14 = Test.p14

        let t15 = Test.p15
        Test.p15 = 2

        let t16 = Test.p16
    }
}

main() {
    Test.test()
    Assert.equals([1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ,1], getter_proof)
    Assert.equals([1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1 ,0], setter_proof)
}