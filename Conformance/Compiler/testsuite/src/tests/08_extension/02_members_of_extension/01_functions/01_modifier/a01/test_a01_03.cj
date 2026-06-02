/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_02_01_01_a01_03

  @Level:         1

  @Assertion:   8.2.1.1(1) Function definitions within extensions support the private, protected
                (only can be used when the extended type is a class type) or public modifier.

  @Description: Checks that private and public modifiers are supported for Int64 extension functions.

  @Mode:        run
  @Negative:    no
  @Structure:   single


*/

import utils.assert.Assert

extend Int64 {
    private func foo1(): Int64 { this }
    
    public func foo3(): Int64 { foo1() + 1 }
}

main() {
    Assert.equals(17, 16.foo3())
    return 0
}
