/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_04_a02_01

  @Level:         1

  @Assertion:     5.1.4(2) In the following example, the function returns a tuple (a, b) and the return type is 
                  (Int32, Int32) 
                    func returnAB(a: Int32, b: Int32): (Int32, Int32) { (a, b) } 
                  a function type, in which case the return value is a function. 

  @Description:   Positive example from the spec.

  @Mode:          run

  @Negative:      no

  @Structure:     single

*/
import utils.assert.Assert

func returnAB(a: Int32, b: Int32): (Int32, Int32) { (a, b) } 

main() {
  var (x, y) = returnAB(2,4)
  Assert.equals(2, x)
  Assert.equals(4, y)
}
