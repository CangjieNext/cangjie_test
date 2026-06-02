/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_03_a13_01

  @Level:         1

  @Assertion: 6.1.2.3(13)
              open class C1 {
                protected var a = 1
              }
              class C2 <: C1 {
                var newB = a // protected modified variables can be accessed in subclasses.
              }

  @Description: Check that the example works correctly

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006237

*/

import utils.assert.Assert

open class C1 {
    protected var a = 1
}
class C2 <: C1 {
    var newB : Int64
  C2(){
    newB = a // protected modified variables can be accessed in subclasses.
  }
}

main() {
    let c1 = C1()
    Assert.equals(1, c1.a)

    let c2 = C2()
    Assert.equals(1, c2.a)
    Assert.equals(1, c2.newB)
}
