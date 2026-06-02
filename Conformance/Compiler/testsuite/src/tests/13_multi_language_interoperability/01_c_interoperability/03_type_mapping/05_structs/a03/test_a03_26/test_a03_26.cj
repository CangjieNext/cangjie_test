/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     13_01_03_05_a03_26

  @Level:         1

  @Assertion:    13.1.3.5(3)  Structs modified by @C must follow a few restrictions:
                 - their member fields’ type must conform to CType constraint

  @Description:  Cangjie type 'CString' may be used in @C structs.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:      

  @Issue: 0006421
*/

import utils.assert.Assert

@C
struct S1 { 
    var fld: CString
    init() { this.fld = unsafe{ LibC.mallocCString("qqq") } }
} 

foreign func func_01(): S1
foreign func strcmp(x: CString, y: CString): Int32

main() {
    var St: S1 = unsafe{ func_01() }
    var Str1: CString = St.fld
    var Str2: CString = unsafe{ LibC.mallocCString("abcde") }
    let Res = unsafe{ strcmp(Str1, Str2) }
    Assert.equals(0, Res)
    unsafe{ LibC.free(Str2) }
}
