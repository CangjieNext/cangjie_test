/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_02_01_01_a03_01

  @Level:         1

  @Assertion:   8.2.1.1(3) A member function modified with protected is not only accessible within the package,
                but also to subclasses of the current class in other packages.

  @Description: Checks that protected function is accessible within the package and in subclass in another package.

  @Mode:        run
  @Negative:    no
  @Structure:   complex-main
  @Dependencies: aux_test_a03_01.cj


*/

import utils.assert.Assert

import p1.AuxTestA0301
import p1.f1

class B <: AuxTestA0301 {
    func foo2(): Int64 { foo() + 1 }
}

main() {
    let x = AuxTestA0301()
    Assert.equals(6, f1(x))
    let y = B()
    Assert.equals(8, y.foo2())
    return 0
}


