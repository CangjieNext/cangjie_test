/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:      04_03_a06_02

  @Level:         1

  @Assertion: 4.3(6) The if expression first evaluates the expression (requires 
              it has type Bool) that follows if. If the value of the expression
              is equal to true, the block following the condition part is 
              executed; otherwise, the if expression or the block (if exists) 
              following the else keyword is executed. 
  @Description: Checks that if the value of the expression is equal to true,
                the block following the condition part is executed; otherwise,
                the if expression or the block (if exists) following the else
                keyword is executed.
                Tests case when condition is evaluated during the compilation.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: Ignore

*/

import utils.assert.Assert

main() {
    var cnt = 0

    if (true) {
        cnt++
    } 

    if (false) {
        Assert.fail(reason: "Should not reach here.")
    } else {
        cnt++
    }

    if (true) {
        cnt++
    } else {
        Assert.fail(reason: "Should not reach here.")
    }

    if (true) {
        cnt++
    } else if (true) {
        Assert.fail(reason: "Should not reach here.")
    } else {
        Assert.fail(reason: "Should not reach here.")
    }

    if (false) {
        Assert.fail(reason: "Should not reach here.")
    } else if (true) {
        cnt++
    } else {
        Assert.fail(reason: "Should not reach here.")
    }

    if (false) {
        Assert.fail(reason: "Should not reach here.")
    } else if (false) {
        Assert.fail(reason: "Should not reach here.")
    } else {
        cnt++
    }

    if (true) {
        cnt++
    } else if (false) {
        Assert.fail(reason: "Should not reach here.")
    } else if (true) {
        Assert.fail(reason: "Should not reach here.")
    } else {
        Assert.fail(reason: "Should not reach here.")
    }

    if (false) {
        Assert.fail(reason: "Should not reach here.")
    } else if (true) {
        cnt++
    } else if (true) {
        Assert.fail(reason: "Should not reach here.")
    } else {
        Assert.fail(reason: "Should not reach here.")
    }

    if (false) {
        Assert.fail(reason: "Should not reach here.")
    } else if (false) {
        Assert.fail(reason: "Should not reach here.")
    } else if (true) {
        cnt++
    } else {
        Assert.fail(reason: "Should not reach here.")
    }

    if (false) {
        Assert.fail(reason: "Should not reach here.")
    } else if (false) {
        Assert.fail(reason: "Should not reach here.")
    } else if (false) {
        Assert.fail(reason: "Should not reach here.")
    } else {
        cnt++
    }

    Assert.equals(10, cnt)
}
