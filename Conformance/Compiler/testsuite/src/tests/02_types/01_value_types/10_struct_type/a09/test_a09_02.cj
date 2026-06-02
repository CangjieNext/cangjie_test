/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        02_01_10_a09_02

  @Level:         1

  @Assertion:   2.1.10(9) A struct type is said to be recursive, if at least one of its non-static member 
                variable’s type contains the struct type itself.

  @Description: Checks that non-static member variable of struct can be of other struct type.

  @Mode:        run
  @Negative:    no
  @Structure:   single

*/

import utils.assert.Assert

struct Struct1 {
    var s1Member: Int32;

    public Struct1(par: Int32) {
        this.s1Member = par;
    }
}

struct Struct2 {
    var s2Member: Struct1;

    public Struct2(par: Int32) {
        if (par > 999) {
            this.s2Member = Struct1(999);
        } else {
            this.s2Member = Struct1(par);
        }
    }
}

main() {
    // Test case 1
    Assert.equals(888, Struct2(888).s2Member.s1Member, 
        reason: "Test case 1 FAILED.");

    // Test case 2
    Assert.equals(999, Struct2(1111).s2Member.s1Member, 
        reason: "Test case 2 FAILED.");

    return 0;
}

