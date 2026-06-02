/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_03_02_a02_03

  @Level:         1

  @Assertion:     5.1.3.2 (2) Nested functions can capture variables and other nested functions, which are defined in 
                  the function body. 

  @Description:   Check that the nested function can't call other nested function, which are defined in the function 
                  body.

  @Mode:          compileonly

  @Negative:      yes

  @Structure:     single

*/

enum myEnum {
  A

  func myEnumFunc() {
    var localVar0: Int64 = 4
    func myNestedFunc0() {
      var localVar1 = localVar0
      localVar1 + myNestedFunc1()
    }
    func myNestedFunc1() {
      var localVar2 = localVar0
      localVar2
    }
    myNestedFunc0()
  }
}
main() {
}
