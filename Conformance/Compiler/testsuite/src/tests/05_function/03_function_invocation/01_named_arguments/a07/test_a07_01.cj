/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_03_01_a07_01

  @Level:         1

  @Assertion:     5.3.1(7)
                  func add(a!: Int32, b!: Int32): Int32 { 
                    a + b 
                  } 
                  var sum1 = add(1, 2)                // error 
                  var sum2 = add(a: 1, b: 2)  // OK, 3 
                  var sum3 = add(b: 2, a: 1)  // OK, 3 


  @Description:   Positive examples from spec

  @Mode:          run

  @Negative:      no

  @Structure:     single

*/
import utils.assert.Assert

func add(a!: Int32, b!: Int32): Int32 { 
  a + b 
} 

main() {
  var sum2 = add(a: 1, b: 2)  // OK, 3 
  Assert.equals(3, sum2)
  var sum3 = add(b: 2, a: 1)  // OK, 3 
  Assert.equals(3, sum3)
}
