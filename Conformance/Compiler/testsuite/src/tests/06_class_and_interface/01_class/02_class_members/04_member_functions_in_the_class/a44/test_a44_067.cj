/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_04_a44_067

  @Level:         1

  @Assertion: 6.1.2.4(44)
              redef: When a static function redefines a static function that inherits from a parent type,
              it can be declared with an optional modifier redef.

  @Description: Check that a static non-generic function with the 'public' access modifier
                that overloads a function inherited from an abstract class
                can not be defined with the 'redef' modifier

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

abstract class A {
    static func f() {}
}

class Test <: A {
    redef public static func f(x: Int64) {}
}

main() {
}