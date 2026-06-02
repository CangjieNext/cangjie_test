/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_03_01_a03_02

  @Level:         1

  @Assertion:    13.1.3.1(3)  Note: 1. Because the size of int and long types in C is indeterminate, 
  so the programmers need to specify the corresponding type in the Cangjie programming language. 
  2. IntNative/UIntNative in C interoperation scenarios, it is consistent with ssize_t/size_t in C language. 
  3. In C interoperation scenarios, like C, the Unit type can only be used as a return type in CFunc
   and as a generic parameter to CPointer.

  @Description:  'CPointer<Unit>' may be used as a parameter or return value
                 type in @C functions.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:      

  @Issue: 0006421
*/

import utils.assert.Assert

foreign func func_01(): CPointer<Unit>
foreign func func_02(x: CPointer<Unit>): Bool

@C func func_03(): CPointer<Unit> { unsafe {func_01()} }
@C func func_04(x: CPointer<Unit>): Bool { unsafe{func_02(x)} }

main() {
    var Ptr : CPointer<Unit> = unsafe { func_03() }
    Assert.isFalse(Ptr.isNull())
    var Val: Bool = unsafe { func_04(Ptr) }
    Assert.isTrue(Val)
}