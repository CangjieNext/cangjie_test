/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_02_01_01_a01_02

  @Level:         1

  @Assertion:   8.2.1.1(1) Function definitions within extensions support the private, protected
                (only can be used when the extended type is a class type) or public modifier.

  @Description: Checks that private and public modifiers are supported for struct extension functions.

  @Mode:        run
  @Negative:    no
  @Structure:   single


*/

import utils.assert.Assert

struct S {}

extend S {
    private func foo1(): Int64 { 7 }

    public func foo3(): Int64 { foo1() + 1 }
}

main() {
    let x = S()
    Assert.equals(8, x.foo3())
    return 0
}
