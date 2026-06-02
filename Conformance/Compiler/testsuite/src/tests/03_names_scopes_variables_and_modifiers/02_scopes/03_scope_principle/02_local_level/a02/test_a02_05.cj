/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_02_03_02_a02_05

  @Level:         1

  @Assertion:    3.2.3.2(2) The variables defined within a block has higher level of scope 
                 than the ones defined outside.

  @Description:  Checks that variable declarated within some global function is invisible for the main function.

  @Mode:         run

  @Negative:     yes

  @Structure:    single

*/

import utils.assert.Assert

func foo() {
    let v1 : Int32 = 0
}

main() {
    var v1 : Int32 = 10
    foo()
    Assert.equals(0, v1)
}
