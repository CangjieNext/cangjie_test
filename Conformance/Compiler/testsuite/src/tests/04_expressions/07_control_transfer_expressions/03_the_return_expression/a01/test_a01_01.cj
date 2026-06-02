
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_07_03_a01_01

  @Level:         1

  @Assertion:   4.7.3(1) A return expression is composed of the keyword return and an optional expression.
  @Description: Test containing return expression with just keyword return and return and an optional expression.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

func f() {
    return
}

func g() {
    return 0
}

main() {
    f()
    g()
}
