/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        06_01_02_02_a24_04

  @Level:         1

  @Assertion:   6.1.2.2(24) •Throwing an exception in a static initializer leads to terminating the program, like
                throwing an exception on the right hand side expression of a static variable;
  @Description: Checks that throwing an exception in the struct static initializer leads to the program termination.
  @Mode: run
  @Negative: yes
  @Structure: single
  @CompileWarning: no
  @Issue: 6136

*/

struct S {
    static init() {
        throw Exception()
    }
}

main() { }
