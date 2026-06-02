/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        02_01_10_a01_02

  @Level:         1

  @Assertion:   2.1.10(1) The struct type is mutable, in which multiple member 
                variables and member functions can be defined.

  @Description: Checks that the struct type is mutable, namely, reassigning member variable
                of struct does not cause compilation error and works correctly;

  @Mode:        run
  @Negative:    no
  @Structure:   single

*/

import utils.assert.Assert

struct Struct {
    var memberVar: Int32;
    init(memberVar: Int32) {
        this.memberVar = memberVar;
    };
}

main() {
    // Test case 1
    var testStructVar: Struct = Struct(10);
    Assert.equals(10, testStructVar.memberVar, 
        reason: "Test case 1 FAILED.");

    // Test case 2
    testStructVar.memberVar = 20;
    Assert.equals(20, testStructVar.memberVar, 
        reason: "Test case 2 FAILED.");

    return 0;
}

