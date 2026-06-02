/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_02_a05_01

  @Level:         1

  @Assertion:     5.2(5) Example 4: The parameters’ types are ((Int32, Int32) -> Int32, Int32, and Int32 
                  and the return type is Unit. 
                  func printAdd(add: (Int32, Int32) -> Int32, a: Int32, b: Int32): Unit { 
                    print("${add(a, b)}") 
                  } 
                  // function type: ((Int32, Int32) -> Int32, Int32, Int32) -> Unit 

  @Description:   Positive example from spec

  @Mode:          run

  @Negative:      no

  @Structure:     single

*/
import utils.assert.Assert

type myFuncType0 = (Int32, Int32) -> Int32
type myFuncType1 = (myFuncType0, Int32, Int32) -> Unit
type myFuncType2 = ((Int32, Int32) -> Int32, Int32, Int32) -> Unit

func funcAdd(a: Int32, b: Int32): Int32 { a + b } 

func printAdd(add: (Int32, Int32) -> Int32, a: Int32, b: Int32): Unit {  
  print("${add(a, b)}")
}

main() {
  Assert.isTrue(funcAdd is myFuncType0)
  Assert.isTrue(printAdd(funcAdd, 12, 6) is Unit)
  Assert.isTrue(printAdd is myFuncType1)
  Assert.isTrue(printAdd is myFuncType2)
}
