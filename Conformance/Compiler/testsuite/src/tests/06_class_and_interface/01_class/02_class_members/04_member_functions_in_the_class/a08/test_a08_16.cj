/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_04_a08_16

  @Level:         1

  @Assertion: 6.1.2.4(8)
              They can only be declared in abstract classes or interfaces.

  @Description: Check that an instance generic function without modifiers and with a non-unit return type
                can not be abstract in a regular class

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Comment: 'They' means abastract functions

*/

class A {
    func f<T>(): Int64
}

main() {
}