/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_a04_04

  @Level:         1

  @Assertion:   8(4) Features that can be added include: Adding Operator Overloading.

  @Description: Checks that operator overloading can be added to standard type extension.

  @Mode:        run
  @Negative:    no
  @Structure:   single
  @Issue:       


*/

import utils.assert.Assert

extend Int64 {
    operator func ()(): Int64 {
        this + 1
    }
}

main() {
    var x = 120
    Assert.equals(121, x())
}
