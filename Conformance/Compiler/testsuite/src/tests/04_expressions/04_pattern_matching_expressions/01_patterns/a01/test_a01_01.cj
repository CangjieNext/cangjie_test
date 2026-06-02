/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_01_a01_01

  @Level:         1

  @Assertion: 4.4.1(1) The Cangjie programming language supports a rich set of patterns as follows:
                  1. constant patterns.
                  2. wildcard pattern.
                  3. binding patterns.
                  4. tuple patterns.
                  5. type patterns.
                  6. enum patterns.

  @Description: Checks compilation of a program with match expression with constant patterns.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

func foo() : Unit {}

main() {
    // integer
    let l1 = 1
    var m = match (l1) {
        case 1 => 1
        case 10 | 20 => 2
        case _ => 3
    }
    Assert.equals(1, m)

    // string
    let l2 = "one"
    m = match (l2) {
        case "one" => 1
        case "two" => 2
        case "two" | "fff" => 2
        case _ => 3
    }
    Assert.equals(1, m)

    // float
    let l3 = 0.1
    m = match (l3) {
        case 0.1 => 1
        case 0.2 => 2
        case _ => 3
    }
    Assert.equals(1, m)

    // boolean
    let l4 = true
    m = match (l4) {
        case true => 1
        case false => 2
        case _ => 3
    }
    Assert.equals(1, m)

    // char
    let l5 = 'a'
    m = match (l5) {
        case 'a' => 1
        case 'b' => 2
        case _ => 3
    }
    Assert.equals(1, m)

    // Unit
    let l6: Unit = foo()
    m = match (l6) {
        case () => 1
        case _ => 2
    }
    Assert.equals(1, m)

    return
}
