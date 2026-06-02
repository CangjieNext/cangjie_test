/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a30_12

  @Level:         1

  @Assertion: 6.1.2.1(30)
              A primary constructor is a syntax sugar of regular constructor.
              The compiler automatically generates a definition of the constructor
              and member variables corresponding to the main constructor,
              the form of the automatically generated constructor is as follows:
              • The modifier is the same as that of the primary constructor.
              • The sequence of parameters from left to right is the same as that of parameters
                declared in the primary constructor parameter list.
              • The constructor body is in the following format:
                – Assign values to member variables in sequence.
                  The syntax format is this.x = x, where x indicates the member variable name.
                – The code in the primary constructor body.

  @Description: Check that a constructor generated from a private primary constructor
                is invisible in the subclass

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

open class Private {
  private Private(x: Int64) {}
  init() {}
}

class Test <: Private {
  static func test() {
    let tst = Private(1)
  }
}

main() {
  Test.test()
}