/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_02_03_02_a02_06

  @Level:         1

  @Assertion:    3.2.3.2(2) The variables defined within a block has higher level of scope 
                 than the ones defined outside.

  @Description:  Checks that variable defined within the try block is invisible for the main function.

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert

main() {
    var v1 : Int32 = 5
    var v2 : Int32 = 10 
    try { 
        let v1 = -5 
        Assert.equals(-5, v1)
        throw ArithmeticException()
    } catch (e: ArithmeticException) {
        let v2 = -10
        Assert.equals(-10, v2)
    }
}
