/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
   @Name:     13_01_03_03_a01_03

  @Level:         1

  @Assertion:    13.1.3.3(1)  The C language string is actually a one-dimensional
                 character array terminated with ‘ 0’. The ffi package provides
                 CString to match C language strings. The Cangjie programming
                 language create C language strings by CString constructors
                 or mallocCString method in LibC struct, and
                 then released by free method in LibC struct if necessary.
 
  @Description:  Create CString via mallocCString.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Issue:        0006633, 0006634


*/

import utils.assert.Assert

foreign func strlen(s: CString): Int32

main() {
    let Str = unsafe{ LibC.mallocCString("abcde") }
    let StrLen = unsafe{ strlen(Str) }
    Assert.equals(5, StrLen)
    unsafe{ LibC.free(Str) }
}
