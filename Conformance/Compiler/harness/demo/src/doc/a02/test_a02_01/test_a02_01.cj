/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: test_a02_01
  @Assertion: It should be possible to split code to multiple files
  @Description: Testing multifile example from the Spec

  @Mode: run
  @Negative: no
  @Structure: complex-main
  @Dependencies: package_a/aux_a.cj package_a/aux_b.cj
*/

import utils.assert.Assert
import package_a.*

main(): Int64 {
    Assert.equals(258, x, reason:"Value of X must match")
    Assert.equals(258, y, reason:"Value of Y must match")
    Assert.equals(10, z, reason:"Value of Z must match")
    return 0
}
