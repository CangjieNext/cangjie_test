/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_02_a02_01

  @Level:         1

  @Assertion:    12.2(2) Throw expressions are always of Nothing type.

  @Description:  Checks that the throw expression of Nothing type.

  @Mode:         run

  @Negative:     no

  @CompileWarning: Ignore

  @Structure:    single

*/

import utils.assert.Assert

main() {
    var e : Nothing
    var try_block : Bool = false
    try {
        try_block = true
        e = throw Exception()
        Assert.fail(reason: "Unreacbable statement because of e is Nothing type")
    } catch (_) {}
    Assert.isTrue(try_block)
}

