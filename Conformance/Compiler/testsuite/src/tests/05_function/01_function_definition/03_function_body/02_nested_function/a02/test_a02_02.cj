/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_03_02_a02_02

  @Level:         1

  @Assertion:     5.1.3.2 (2) Nested functions can capture variables and other nested functions, which are defined in 
                  the function body. 

  @Description:   Check that the nested function can't use variables, which are defined 
                  after in the function body.

  @Mode:          compileonly

  @Negative:      yes

  @Structure:     single

*/

func func0(a: Int32): Int32 { 
  func func1(): Int32 { 
    var localVar: Int32 = localLet
    return localVar
  }
  let localLet: Int32 = 2
  return func1()
} 
main() {
}
