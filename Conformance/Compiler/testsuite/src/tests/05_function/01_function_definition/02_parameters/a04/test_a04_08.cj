/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_02_a04_08

  @Level:         1

  @Assertion:     5.1.2(4) Parameters defined in the parameter list are all immutable variables, i.e. they are 
                  defined with let and cannot be assigned within the function definition.

  @Description:   Check that named parameter can't be assigned within the interface member function definition.

  @Mode:          compileonly

  @Negative:      yes

  @Structure:     single

*/

interface myInterface {
  func myFunc(f!: Float32) {
    f = 4.56
  }
}

main() {
}
