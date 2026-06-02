/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_03_02_a01_01

  @Level:         1

  @Assertion:    13.1.3.2(1)  Cangjie provides CPointer<T> type to represent T*
                 type in C language, while T must conform to CType constraint. 

  @Description:  'CPointer<...>' can be mapped to C type 'struct *'.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:      

*/

import utils.assert.Assert

@C
struct ABC {
    var f1: Int32 = 0
    var f2: Float32 = 0.0
}

foreign func func_01(): CPointer<ABC>

main() {
    var Ptr : CPointer<ABC> = unsafe{ func_01() }
    Assert.isFalse(Ptr.isNull())
    var Val : ABC = unsafe{ Ptr.read() }
    Assert.equals(123456i32, Val.f1)
    Assert.equals(1.41421356237f32, Val.f2)
}
