/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_04_a03_01

  @Level:         1

  @Assertion:     5.1.4(3) In the following example, the return value is a function of type (Int32, Int32) -> Int32. 
                  func returnAdd(a: Int32, b: Int32): (Int32, Int32) -> Int32 { 
                    return {a, b => a + b}         // Return a lambda expression. 
                  } 

  @Description:   Positive example from the spec.

  @Mode:          run

  @Negative:      no

  @Structure:     single

*/
import utils.assert.Assert

func returnAdd(a: Int32, b: Int32): (Int32, Int32) -> Int32 { 
  return {a, b => a + b}         // Return a lambda expression. 
} 

main() {
  var myLambda = returnAdd(2,4)
  Assert.equals(9, myLambda(3,6))
}
