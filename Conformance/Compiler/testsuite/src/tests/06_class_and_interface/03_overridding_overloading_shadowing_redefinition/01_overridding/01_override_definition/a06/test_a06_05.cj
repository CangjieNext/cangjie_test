/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_01_01_a06_05

  @Level:         1

  @Assertion: 6.3.1.1(6) The generic type parameters of the function must be the same as the overridden function.

  @Description: Check different number of the generic type parameters and different generic type parameters

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

abstract class I {
    public func f<T1>(a: T1): Option<T1>
}

class C <: I {
    public func f<K1>(a: K1): Option<K1> {
        a
    }
}

main() {
   Assert.equals(0, C().f<Int64>(0))
}
