/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_02_a04_01

  @Level:         1

  @Assertion:     5.2(4) Example 3: The parameters’ types are both Int32 and the return type is Int32. 
                  func add(a: Int32, b: Int32): Int32 { a + b } 
                  // function type: (Int32, Int32) -> Int32 

  @Description:   Positive example from spec

  @Mode:          run

  @Negative:      no

  @Structure:     single

*/
import utils.assert.Assert

type myFuncType = (Int32, Int32) -> Int32

func add(a: Int32, b: Int32): Int32 { a + b } 

main() {
  Assert.equals(18, add(12, 6))
  Assert.isTrue(add(12, 6) is Int32)
  Assert.isTrue(add is myFuncType)
}
