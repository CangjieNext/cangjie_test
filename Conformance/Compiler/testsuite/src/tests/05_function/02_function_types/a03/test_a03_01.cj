/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_02_a03_01

  @Level:         1

  @Assertion:     5.2(3) Example 2: The parameter type is Int32 and the return type is Unit. 
                  func display(a: Int32): Unit { print("${a}") } 
                  // function type: (Int32) -> Unit 

  @Description:   Positive example from spec

  @Mode:          run

  @Negative:      no

  @Structure:     single

*/
import utils.assert.Assert

type myFuncType = (Int32) -> Unit

func display(a: Int32): Unit { print("${a}") } 

main() {
  Assert.isTrue(display(12) is Unit)
  Assert.isTrue(display is myFuncType)
}
