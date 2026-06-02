/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_02_a04_01

  @Level:         1

  @Assertion:    12.2(4) Throw expressions alter the execution logic of the program:
                         the throw expression will throw an exception when executed
                         and the block of code that catches the exception will be executed
                         instead of the expressions after throw. 

  @Description:  Checks the program flow has to be changed after the throw expression.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @CompileWarning: ignore

*/

import utils.assert.Assert

main() {
    var r = 0
    try {
        let e = throw Exception()
        r = 1
    } catch (_) {
        Assert.equals(0, r)
        r = 2
    }
    Assert.equals(2, r, reason : "Expression after throw should never be executed")
}