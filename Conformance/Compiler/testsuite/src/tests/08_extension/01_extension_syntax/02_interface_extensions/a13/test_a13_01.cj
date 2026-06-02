/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_01_02_a13_01

  @Level:         1

  @Assertion:   8.1.2(13) If the type being extended already contains the functions required
                by the interface, the interface extension cannot re-implement these functions
                and does not use the default implementation in the interface.

  @Description: Checks that interface implementation does not use default implementation in the
                interface if the type being extended already contains the function required by
                the interface.

  @Mode:        run
  @Negative:    no
  @Structure:   single


*/

import utils.assert.Assert

interface I {
    func foo(): Rune { r'b' }
}

class A {
    public func foo(): Rune { r'a' }
}

extend A <: I {
}

main() {
    let a = A()
    Assert.equals(r'a', a.foo())
}
