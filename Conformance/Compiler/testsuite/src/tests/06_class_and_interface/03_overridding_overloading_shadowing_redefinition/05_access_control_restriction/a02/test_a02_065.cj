/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_05_a02_065

  @Level:         1

  @Assertion: 6.3.5(2)
              When a subclass inherits a parent class,
              the access level of the override function or
              static function redefinition cannot be changed to be lower
              than the overriden function or redefined static function in the super type.

  @Description: Check that the access level of a static function without the access modifier from an abstract class
                can not be lowered to 'private' while redefining using the 'redef' modifier

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006239

*/

abstract class A {
    static func f() {}
}

class B <: A {
    redef private static func f() {}
}

main() {
}