/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_04_01_a16_52

  @Level:         1

  @Assertion: 6.2.4.1(16)
              Note that when a class implements an interface,
              it needs to provide an implementation for the overloaded function declaration.

  @Description: Check that an enum can not omit implementation of
                a static generic abstract function with no parameters if it
                overloads it with a function with one parameter

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006419

*/

interface I {
    static func f<T>(): Unit
}

enum A <: I {
    E
    public static func f<T>(x: Int64) {}
}

main() {
}