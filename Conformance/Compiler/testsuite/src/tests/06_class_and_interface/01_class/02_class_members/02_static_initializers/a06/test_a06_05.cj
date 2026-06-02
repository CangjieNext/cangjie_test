
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        06_01_02_02_a06_05

  @Level:         1

  @Assertion:   6.1.2.2(6) - There can be at most one static initializer in a class or struct;
  @Description: Checks that abstract class cannot have two static initializers.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no
  @Issue: 6136

*/

abstract class A {
    static init() { }

    static init() { }
}

main() { }
