
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     16_04_a02_03

  @Level:         1

  @Assertion:   16.4(2) The difference between const functions and normal functions is that they are partially
                restricted to affect compile-time evaluation. const functions can only have declarations, const
                expressions, and restricted partial assignment expressions in them.
  @Description: Checks that const functions cannot have non-const expressions.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no
  @Issue: 6614

*/

func g() { 1 }

const func f() {
    g()
}

main() { }
