/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_02_a07_01

  @Level:         1

  @Assertion:     5.2(7) Example 6: The parameters’ types are both Int32 and the return type is (Int32, Int32). 
                  func returnAB(a: Int32, b: Int32): (Int32, Int32) { (a, b) } 
                  // function type: (Int32, Int32) -> (Int32, Int32)

  @Description:   Positive example from spec

  @Mode:          run

  @Negative:      no

  @Structure:     single

*/
import utils.assert.Assert

type myType0 = (Int32, Int32)
type myFuncType = (Int32, Int32) -> (Int32, Int32)

func returnAB(a: Int32, b: Int32): (Int32, Int32) { (a, b) }

main() {
  var myVar = returnAB(7, -2)
  Assert.equals(7, myVar[0])
  Assert.equals(-2, myVar[1])
  Assert.isTrue( myVar[0] is Int32)
  Assert.isTrue( myVar[1] is Int32)
  Assert.isTrue(returnAB(7, -2) is myType0)
  Assert.isTrue(returnAB is myFuncType)
}
