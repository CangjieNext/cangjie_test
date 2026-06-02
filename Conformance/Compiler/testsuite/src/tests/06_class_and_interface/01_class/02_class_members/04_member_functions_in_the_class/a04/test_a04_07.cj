/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_04_a04_07

  @Level:         1

  @Assertion: 6.1.2.4(4)
              The first implicit parameter of a instance member function is this.

  @Description: Check that a private static generic function can not reference this
                in its parameter list

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Comment: This checks that 'this' is not something implicitly defined in the class body.
            Together with the positive case we have that 'this' is not
            defined outside the function, not defined inside the function body
            and is visible to other parameters. It indirectly proofs that 'this' is a parameter.

*/

class A {
    private static func f<T>(x!: A = this) {}
}

main() {
}