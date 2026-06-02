/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_03_01_a01_01

  @Level:         1

  @Assertion:     5.1.3.1(1) In the Cangjie programming language, variables declared in a function body are called 
                  local variables. 

  @Description:   Check that variables can be declared in function body.

  @Mode:          run

  @Negative:      no

  @Structure:     single

*/
import utils.assert.Assert

func func0(): Unit { 
  var b = -1 
  let h = 12 
  Assert.equals(-1, b)
  Assert.equals(12, h)
} 

func funcParent() {
  var parentVar: Int32 = 8
  Assert.equals(8, parentVar)
  func funcNested() {
    var nestedVar = "DDDD"
    var nestedLet = 'B'
    Assert.equals("DDDD", nestedVar)
    Assert.equals('B', nestedLet)
    0
  }
  funcNested()
}

main() {
  func0()
  funcParent()
}
