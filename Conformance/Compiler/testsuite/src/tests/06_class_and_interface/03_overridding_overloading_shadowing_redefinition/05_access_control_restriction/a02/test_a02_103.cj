/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_05_a02_103

  @Level:         1

  @Assertion: 6.3.5(2)
              When a subclass inherits a parent class,
              the access level of the override function or
              static function redefinition cannot be changed to be lower
              than the overriden function or redefined static function in the super type.

  @Description: Check that the access level of a protected static generic function from a sealed class
                can not be lowered to 'default' while redefining using the 'redef' modifier

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006239, 0006084

*/

sealed class A {
    protected static func f<T>() {}
}

class B <: A {
    redef static func f<T>() {}
}

main() {
}