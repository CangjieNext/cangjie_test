/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_04_a08_31

  @Level:         1

  @Assertion: 6.1.2.4(8)
              They can only be declared in abstract classes or interfaces.

  @Description: Check that a private instance generic function with a unit return type
                can not be abstract in an open class

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Comment: 'They' means abastract functions

*/

open class A {
    private func f<T>(): Unit
}

main() {
}