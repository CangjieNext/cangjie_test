/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         03_04_01_01_a01_01
  @Assertion:    3.4.1.1(1) Default access modifier, without any keyword modifiers.
                 Members declared with the default access modifier are visible to
                 members within the same package.

  @Description:  Checks that various types with default access modifier are
                 visible to members within the same package.

  @Mode:         run
  @Negative:     no
  @Structure:    complex-main
  @Dependencies: aux_test_a01_01.cj
  @Comment:

*/
package very_long_package_name_consist_of_letters_and_number13_to_test_overall_available_length_and_test_defaul_access_modifier

import utils.assert.Assert

main() {
    var numE = CONST_FLOAT
    let obj:Option<Test> = Option<Test>.None;

    Assert.equals(-2147483648, testInt, reason:"Int value must match")
    Assert.equals(CONST_FLOAT, numE, reason:"Float64 value must match")
    Assert.isTrue(trigger, reason: "Boolean value should match")
    Assert.isNone(obj, reason: "Instance wasn't created")
    Assert.equals("ABC String for testing", testFunc(), reason:"String value must match")
}
