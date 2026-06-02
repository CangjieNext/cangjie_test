/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     13_01_03_03_a01_04

  @Level:         1

  @Assertion:    13.1.3.3(1)  The C language string is actually a one-dimensional
                 character array terminated with ‘ 0’. The ffi package provides
                 CString to match C language strings. The Cangjie programming
                 language create C language strings by CString constructors
                 or mallocCString method in LibC struct, and
                 then released by free method in LibC struct if necessary.
 
  @Description:  Try to free CString returned from native foreign function

  @Mode:         run

  @Negative:     no

  @Structure:    single
  @Issue:        0006633, 0006634

*/

import utils.assert.Assert

foreign func strdup(s: CString): CString
foreign func strcmp(s1: CString, s2: CString): Int32

main() {
    let Str = unsafe{ LibC.mallocCString("abcde") }
    var Copy = unsafe{ strdup(Str) }
    let Cmp = unsafe{ strcmp(Str, Copy) }
    Assert.equals(0, Cmp)
    unsafe{ LibC.free(Str) }
    unsafe{ LibC.free(Copy) }
}
