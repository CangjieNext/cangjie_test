/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_02_03_02_a02_02

  @Level:         1

  @Assertion:    3.2.3.2(2) The variables defined within a block has higher level of scope 
                 than the ones defined outside.

  @Description:  Checks that variable defined within if expression block is invisible for the main function.

  @Mode:	 run

  @Negative:     yes

  @Structure:    single

*/

import utils.assert.Assert

main() {
    var v1 : Int32 = 10
    let v2 : Int64 = 11
    let v3 : String = "bla-bla"

    if (true) { 
        let v1 : Int32 = 0
        let v2 : Int64 = 1
        let v3 : String = "if_than block"
        Assert.equals(10, v1)
        Assert.equals(11, v2)
        Assert.equals("bla-bla", v3)
    }
}
