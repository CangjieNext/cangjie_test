/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_04_01_a01_09

  @Level:         1

  @Assertion: 6.3.4.1(1)
              If a non-abstract static function with a name same
              as a non-abstract static function in the superclass is declared,
              the function can be declared with an optional modifier redef
              (indicating that it redefines the existing one).

  @Description: Check that the modifier 'redef' on a non-generic function can not be used
                if the parent interface does not have a function with the same name

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006426

*/

interface I {
    static func a() {}
}

class A <: I {
    public static redef func f() {}
}

main() {
}