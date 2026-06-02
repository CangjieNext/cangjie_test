/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_02_a06_01

  @Level:         1

  @Assertion:     5.2(6) Example 5: The parameters’ types are both Int32 and the return type is 
                  (Int32, Int32) -> Int32. 
                  func returnAdd(a: Int32, b: Int32): (Int32, Int32) -> Int32 { 
                    {a, b => a + b} 
                  } 
                  // function type: (Int32, Int32) -> (Int32, Int32) -> Int32 

  @Description:   Positive example from spec

  @Mode:          run

  @Negative:      no

  @Structure:     single

*/
import utils.assert.Assert

type myFuncType0 = (Int32, Int32) -> Int32
type myFuncType1 = (Int32, Int32) -> myFuncType0
type myFuncType2 = (Int32, Int32) -> (Int32, Int32) -> Int32 

func returnAdd(a: Int32, b: Int32): (Int32, Int32) -> Int32 { 
  {a, b => a + b}
}

main() {
  Assert.isTrue(returnAdd(12, 6) is myFuncType0)
  Assert.isTrue(returnAdd is myFuncType1)
  Assert.isTrue(returnAdd is myFuncType2)

  Assert.equals(12, returnAdd(7, 5)(7, 5))
}
