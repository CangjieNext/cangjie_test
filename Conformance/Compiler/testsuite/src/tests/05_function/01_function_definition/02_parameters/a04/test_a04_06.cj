/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_02_a04_06

  @Level:         1

  @Assertion:     5.1.2(4) Parameters defined in the parameter list are all immutable variables, i.e. they are 
                  defined with let and cannot be assigned within the function definition.

  @Description:   Check that non-named parameter can't be assigned within the nested function definition.

  @Mode:          compileonly

  @Negative:      yes

  @Structure:     single

*/

func myFunc(a: String) {

  func myChildFunc(n: String) {
    n = "new value"
  }

  myChildFunc(a)
}

main() {
}
