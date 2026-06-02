/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_06_a02_01

  @Level:         1

  @Assertion: 4.6(2)
              One is ordinary try expressions that do not provide automatic resource management.

  @Description: Check the ordinary try expression example.

  @Mode: run

  @Negative: no

*/

// NOTE: Ordinary try expressions should be well tested within "Exceptions" chapter. No need to duplicate tests here.
//       Just provide an example.

import utils.assert.Assert

main(inp: Array<String>) {
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
}

