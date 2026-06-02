/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a55_57

  @Level:         1

  @Assertion: 6.1.2.1(55)
              If a constructor does not explicitly call other constructors,
              ensure that all instance member variables declared in this class
              have been initialized before returned from the constructor.
              Otherwise, an error will be reported during compilation.

  @Description: Check that an error is produced if a class has two constructors
                both of which do not initialize a private immutable instance variable

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

class A {
    init() {}

    init(a: Int64) {}

    private let x: Int64
}

main() {
}