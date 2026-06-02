/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_02_03_02_a19_01

  @Level:         1

  @Assertion:    3.2.3.2(19) The scope of the names introduced in patterns of the match case is higher 
                 than that of the match expression.

  @Description:  Checks the scope of names introduced in patterns of the match case. 

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert

open class Test {
    public var xx : Int32 = 0
    public var yy : Int32 = 1
}

main() {
    let t : Test = Test()
    t.xx = -1
    t.yy = -1
    let r : Int32 = match(t) {
        case a : Test => let t = Test(); t.xx
        case _  => 0 
    }

    Assert.equals(-1, t.xx)
    Assert.equals(0, r)
}
