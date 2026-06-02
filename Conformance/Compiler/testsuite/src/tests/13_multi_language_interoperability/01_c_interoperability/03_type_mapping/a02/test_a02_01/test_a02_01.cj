/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_03_a02_01

  @Level:         1

  @Assertion:    13.1.3(2)    The types can interact with C language in Cangjie
                 programming language must conform to CType constraint, they can
                 be divided into primitive types and complex types. The
                 primitive foreign types include integer types, floating point
                 types, the Bool type, the CPointer type and Unit type.

  @Description:  Cangjie type 'Int32' is mapped to C type 'int32_t'.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:      This assert is checked in tests for "13.1.3.1 Primitive Types"
                 and "13.1.3.2 Pointer".

*/

import utils.assert.Assert

foreign func func_01(x: Int32): Unit
foreign func func_02(): Int32

main() {
    var Val: Int32
    unsafe {
        func_01(666)
        Val = func_02()
        Assert.equals(666, Val)
    }
}