/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         08_01_02_a17_01

  @Level:         1

  @Assertion:    8.1.2(17) The interface extension is in the same package as the interface and
                 its entire inheritance chain.

  @Description:  Checks that interface extension can be defined in one package with the interface.

  @Mode:         run
  @Negative:     no
  @Structure:    complex-main
  @Dependencies: aux_test_a17_01.cj


*/

package p

import utils.assert.Assert
import pkg.*

public interface TestA1701 {
    func foo(): Int64 { 0 }
}

extend A <: TestA1701 {
    public func foo(): Int64 { 99 }
}

extend S <: TestA1701 {
    public func foo(): Int64 { 88 }
}

main() {
    let a = A()
    Assert.equals(99, a.foo())
    let s = S()
    Assert.equals(88, s.foo())
}
