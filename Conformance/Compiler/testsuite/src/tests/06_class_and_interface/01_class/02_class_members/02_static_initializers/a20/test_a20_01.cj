
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        06_01_02_02_a20_01

  @Level:         1

  @Assertion:   6.1.2.2(20) ∗That error is also reported if an immutable static variable is assigned in a static
                initializer several times.
  @Description: Checks that an immutable static member variable cannot be assigned several times in the static
                initializer for class.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no
  @Issue: 6136

*/

class C {
    static let x : Int64

    static init() {
        x = 1
        x = 2
    }
}

main() { }
