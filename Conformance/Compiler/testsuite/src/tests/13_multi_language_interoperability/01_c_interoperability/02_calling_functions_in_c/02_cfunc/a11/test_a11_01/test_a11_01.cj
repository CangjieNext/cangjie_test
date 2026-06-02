/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_02_02_a11_01

  @Level:         1

  @Assertion:    13.1.2.2(11) In Cangjie, a variable of type CPointer<T> can
                 be converted to a specific CFunc.

  @Description:  CFunc that is obtained by cast.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:      

*/

import utils.assert.Assert

foreign func func_01(): CPointer<Int8>

main() {
    var Ptr = unsafe{ func_01() }
    Assert.isFalse(Ptr.isNull())
    var CB = CFunc<(Int32)->Int32>(Ptr)
    var Arg : Int32 = 777;
    var Value : Int32 = unsafe { CB(Arg) }
    Assert.equals(877, Value)
}