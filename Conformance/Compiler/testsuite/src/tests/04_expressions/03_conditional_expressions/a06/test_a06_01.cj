/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_03_a06_01

  @Level:         1

  @Assertion: 4.3(6) The if expression first evaluates the expression (requires 
              it has type Bool) that follows if. If the value of the expression
              is equal to true, the block following the condition part is 
              executed; otherwise, the if expression or the block (if exists) 
              following the else keyword is executed. 
  @Description: Checks that conditional expression is evaluated first when 
                if-block executes and blocks are executed in the correct order.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: Ignore

*/

import utils.assert.Assert

var cnt = 0

func returnBool(b: Bool) {
    cnt++
    b
}

main() {
    if (returnBool(true)) {
        Assert.equals(1, cnt)
    } 

    if (returnBool(false)) {
        Assert.fail(reason: "Should not reach here.")
    } else {
        Assert.equals(2, cnt)
    }

    if (returnBool(true)) {
        Assert.equals(3, cnt)
    } else {
        Assert.fail(reason: "Should not reach here.")
    }

    if (returnBool(true)) {
        Assert.equals(4, cnt)
    } else if (returnBool(false)) {
        Assert.fail(reason: "Should not reach here.")
    } else {
        Assert.fail(reason: "Should not reach here.")
    }

    if (returnBool(false)) {
        Assert.fail(reason: "Should not reach here.")
    } else if (returnBool(true)) {
        Assert.equals(6, cnt)
    } else {
        Assert.fail(reason: "Should not reach here.")
    }

    if (returnBool(false)) {
        Assert.fail(reason: "Should not reach here.")
    } else if (returnBool(false)) {
        Assert.fail(reason: "Should not reach here.")
    } else {
        Assert.equals(8, cnt)
    }

    if (returnBool(true)) {
        Assert.equals(9, cnt)
    } else if (returnBool(false)) {
        Assert.fail(reason: "Should not reach here.")
    } else if (returnBool(true)) {
        Assert.fail(reason: "Should not reach here.")
    } else {
        Assert.fail(reason: "Should not reach here.")
    }

    if (returnBool(false)) {
        Assert.fail(reason: "Should not reach here.")
    } else if (returnBool(true)) {
        Assert.equals(11, cnt)
    } else if (returnBool(true)) {
        Assert.fail(reason: "Should not reach here.")
    } else {
        Assert.fail(reason: "Should not reach here.")
    }

    if (returnBool(false)) {
        Assert.fail(reason: "Should not reach here.")
    } else if (returnBool(false)) {
        Assert.fail(reason: "Should not reach here.")
    } else if (returnBool(true)) {
        Assert.equals(14, cnt)
    } else {
        Assert.fail(reason: "Should not reach here.")
    }

    if (returnBool(false)) {
        Assert.fail(reason: "Should not reach here.")
    } else if (returnBool(false)) {
        Assert.fail(reason: "Should not reach here.")
    } else if (returnBool(false)) {
        Assert.fail(reason: "Should not reach here.")
    } else {
        Assert.equals(17, cnt)
    }

    Assert.equals(17, cnt)
}
