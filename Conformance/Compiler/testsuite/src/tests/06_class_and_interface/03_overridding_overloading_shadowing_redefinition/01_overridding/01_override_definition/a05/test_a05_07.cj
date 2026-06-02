/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_01_01_a05_07

  @Level:         1

  @Assertion: 6.3.1.1(5)
              Same function overrides several functions in the superclasses,
              each follows the above rules.

  @Description: Check that a class can not override several functions with one
                if the functions in the supertype don't have the same signature.
                One function is an abstract function from an interface
                and one is an abstract function from an abstract class.

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006426

*/

interface I {
    func f(): Int64
}

abstract class A {
    public func f(x: Int64): Int64
}

class C <: A & I {
    public override func f(x: Int64) {
        return 1
    }
}

main() {
}