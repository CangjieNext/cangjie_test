/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_04_a12_26

  @Level:         1

  @Assertion: 6.1.2.4(12)
              Abstract instance member functions have the semantics of open by default.

  @Description: Check that an abstract function with parameters and with a unit return type
                and with the public access modifier
                can not have optional parameters

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006200

  @Comment: From the chapter 5.1.2.2 Default Values of Parameters:
            Functions explicitly or implicitly modified by the open
            keyword in a class or interface cannot have optional parameters.

*/

abstract class A {
    public func f(x: Bool, y!: String = ""): Unit
}

main() {
}