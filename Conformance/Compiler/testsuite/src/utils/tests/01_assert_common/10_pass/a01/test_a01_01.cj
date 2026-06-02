/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            01_10_a01_01
  @Assertion:       func pass()

  @Description:     Checking that after calling pass nothing is executed and the test succeeds.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  ignore

  @Issue:           0006505
*/

import utils.assert.Assert

main() {
    Assert.pass()
    throw Exception("This line should not be executed")
    0
}
