/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_a03_14

  @Level:         1

  @Assertion: 6.2(3)
              The members of an interface can contain instance member functions,
              static member functions, operator overloaded functions,
              instance member properties and static member properties that are abstract,
              but functions and properties can be defined with default implementations.

  @Description: Check that an interface can not contain an enum definition

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

interface I {
    enum E {
        E1(Float64) |
        G(String)
    }
}

main() {
}