/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_01_a07_01

  @Level:         1

  @Assertion:   8.1(7) Extensions are divided into two uses: direct extensions and interface
                extensions.

  @Description: Checks defining of direct and interface extensions.

  @Mode:        run
  @Negative:    no
  @Structure:   single
  @Issue:       


*/

import utils.assert.Assert

extend String {
    func foo1(): String { "Direct extension" }
}

interface I {
    func foo2(): String

    func foo3(): String { "Interface extension 2" }
}

extend String <: I {
    public func foo2(): String { "Interface extension 1" }
}

main() {
  Assert.equals("Direct extension", "abc".foo1())
  Assert.equals("Interface extension 1", "abc".foo2())
  Assert.equals("Interface extension 2", "abc".foo3())
}
