/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_06_a03_01

  @Level:         1

  @Assertion:  4.6(3)
               The other is try-with-resources expressions that provide automatic resource management.

  @Description: Check the try-with-resources expression example.

  @Mode: run

  @Negative: no

*/

// NOTE: Try-with-resources expressions should be well tested within "Exceptions" chapter. No need to duplicate tests
//       here. Just provide an example.

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

