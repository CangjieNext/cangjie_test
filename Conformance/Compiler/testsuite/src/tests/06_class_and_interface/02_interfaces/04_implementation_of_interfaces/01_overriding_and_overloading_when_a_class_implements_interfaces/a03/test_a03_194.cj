/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_04_01_a03_194

  @Level:         1

  @Assertion: 6.2.4.1(3)
              The function name and parameter list of the implemented function
              must be the same as the corresponding function in the interface.

  @Description: Check that an enum can not implement an abstract static generic function
                from a superinterface by defining a function with the same name
                and a parameter being of type that is a supertype of the parameter in the superinterface
                with the 'redef' modifier

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

open class Parent {}
class Child <: Parent {}

interface I {
    static func f<T>(x: Child): Unit
}

enum A <: I {
    E(Bool)
    public redef static func f<T>(x: Parent) {}
}

main() {
}