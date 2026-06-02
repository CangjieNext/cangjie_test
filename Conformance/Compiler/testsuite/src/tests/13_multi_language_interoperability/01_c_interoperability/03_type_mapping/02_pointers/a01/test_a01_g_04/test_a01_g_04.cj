/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_03_02_a01_04

  @Level:         1

  @Assertion:    13.1.3.2(1)  Cangjie provides CPointer<T> type to represent T*
                 type in C language, while T must conform to CType constraint. 

  @Description:  Cangjie type 'CPointer<UInt8>' is mapped to C type 'uint8_t *'.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:      

*/

import utils.assert.Assert

foreign func func_01(): CPointer<UInt8>
foreign func func_02(x: CPointer<UInt8>): Bool

main() {
    var Ptr : CPointer<UInt8> = unsafe{ func_01() }
    var Checked : Bool = unsafe{ func_02(Ptr) }
    Assert.isTrue(Checked)
    var Val : UInt8 = unsafe{ Ptr.read() }
    Assert.equals(128u8, Val)
    unsafe{ Ptr.write(255u8) }
    Val = unsafe{ Ptr.read() }
    Assert.equals(255u8, Val)
}