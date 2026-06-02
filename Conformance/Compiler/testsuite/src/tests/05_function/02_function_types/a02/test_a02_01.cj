/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_02_a02_01

  @Level:         1

  @Assertion:     5.2(2) Example 1: No parameter and the return type is Unit. 
                  func hello(): Unit { print("Hello!") } 
                  // function type: () -> Unit 

  @Description:   Positive example from spec

  @Mode:          run

  @Negative:      no

  @Structure:     single

*/
import utils.assert.Assert

type myFuncType = () -> Unit

func hello(): Unit { print("Hello!") } 

main() {
  Assert.isTrue(hello() is Unit)
  Assert.isTrue(hello is myFuncType)
}
