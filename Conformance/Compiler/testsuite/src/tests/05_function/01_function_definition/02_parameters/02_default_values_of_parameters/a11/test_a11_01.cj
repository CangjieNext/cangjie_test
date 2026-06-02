/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_02_02_a11_01

  @Level:         1

  @Assertion:     5.1.2.2(11) The default value of the parameter is evaluated when the function is called, not when 
                  the function is defined.

  @Description:   Check that default values are evaluated on function call.

  @Mode:          run

  @Negative:      no

  @Structure:     single

*/
import utils.assert.Assert

var myVar0: Int32 = 0
var myVar1: Int32 = 1

class myClass {
  myClass() {
    myVar1 = 2
  }
}

func testF0(c!: Int32 = 1/myVar0) { c }

func testF1(c!: myClass = myClass()) { "SSS" }

main() {
  Assert.equals(1, testF0(c: 1))

  Assert.equals(1, myVar1)
  Assert.equals("SSS", testF1())
  Assert.equals(2, myVar1)
}
