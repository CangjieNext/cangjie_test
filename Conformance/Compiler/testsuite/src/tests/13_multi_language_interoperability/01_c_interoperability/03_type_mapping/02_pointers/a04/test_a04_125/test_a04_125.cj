/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_03_02_a04_125

  @Level:         1

  @Assertion:    13.1.3.2(4)  * CPointer<T1> is allowed to cast to CPointer<T2>
                 in unsafe context.

  @Description:  Type 'CPointer<Int16>' can be casted to 'CPointer<Float64>'.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:      

*/

import utils.assert.Assert

foreign func func_01(): CPointer<Int16>
foreign func func_02(x: CPointer<Float64>): Bool

main() {
    var Ptr : CPointer<Int16> = unsafe{ func_01() }
    Assert.isFalse(Ptr.isNull())
    var Ptr2: CPointer<Float64> = CPointer<Float64>(Ptr)
    var Res: Bool = unsafe{ func_02(Ptr2) }
    Assert.isTrue(Res)
    var Val: Float64 = unsafe{ Ptr2.read() }
    Assert.equals(1.41421356237f64, Val)
}