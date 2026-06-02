
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     16_02_a06_02

  @Level:         1

  @Assertion:   16.2(6) 4.const functions, which contain function names declared using const, lambda's that match the
                requirements of const functions, and the function expressions returned by those functions.
  @Description: Check that a non-const function cannot be a const expression.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no
  @Issue: 6614

*/

func f() { 1 }

main() {
    const c = f
    return 0
}
