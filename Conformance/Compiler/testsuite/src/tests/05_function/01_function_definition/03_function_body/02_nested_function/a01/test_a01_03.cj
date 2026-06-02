/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_03_02_a01_03

  @Level:         1

  @Assertion:     5.1.3.2(1) Functions can be declared in a function body. Such functions are referred to as nested 
                  functions. 

  @Description:   Check that the nested function can't be used before definition.

  @Mode:          compileonly

  @Negative:      yes

  @Structure:     single

*/

func func0(a: Int32): Int32 {
  var c = func1(a)
  func func1(b: Int32): Int32 {
    a
  }

  return c
} 

main() {
}
