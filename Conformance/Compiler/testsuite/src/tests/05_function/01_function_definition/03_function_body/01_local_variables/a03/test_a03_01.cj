/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_03_01_a03_01

  @Level:         1

  @Assertion:     5.1.3.1(3)
                  func foo(): Unit { 
                    var a = 1 
                    let b = 1 
                  } 

  @Description:   Positive example from the spec.

  @Mode:          run

  @Negative:      no

  @Structure:     single

*/
import utils.assert.Assert

func foo(): Unit { 
  var a = 1 
  let b = 1 
  Assert.equals(1, a)
  Assert.equals(1, b)
} 

main() {
  foo()
}
