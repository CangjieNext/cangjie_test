/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_02_03_02_a12_01

  @Level:         1

  @Assertion:    3.2.3.2(12) Function defined as func f (x: Int32, y!: Int32 = x) { } is valid.

  @Description:  Check that the named parameter of function can take a value of unnamed parameter.

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert

main() {
    var param1 : Int64  = -1
    var param2 : String = "bla-bla" 
    func foo(param1 : Int32, param2! : Int32 = param1) {
        Assert.equals(1, param1)
        Assert.equals(1, param2)
    }

    foo(1)
    Assert.equals(-1, param1)
    Assert.equals("bla-bla", param2)
}
