/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_02_02_a12_10

  @Level:         1

  @Assertion:    13.1.2.2(12) The generic parameter of CPointer can be any type
                 that meets the Type constraint.

  @Description:  CFunc is obtained from CPointer<uint64_t>.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:      

*/

import utils.assert.Assert

foreign func func_01(): CPointer<UInt64>

main() {
    var Ptr = unsafe{ func_01() }
    Assert.isFalse(Ptr.isNull())
    var CB = CFunc<(Int32)->Int32>(Ptr)
    var Arg : Int32 = 777;
    var Value : Int32 = unsafe { CB(Arg) }
    Assert.equals(877, Value)
}