/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_02_02_a06_03

  @Level:         1

  @Assertion:     5.1.2.2(6) Operator functions cannot have optional parameters.

  @Description:   Check that type operator func can't be defined with optional parameters.

  @Mode:          compileonly

  @Negative:      yes

  @Structure:     single

*/

extend Int64 {
  operator func **(i!: Int64 = 12) {i}
}

main() {
}
