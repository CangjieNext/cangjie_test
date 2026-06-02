/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_02_01_01_a08_01

  @Level:         1

  @Assertion:   8.2.1.1(8) An extension to the struct type can define the mut function.

  @Description: Checks that struct extension functions can have mut modifier.

  @Mode:        run
  @Negative:    no
  @Structure:   single


*/

import utils.assert.Assert

struct S {
    var value = 7
}

extend S {
    mut func foo1(): Int64 {
        value++
        value
    }
    
    mut public func foo2(): Int64 {
        value--
        value
    }
}

main() {
    var s = S()
    Assert.equals(8, s.foo1())
    Assert.equals(9, s.foo1())
    Assert.equals(10, s.foo1())
    Assert.equals(9, s.foo2())
    Assert.equals(8, s.foo2())
    Assert.equals(7, s.foo2())
    return 0
}
