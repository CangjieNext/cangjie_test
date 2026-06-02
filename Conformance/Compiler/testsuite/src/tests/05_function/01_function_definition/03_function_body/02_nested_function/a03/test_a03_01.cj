/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_03_02_a03_01

  @Level:         1

  @Assertion:     5.1.3.2(3) Nested functions support recursion.

  @Description:   Check that the nested function inside global function can be called recursively.

  @Mode:          run

  @Negative:      no

  @Structure:     single

*/
import utils.assert.Assert

func getSum(a: Int32): Int32 { 
  func recursion(n: Int32): Int32 { 
    if(n!=1){
      n + recursion(n-1)
    }else{
      1 
    }
  }
  return recursion(a)
} 

main() {
  Assert.equals(15,getSum(5))
}
