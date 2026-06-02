
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        06_01_02_02_a02_01

  @Level:         1

  @Assertion:   6.1.2.2(2) Static initializers for enum and interface aren’t supported.
  @Description: Checks that static initializers for enum are not supported.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no
  @Issue: 6136

*/

enum E {
    E0

    static init() { }
}

main() { }
