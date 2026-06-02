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

  @Description:  This file stores various structures being tested

  @Mode:         run
  @Negative:     no
  @Structure:    complex-aux
  @Dependencies:
  @Comment:

*/
package very_long_package_name_consist_of_letters_and_number13_to_test_overall_available_length_and_test_defaul_access_modifier

var testInt:Int32 = 1 << 31;
let CONST_FLOAT:Float64 = 1.2353546346e24
let trigger:Bool = true

class Test {}

func testFunc():String {
    return "ABC String for testing";
}
