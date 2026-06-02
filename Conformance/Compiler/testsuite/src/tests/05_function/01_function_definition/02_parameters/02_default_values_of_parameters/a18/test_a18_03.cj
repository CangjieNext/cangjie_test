/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_02_02_a18_03

  @Level:         1

  @Assertion:     5.1.2.2(18)
                  /* 
                    When a function is called, the name in the function declaration can use the default value. When a 
                    function is called by using a variable name, arguments cannot be optional. 
                  */ 
                  func f1(): (Int64) -> Unit { g1 } 
                  func g1(a!: Int64 = 42) { 
                    print("g1: ${a}") 
                  } 
                  let gg1 = f1() 
                  let x = gg1()       // Error, cannot ommit the argument. 
                  let gg3 = g1 
                  let a = gg3()      // Error, cannot ommit the argument. 

  @Description:   Negative example from the spec.

  @Mode:          compileonly

  @Negative:      yes

  @Structure:     single

*/

func f1(): (Int64) -> Unit { g1 } 
func g1(a!: Int64 = 42) { 
  print("g1: ${a}") 
} 
let gg3 = g1 
let a = gg3()      // Error, cannot ommit the argument. 

main() {
}
