/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_02_a06_01

  @Level:         1

  @Assertion:    12.2(6) An exception thrown by a throw expression should always be caught somewhere.

  @Description:  Checks that an exception thrown with throw expression should always be caught.

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert

main() {
    var catch_block : Bool = false 
    try {
        throw Exception()
    } catch (_) {
        catch_block = true
    } finally {}

    Assert.isTrue(catch_block)
}

