/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_02_04_a10_04

  @Level:         1
  @Assertion:    3.2.4(10) The following example illustrate shadowing on variables in different scenarios.

  @Mode:         run
  @Negative:     no
  @Issue:        6326

*/

func f(x: Int32, y: Int32): Unit {
    let Maze : Maze
}

enum Maze {
    C1 | C2
}

main() {
}
