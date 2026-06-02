/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_03_02_a01_25

  @Level:         1

  @Assertion:    13.1.3.2(1)  Cangjie provides CPointer<T> type to represent T*
                 type in C language, while T must conform to CType constraint. 

  @Description:  Cangjie type 'CPointer<CPointer<Float32>>' is mapped to C type 'float **'.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:      

*/

import utils.assert.Assert

foreign func func_01(): CPointer<CPointer<Float32>>
foreign func func_02(x: CPointer<Float32>): Bool

main() {
    var PtrPtr : CPointer<CPointer<Float32>> = unsafe{ func_01() }
    Assert.isFalse(PtrPtr.isNull())
    var Ptr : CPointer<Float32> = unsafe{ PtrPtr.read() }
    Assert.isFalse(Ptr.isNull())
    var Checked: Bool = unsafe{ func_02(Ptr) }
    Assert.isTrue(Checked);
    var Val : Float32 = unsafe{ Ptr.read() }
    Assert.equals(1.41421356237f32, Val)
}