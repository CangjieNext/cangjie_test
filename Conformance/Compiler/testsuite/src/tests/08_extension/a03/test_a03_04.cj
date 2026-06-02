/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_a03_04

  @Level:         1

  @Assertion:   8(3) Features that can be added include: Adding Static Member Functions.

  @Description: Checks that static member function can be added to standard type extension.

  @Mode:        run
  @Negative:    no
  @Structure:   single
  @Issue:       


*/

import utils.assert.Assert

extend Int64 {
    static func typeName(): String {
        "Int64"
    }
}

main() {
    var x = 120
    Assert.equals("Int64", Int64.typeName())
}
