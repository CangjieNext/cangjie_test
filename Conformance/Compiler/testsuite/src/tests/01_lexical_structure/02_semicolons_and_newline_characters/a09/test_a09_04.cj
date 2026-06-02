/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_02_a09_04

  @Level:         1

  @Assertion:    1.2(9) In the call expression, a newline character cannot be used as a separator
                        between ( and the token before it.

  @Description:  Newline character added as a separator between ( and the token before it for generic function.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @CompileWarning: Ignore

  @Comment:       This test is positive because of (1, "arg", 1.0) below is considered as valid expression.
                 If the assertion mentioned above will be violated then this test has to be failed.  

*/

import utils.assert.Assert
main() {
    func f3<x, y, z> (a : x, b : y, c : z)  : Float64 {
        let r : String = "In the call expression, a newline character cannot be used as a separator " +
                         "between ( and the token before it."
        Assert.fail(reason: r)
        return 1.0
    }

    f3<Int32, String, Float64>
    (1, "arg", 1.0)

    return 0
}
