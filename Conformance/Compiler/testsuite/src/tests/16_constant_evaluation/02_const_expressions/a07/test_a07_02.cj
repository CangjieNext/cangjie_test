
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     16_02_a07_02

  @Level:         1

  @Assertion:   16.2(7) 5.const function calls (including const constructor), the expression of the function must be a
                const expression and all real parameters must be const expressions.
  @Description: Check that a function call, where function is not a const expression, cannot be a const expression.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no
  @Issue: 6614

*/

func f() { 1 }

main() {
    const c = f()
    return 0
}
