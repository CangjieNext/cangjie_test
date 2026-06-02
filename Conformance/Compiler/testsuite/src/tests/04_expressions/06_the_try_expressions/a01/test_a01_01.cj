/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_06_a01_01

  @Level:         1

  @Assertion: 4.6(1)
              There are two kinds of try expressions in the Cangjie programming language.

  @Description: Check the two kinds of try expressions.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

var global = 0

class GlobalVarResource <: Resource {
    init() {
        global = 1
    }

    public func isClosed() {
        false
    }

    public func close() {
        global = 2
    }
}

main(inp: Array<String>) {
    // Ordinary try expression.
    var otTryEnter = false
    var otTryExit = false
    var otCatch = false
    var otFinally = false
    try {
        otTryEnter = true
        if (Assert.getRuntimeZero(inp) == 0) {throw Exception()}
        otTryExit = true
    } catch (e: Exception) {
        otCatch = true
    } finally {
        otFinally = true
    }
    Assert.isTrue(otTryEnter)
    Assert.isFalse(otTryExit)
    Assert.isTrue(otCatch)
    Assert.isTrue(otFinally)

    // Try-with-resources expression.
    var twrTryEnter = false
    var twrTryExit = false
    var twrCatch = false
    var twrFinally = false
    Assert.equals(0, global)
    try (gv = GlobalVarResource()) {
        twrTryEnter = true
        Assert.equals(1, global)
        if (Assert.getRuntimeZero(inp) == 0) {throw Exception()}
        twrTryExit = true
    } catch (e: Exception) {
        twrCatch = true
    } finally {
        twrFinally = true
    }
    Assert.equals(2, global)
    Assert.isTrue(twrTryEnter)
    Assert.isFalse(twrTryExit)
    Assert.isTrue(twrCatch)
    Assert.isTrue(twrFinally)
}

