/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_05_03_a02_05

  @Level:         1

  @Assertion: 4.5.3(2) The difference between a while expression and a do-while expression is the
              loop body in a while expression may not be evaluated (when the expression is initially false),
              whereas the loop body in a do-while expression is at least evaluated once, i.e., block is
              evaluated before evaluating the expression written after the keyword while.
  @Description: Checks execution of some examples of do while expression
  @Mode: run
  @Negative: no
  @CompileWarning: ignore

*/

import utils.assert.Assert

func test1() {
    var count = 0

    do {
    } while ( { => count++; count < 5 } () )

    Assert.equals(5, count)
}

func test2() {
    var count = 0

    do {
        if (count <= 4) {
            count++
            continue
        } else {
            break
        }
        Assert.fail(reason: "Should not reach here")
    } while (count <= 100)

    Assert.equals(5, count)
}

func test3() {
    do {
        do {
            do {
                break;
            } while (true)
            break;
        } while (true)
        break
    } while (true)
}

main() {
    test1()
    test2()
    test3()
}
