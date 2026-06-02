/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_02_01_a04_02

  @Level:         1

  @Assertion: 6.2.2.1(4)
              interface MyInterface {
                func f1(a!: Int64): Unit // OK
                func f2(a!: Int64 = 1): Unit // Error, cannot have parameter default values
              }

  @Description: Check that the negative case from the example

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

interface MyInterface {
    func f1(a!: Int64): Unit // OK
    func f2(a!: Int64 = 1): Unit // Error, cannot have parameter default values
}

main() {
}