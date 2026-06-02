/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_03_a01_01

  @Level:         1

  @Assertion:    13.1.3(1)    Some simple value types, such as the int32_t type
                 in C language, can be directly used by the Cangjie programming
                 language Int32, but some complex types such as structures
                 require corresponding type declarations with the same memory
                 layout in Cangjie.

  @Description:  Cangjie type 'Int32' is mapped to C type 'int32_t'.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:      This assert is checked in all tests for this chapter.

*/

import utils.assert.Assert

foreign func func_01(x: Int32): Unit
foreign func func_02(): Int32

main() {
    var Val: Int32
    let Data : Array<Int32> = [-2147483648, -32768, -128, -127, 0, 127, 128, 32767, 32768, 2147483647]
    for (item in Data) {
        unsafe {
            func_01(item)
            Val = func_02()
            Assert.equals(item, Val)
        }
    }
}