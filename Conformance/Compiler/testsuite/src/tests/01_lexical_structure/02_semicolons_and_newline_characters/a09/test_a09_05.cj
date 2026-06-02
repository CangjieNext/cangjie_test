/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_02_a09_05

  @Level:         1

  @Assertion:    1.2(9) In the call expression, a newline character cannot be used as a separator
                        between ( and the token before it.

  @Description:  Newline character added as a separator between ( and the token before it
                 for function call w/ two arguments as class references.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:       This test is positive because of (Base(), Sub()) below is considered as valid expression.
                 If the assertion mentioned above will be violated then this test has to be failed.  

*/

import utils.assert.Assert

open class Base {}
class Sub <: Base {}

main() {
    func f<x>(a : Base, b : x)  : String {
        let r =  "In the call expression, a newline character cannot be used as a separator " +
                 "between ( and the token before it."
        Assert.fail(reason: r)
    }

    f<Int32>
    (Base(), Sub())

    f<Base>
    (Base(), Sub())

    return 0
}
