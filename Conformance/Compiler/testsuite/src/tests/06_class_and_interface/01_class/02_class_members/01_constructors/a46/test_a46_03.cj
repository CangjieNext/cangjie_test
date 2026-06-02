/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a46_03

  @Level:         1

  @Assertion: 6.1.2.1(46)
              When creating an instance of a class,
              the declarations and expressions in the class will be executed in the following order:
              1. Run the declaration of member variables except primary constructor.
              2. If the constructor body does not explicitly invoke another constructor of this class
                or the superclass’s constructor, invoke the superclass’s parameterless constructor super().
                If the superclass does not have a parameterless constructor, an error will be reported.
              3. Execute the code in the constructor body.

  @Description: Check that not calling super() while the parameterless constructor
                in the superclass is inaccessible causes an error

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006221

*/

open class Parent {
  private init() {}
  init(x: Int64) {}
}

class A <: Parent {
  init() {
  }
}

main() {
}