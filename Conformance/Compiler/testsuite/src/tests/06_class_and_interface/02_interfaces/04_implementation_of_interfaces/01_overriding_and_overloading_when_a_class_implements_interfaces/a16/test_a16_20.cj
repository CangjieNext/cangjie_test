/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_04_01_a16_20

  @Level:         1

  @Assertion: 6.2.4.1(16)
              Note that when a class implements an interface,
              it needs to provide an implementation for the overloaded function declaration.

  @Description: Check that a class can not omit implementation of
                an abstract operator with one parameter if it
                overloads it with an operator with no parameters

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006419

*/

interface I {
    operator func ()(x: Rune): Unit
}

class A <: I {
    public operator func ()() {}
}

main() {
}