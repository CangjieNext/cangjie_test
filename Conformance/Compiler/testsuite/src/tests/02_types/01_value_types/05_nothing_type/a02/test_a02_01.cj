/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      02_01_05_a02_01

  @Level:         1

  @Assertion: 2.1.5(2)
              For example, if a variable is of type Nothing, it will never be used and therefore no memory needs to be
              allocated.

  @Description: Check that variable of type Nothing will not be used.

  @Mode: compileonly

  @Negative: yes

  @CompileWarning: Ignore

*/

import utils.assert.Assert

main() {
    var c: Nothing

    try {
        c = throw Exception("nobody expects the spanish inquisition!")
    } catch (e: Exception) {
    }

    var b: Bool = c
    Assert.isTrue(b)
    Assert.isFalse(b)
}

