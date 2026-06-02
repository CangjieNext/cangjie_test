/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_04_02_a04_03

  @Level:         1

  @Assertion:    3.4.2(4) redef means redefine the static members of the parent class, See class for details

  @Description:  Check that static properties can be redefined.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Issue:        6124
*/

import utils.assert.Assert

open class C1 {
    protected static var a = 0

    static mut prop b: Int64 {
        get() { a }
        set(p) { a = p }
    }
}

class C2 <: C1  {
    redef static mut prop b: Int64 {
        get() { a + 1 }
        set(p) { a = p + p }
    }
}

main() {
    Assert.equals(1, C2.b)
    C2.b = 1011
    Assert.equals(2023, C2.b)
}
