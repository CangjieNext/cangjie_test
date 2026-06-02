/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_03_03_a02_01

  @Level:         1

  @Assertion:    13.1.3.3(2) When declaring a foreign function, you need to
                 determine the function name, parameter type, and return value
                 type according to the declaration of the C language function to
                 be called..
 
  @Description:  Calling C library function that has CString arguments.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:      

*/

import utils.assert.Assert

foreign func strcmp(s1: CString, s2: CString): Int32

main() {
    let cstr1 = unsafe{ LibC.mallocCString("abcdef") }
    let cstr2 = unsafe{ LibC.mallocCString("012345") }
    let Str1 = CString(cstr1.getChars())
    let Str2 = CString(cstr2.getChars())
    let Cmp = unsafe{ strcmp(Str1, Str2) }
    Assert.isTrue(Cmp > 0)
    unsafe{ LibC.free(cstr1) }
    unsafe{ LibC.free(cstr2) }
}
