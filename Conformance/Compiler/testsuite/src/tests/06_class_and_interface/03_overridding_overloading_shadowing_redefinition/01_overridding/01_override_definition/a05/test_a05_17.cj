/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_01_01_a05_17

  @Level:         1

  @Assertion: 6.3.1.1(5)
              Same function overrides several functions in the superclasses,
              each follows the above rules.

  @Description: Check that a class can not override several functions with one
                if one of the functions has a different name.
                Two functions are abstract functions from an interface
                and one is an abstract function from an interface.

  @Mode: compileonly

  @Negative: no

  @Structure: single

  @Issue: 0006426

*/

interface I {
    func `f`(): Unit
}

interface J {
    func f(): Unit
}

interface A {
    func f(): Unit
}

class C <: A & I & J {
    public override func f() {}
}

main() {
}