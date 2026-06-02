/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_01_a03_01

  @Level:         1

  @Assertion:   8.1(3) Extensions are defined using the extend keyword.

  @Description: Checks defining extensions.

  @Mode:        run
  @Negative:    no
  @Structure:   single
  @Issue:       


*/

import utils.assert.Assert

extend String {
    func a(): Int64 {
        0
    }
}

extend String {
    func b(): Int64 {
        1
    }
}

extend String {
    func c(): Int64 {
        2
    }
}

main() {
    Assert.equals(0, "abc".a())
    Assert.equals(1, "a".b())
    Assert.equals(2, "aaa bbb cccccc".c())
}
