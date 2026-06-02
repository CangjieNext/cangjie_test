/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_04_01_a03_160

  @Level:         1

  @Assertion: 6.2.4.1(3)
              The function name and parameter list of the implemented function
              must be the same as the corresponding function in the interface.

  @Description: Check that an enum can not implement an abstract static generic function
                from a superinterface by defining a function with the same name and parameters of different types

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

interface I {
    static func f<T>(x: Int64): Unit
}

enum A <: I {
    E(Bool)
    public static func f<T>(x: String) {}
}

main() {
}