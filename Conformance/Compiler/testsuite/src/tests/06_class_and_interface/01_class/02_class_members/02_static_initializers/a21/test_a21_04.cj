/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        06_01_02_02_a21_04

  @Level:         1

  @Assertion:   6.1.2.2(21) –If a static variable isn’t initialized neither directly nor in a static initializer, the
                compiler reports an error about not initialized variable;
  @Description: Checks that not initialing an immutable static variable neither directly nor in a static initializer
                results in a compilation error for abstract class.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no
  @Issue: 6136

*/

abstract class A {
    static let x : Int64

    static init() { }
}

main() { }
