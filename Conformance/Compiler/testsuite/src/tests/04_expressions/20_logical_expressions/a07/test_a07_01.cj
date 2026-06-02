
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_20_a07_01

  @Level:         1

  @Assertion:   4.20(7) Logic AND and OR are binary operators.
  @Description: Checks compilation and execution of a program that uses logical operators && and || placed
                appropriately.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: ignore

*/

main() {
    true && false
    false || true

    let x = true || false
    let y = x && x

    if ((x && y) || (y || x)) {}
}
