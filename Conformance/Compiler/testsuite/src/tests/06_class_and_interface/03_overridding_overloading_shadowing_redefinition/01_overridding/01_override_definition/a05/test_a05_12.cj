/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_01_01_a05_12

  @Level:         1

  @Assertion: 6.3.1.1(5)
              Same function overrides several functions in the superclasses,
              each follows the above rules.

  @Description: Check that a class can not override several functions with one
                if one of the functions does not have the return type
                that is a supertype of the return type of the overriding function.
                One function is an abstract function from an interface
                and one is an abstract function with default implementation from an interface.

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006426

*/

open class RetType {}
class BadRetType <: RetType {}

interface I {
    func f(): BadRetType
}

interface J {
    func f(): Object {
        return Object()
    }
}

class A <: I & J {
    public override func f(): RetType {
        return RetType()
    }
}

main() {
}