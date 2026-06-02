/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_01_01_a09_13

  @Level:         1

  @Assertion: 6.3.1.1(9)
              Functions modified with private in a class are not inherited and cannot be accessed in subclasses.

  @Description: Check that a function with parameters and a non-Unit return type
                can not override a private functions from a sealed class

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006084

  @Comment: this assertion is in the context of function overriding in a class

*/

sealed class A {
    private func f(x: Bool) {
        return 1
    }
}

class B <: A {
    override func f(x: Bool) {
        return 1
    }
}

main() {
}