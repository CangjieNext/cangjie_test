/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_01_01_a07_02

  @Level:         1

  @Assertion: 6.3.1.1(7) The generic constraints of the function must be looser than or the same as the overridden function.

  @Description: Check different generic constraints

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

open class A1 {}
open class A2 <: A1 {}
class A3 <: A2 {}

interface I {
    func f<T>(): Int64 where T <: A2
}

class C <: I {
    public func f<T>(): Int64 where T <: A1 {
        0
    }
}

main() {
   Assert.equals(0, C().f<A3>())
}
