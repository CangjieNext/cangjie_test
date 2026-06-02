/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        02_01_10_a01_01

  @Level:         1

  @Assertion:   2.1.10(1) The struct type is mutable, in which multiple member 
                variables and member functions can be defined.

  @Description: Checks that the struct type is mutable, namely, reassigning variable
                of type struct does not cause compilation error and works correctly;

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
    var testStructVar: Struct = Struct(1);
    Assert.equals(1, testStructVar.memberVar, 
        reason: "Test case 1 FAILED.");

    // Test case 2
    testStructVar = Struct(2);
    Assert.equals(2, testStructVar.memberVar, 
        reason: "Test case 2 FAILED.");

    return 0;
}