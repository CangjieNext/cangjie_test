/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_02_02_a11_02

  @Level:         1

  @Assertion:     5.1.2.2(11) The default value of the parameter is evaluated when the function is called, not when 
                  the function is defined.

  @Description:   Check that default values are evaluated on function call: default value as expression with dividing 
                  by zero.

  @Mode:          run

  @Negative:      yes

  @Structure:     single

*/

var myVar0: Int32 = 0

func testF0(c!: Int32 = 1/myVar0) { c }

main() {
  testF0()
}
