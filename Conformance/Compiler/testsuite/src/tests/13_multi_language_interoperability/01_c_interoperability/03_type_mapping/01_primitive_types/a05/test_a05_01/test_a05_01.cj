/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_03_01_a05_01

  @Level:         1

  @Assertion:    13.1.3.1(5)  For types that have a clear type mapping
                 relationship and are platform independent (refer to the basic
                 type mapping relationship table), you can directly use the
                 standard corresponding Cangjie programming language basic types.

  @Description:  Cangjie type 'UInt32' directly represents C type 'uint32_t'.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:      Tests for each basic type are provided in the assertion:
  
                    13.1.3.1(2) The ** fundamental type mapping table ** matching
                    the Cangjie programming language and C language is as follows:
                    ...

*/

import utils.assert.Assert

foreign func func_01(x: UInt32): UInt32

main() {
  var Val: UInt32 = unsafe { func_01(0x55555555) }
  Assert.equals(0xaaaaaaaa, Val)
}