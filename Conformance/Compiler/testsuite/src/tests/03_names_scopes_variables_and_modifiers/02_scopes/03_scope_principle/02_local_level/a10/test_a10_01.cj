/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_02_03_02_a10_01

  @Level:         1

  @Assertion:    3.2.3.2(10) The scope of a function type parameters and parameters start after 
                 the parameters defined and ends with the closing of the function body.

  @Description:  Check that the scope of function arguments ends with the closing of the function body.

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert

main() {
// test case #1
    var y1 : Bool = false
    var y2 : Bool = true
    let foo1 : (Bool, Bool) -> Unit = { y1 : Bool, y2 : Bool =>
        Assert.isTrue(y1)
        Assert.isFalse(y2)
    }
    foo1(true, false)
    Assert.isFalse(y1)
    Assert.isTrue(y2)

// test case #2
    let z1 : Float64 = 1.0 
    let z2 : Int64   = 1 
    func foo2<T1, T2>(a1 : T1, a2 : T2) {
        let z1 : T1 = a1
        let z2 : T2 = a2
    }
    foo2(2.0, 2)
    Assert.equals(1.0, z1)
    Assert.equals(1,   z2)
}
