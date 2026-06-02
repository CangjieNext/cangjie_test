/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        06_01_02_02_a23_02

  @Level:         1

  @Assertion:   6.1.2.2(23) •Return expressions aren’t allowed in a static initializer;
  @Description: Checks that returning value is not allowed in the abstract class static initializer.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no
  @Issue: 6136

*/

abstract class A {
    static init() {
        return 1
    }
}

main() { }
