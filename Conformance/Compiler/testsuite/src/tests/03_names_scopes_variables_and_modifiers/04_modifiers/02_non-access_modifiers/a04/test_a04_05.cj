/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_04_02_a04_05

  @Level:         1

  @Assertion:    3.4.2(4) redef means redefine the static members of the parent class, See class for details

  @Description:  Check that generic functions can be redefined.

  @Mode:         run

  @Negative:     no

  @Structure:    single
*/
import utils.assert.Assert

open class C1<T> {
    protected static func foo(p: T) {
        return p
    }
}

class C2 <: C1<Int64>{
    redef protected static func foo(p: Int64) {
        return p + p
    }
}

main() {
    Assert.equals(128, C2.foo(64))
}
