/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_01_01_a04_09

  @Level:         1

  @Comment: This assertion is a part of a list with the heading:
            Such function overriding must comply with the following rules.

  @Assertion: 6.3.1.1(4)
              The return type of the function must be the same as
              or be a subtype of the return type of the overridden function.

  @Description: Check that a class can not change the return type of
                an abstract function from an abstract class
                to a supertype of the original type

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

class T {}

abstract class A {
    public func f(): T
}

class C <: A {
    public override func f(): Object {
        return Object()
    }
}

main() {
}