/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_04_01_a04_17

  @Level:         1

  @Comment: This assertion is a part of a list with the heading:
            Such function redefinition must comply with the following rules.

  @Assertion: 6.3.4.1(4)
              The return type of the function must be the same as
              or a subtype of the return type of the redefined function.

  @Description: Check that a class can not change the return type of the function that
                redefines a non-generic function from an open class
                to a supertype of the original return type

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

class Ret {}

open class A {
    static func f(): Ret {
        return Ret()
    }
}

class C <: A {
    public redef static func f(): Object {
        return Object()
    }
}

main() {
}