
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        16_01_a02_06

  @Level:         1

  @Assertion:   16.1(2) The difference between const variables and let/var declared variables is that they must be
                initialized at the time of definition and must be initialized with a const expression. 
  @Description: Checks that a local const variable must be initialized with a const expression.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no
  @Issue: 6614

*/

func f() { 1 }

main() {
    const a = f()
}
