/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_01_01_a05_19

  @Level:         1

  @Assertion: 6.3.1.1(5)
              Same function overrides several functions in the superclasses,
              each follows the above rules.

  @Description: Check that a class can not override several functions with one
                if one of the functions has a different name.
                Two functions are abstract functions from an interface
                and one is an abstract function from an abstract class.

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006426

*/

interface I {
    func test(): Unit
}

interface J {
    func f(): Unit
}

abstract class A {
    public func f(): Unit
}

class C <: A & I & J {
    public override func f() {}
}

main() {
}
