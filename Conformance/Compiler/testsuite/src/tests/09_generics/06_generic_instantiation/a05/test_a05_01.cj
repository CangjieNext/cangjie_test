/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_06_a05_01

  @Level:         1

  @Assertion: 9.6(5) For example:

              (c <d , e> (f))

              This expression will be parsed as function call expression.

  @Description: Check the example provided.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

func c<T1, T2>(x: T1) {
    return x
}

class d {}
class e {}

main() {
    let f = d()
    Assert.isTrue(c <d, e> (f) is d)
}

