/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_13_01_a06_04

  @Level:         1

  @Assertion: 4.13.1(6) If T is a class name, interface name, or struct name, allow access
              to its static members directly by type name.

  @Description: Check that usage of 'T.a' expression where 'T' is a name of struct and 'a' is a non-static data member
                causes a compilation error.

  @Mode: compileonly

  @Negative: yes

*/

struct S {
    S(var x!: Int64) {}
}

main() {
    S.x
    return
}

