
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_20_a05_01

  @Level:         1

  @Assertion:   4.20(5) Logic NOT (!) is a prefix-unary operator.
  @Description: Checks compilation and execution of a program that uses logical operator ! placed appropriately. 
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: ignore

*/

main() {
    !false

    let x = !true
    let y = !x

    if (!x || !y) {}
}
