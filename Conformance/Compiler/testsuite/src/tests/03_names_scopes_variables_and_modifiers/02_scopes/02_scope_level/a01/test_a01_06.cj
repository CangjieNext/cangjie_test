/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            03_02_02_a01_06

  @Level:         1
  @Assertion:       3.2.2(1) The scope of a name is the part of the program where the name can be used to refer to the
                    entity, without any qualifier, provided that the name is not shadowed.

  @Description:     Check that we can't refer to the entity without qualifiers when the name is shadowed.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no

*/

import utils.assert.Assert

func f(n: Int64): Int64 { // always returns 0
    if (n > 1) {
        Assert.equals(0, f(-1))
        Assert.equals(10, A.f(99))
    }
    0
}

class A {
    static func f(n: Int64): Int64 { // always returns 10
        if (n < 10) {
            Assert.equals(10, f(15)) // Here the global function `f` is shadowed
        }
        10
    }
}

main() {
    let f = { unused: Int64 => 67 }
    Assert.equals(67, f(5))
    Assert.equals(10, A.f(-6))
}
