
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_20_a01_01

  @Level:         1

  @Assertion:   4.20(1) Logical expressions are expressions that contain logical operators. 
  @Description: Checks compilation and execution of a program that uses logical expressions. 
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: ignore

*/

import utils.assert.Assert

main() {
    let x = true
    let y = false

    Assert.equals(false, false && false)
    Assert.equals(false, false && true)
    Assert.equals(false, true && false)
    Assert.equals(true, true && true)
    Assert.equals(false, false || false)
    Assert.equals(true, false || true)
    Assert.equals(true, true || false)
    Assert.equals(true, true || true)

    Assert.equals(false, x && y)
    Assert.equals(true, x && true)
    Assert.equals(false, x && false)
    Assert.equals(false, true && y)
    Assert.equals(false, false && y)
    Assert.equals(false, (x) && (y))
    Assert.equals(true, (x) && true)
    Assert.equals(false, (x) && false)
    Assert.equals(false, true && (y))
    Assert.equals(false, false && (y))

    Assert.equals(true, x || y)
    Assert.equals(true, x || true)
    Assert.equals(true, x || false)
    Assert.equals(true, true || y)
    Assert.equals(false, false || y)
    Assert.equals(true, (x) || (y))
    Assert.equals(true, (x) || true)
    Assert.equals(true, (x) || false)
    Assert.equals(true, true || (y))
    Assert.equals(false, false || (y))

    Assert.equals(false, !x)
    Assert.equals(true, !y)
    Assert.equals(false, (!x))
    Assert.equals(true, (!y))
}
