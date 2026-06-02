/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_05_02_a03_04

  @Level:         1

  @Assertion: 4.5.2(3) The while expression first evaluates the expression after while
              (which is required to be of type Bool), and if the value of the expression is equal to true,
              the block after it is executed, then the value of the expression is recalculated and the
              loop is re-executed; if the value of the expression is equal to false, the loop is terminated
  @Description: Checks execution of some examples of while expression
  @Mode: run
  @Negative: no
  @CompileWarning: ignore

*/

import utils.assert.Assert

func test1() {
    var count = 0
    while (count < 5) {
        count++
    }
    Assert.equals(5, count)
}

func test2() {
    var count = 0
    while (count <= 100) {
        if (count <= 4) {
            count++
            continue
        } else {
            break
        }
        Assert.fail(reason: "Should not reach here.")
    }
    Assert.equals(5, count)
}

func test3() {
    var count = 0
    while (count <= 10) {
        count += 5
        while (count <= 10) {
            count += 20
        }
    }
    Assert.equals(25, count)
}

main() {
    test1()
    test2()
    test3()
}

