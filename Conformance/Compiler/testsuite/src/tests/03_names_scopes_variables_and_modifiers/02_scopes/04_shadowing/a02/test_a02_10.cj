/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_02_04_a02_10

  @Level:         1

  @Assertion:    3.2.4(2) Note that shadowing ends when the lower-scope ends.

  @Description:  Check different kinds of scopes.
                 Check that outer local-scope is used when inner local-scope ends. Match expressions.

  @Mode:         run

  @Negative:     no

  @CompileWarning: ignore

*/

import utils.assert.Assert

main() {
    var i = 0
    var j = 0

    match (i+100) {
        case i => Assert.equals(100, i)
    }

    match ((i+100, j+100)) {
        case (i,j) => Assert.equals(200, i+j)
    }

    Assert.equals(0, i+j)

    match (i+100) {
        case i: Int64 => Assert.equals(100, i)
        case _ => throw Exception("Must not happen")
    }

    Assert.equals(0, i)
}
