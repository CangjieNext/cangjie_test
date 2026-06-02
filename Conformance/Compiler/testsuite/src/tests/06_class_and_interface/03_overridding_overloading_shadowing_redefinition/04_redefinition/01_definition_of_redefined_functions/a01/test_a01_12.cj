/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_04_01_a01_12

  @Level:         1

  @Assertion: 6.3.4.1(1)
              If a non-abstract static function with a name same
              as a non-abstract static function in the superclass is declared,
              the function can be declared with an optional modifier redef
              (indicating that it redefines the existing one).

  @Description: Check that a generic instance function can not redefine
                an instance function with the same name from a parent interface

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006426

*/

interface I {
    func f() {}
}

class A <: I {
    public redef func f<T>() {}
}

main() {
}