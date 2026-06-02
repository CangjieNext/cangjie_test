/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_a02_04

  @Level:         1

  @Assertion:   8(2) Features that can be added include: Adding Instance Member Functions.

  @Description: Checks that instance member function can be added to standard type extension.

  @Mode:        run
  @Negative:    no
  @Structure:   single
  @Issue:       


*/

import utils.assert.Assert

extend Int64 {
    func typeName(): String {
        "Int64"
    }
}

main() {
    var x = 120
    Assert.equals("Int64", x.typeName())
}
