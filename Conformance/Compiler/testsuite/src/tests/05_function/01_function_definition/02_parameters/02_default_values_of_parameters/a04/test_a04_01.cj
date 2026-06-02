/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_02_02_a04_01

  @Level:         1

  @Assertion:     5.1.2.2(4) In the following example, the parameter list of function add is (Int32,Int32). 
                  The default value of b is set to be 1. 
                  When add is invoked and only one value 3 is provided as the parameter value, 3 is assigned to 
                  the parameter a and the default value 1 is assigned to the parameter b. 
                  As a result, 4 is returned. 
                  If two parameter values 3 and 2 are provided, b is assigned to 2. 
                  func add(a: Int32, b!: Int32 = 1): Int32 { a + b } 
                  add(3)             // invoke add(3, 1), return 4 
                  add(3, b: 2)       // return 5 

  @Description:   Positive examples from the spec.

  @Mode:          run

  @Negative:      no

  @Structure:     single

*/
import utils.assert.Assert

func add(a: Int32, b!: Int32 = 1): Int32 { a + b } 

main() {
  Assert.equals(4, add(3))
  Assert.equals(5, add(3, b: 2))

}
