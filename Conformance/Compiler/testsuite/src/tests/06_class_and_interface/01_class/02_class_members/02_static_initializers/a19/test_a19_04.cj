
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        06_01_02_02_a19_04

  @Level:         1

  @Assertion:   6.1.2.2(19) –If an immutable static variable is initialized both directly and in a static initializer,
                the compiler reports an error about reassignment.
  @Description: Checks that an immutable static member variable cannot be initialized both directly and in the static
                initializer for struct.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no
  @Issue: 6136

*/

struct S {
    static let v = 0

    static init() {
        v = 0
    }
}

main() { }
