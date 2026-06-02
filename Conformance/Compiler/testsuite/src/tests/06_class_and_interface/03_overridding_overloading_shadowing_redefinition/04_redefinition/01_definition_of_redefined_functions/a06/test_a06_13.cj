/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_04_01_a06_13

  @Level:         1

  @Comment: This assertion is a part of a list with the heading:
            Such function redefinition must comply with the following rules.

  @Assertion: 6.3.4.1(6)
              Same function redefines several functions in the super classes, each follows the above rules.

  @Description: Check that a class can not redefine several generic functions with one
                if the functions in the supertype don't have the same signature.
                One function is an abstract function from an interface
                and one is a function from an abstract class.

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006426

*/

interface I {
    static func f<T>(): Int64
}

abstract class A {
    static func f<T>(x: Int64) {
        return 0
    }
}

class C <: A & I {
    public redef static func f<T>(x: Int64) {
        return 1
    }
}

main() {
}