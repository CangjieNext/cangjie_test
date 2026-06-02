
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     16_04_a03_01

  @Level:         1

  @Assertion:   16.4(3) 1.const function declarations must be modified with const.
  @Description: Checks that a function without const is not a const function, since a const function would be able to
                be assigned to a const variable because it's a const expression.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no
  @Issue: 6614

*/

func f() { }

main() {
    const c = f
}
