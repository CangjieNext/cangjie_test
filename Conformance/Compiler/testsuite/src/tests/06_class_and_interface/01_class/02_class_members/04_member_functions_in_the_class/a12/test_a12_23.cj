/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_04_a12_23

  @Level:         1

  @Assertion: 6.1.2.4(12)
              Abstract instance member functions have the semantics of open by default.

  @Description: Check that an abstract function without parameters and with a non-unit return type
                and with the protected access modifier
                can not be generic with constraints

  @Mode: run

  @Negative: no

  @Structure: single

  @Comment: 6.4.2 Generic Member Function in Class and Interface:
            In Cangjie programming language, nonstatic abstract functions
            and open functions in classes and interfaces are allowed to declare generic parameters

*/

interface I {}
abstract class A {
    protected func f<T1, T2>(): String where T1 <: I, T2 <: I
}

main() {
}