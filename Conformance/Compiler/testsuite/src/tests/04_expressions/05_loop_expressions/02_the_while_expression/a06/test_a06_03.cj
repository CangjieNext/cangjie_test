/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_05_02_a06_03

  @Level:         1

  @Assertion: 4.5.2(6) The while-let expression first evaluates the expression after <-
              (the type of the expression can be any type), and if the value of the expression
              matches the pattern after let, it executes the block after it, then recalculates
              the value of the expression and matches it again and determines whether to execute
              the loop again; if the match fails, it terminates the current while loop.
  @Description: Check that loop with constant pattern executes while pattern matches
  @Mode: run
  @Negative: no
  @Issue: 6473
  @Comment: Test may need to be fixed when issue is resolved

*/

import utils.assert.Assert

var msg: String = ""
func visit(id: String) { msg = id }
func check(id: String) { Assert.equals(msg, id); msg = "" }


main() {
    var i: Int32 = 0

    while (let 0 <- i) {
        visit("seen")
        Assert.equals(0, i)
        i++
    }
    check("seen")
}
