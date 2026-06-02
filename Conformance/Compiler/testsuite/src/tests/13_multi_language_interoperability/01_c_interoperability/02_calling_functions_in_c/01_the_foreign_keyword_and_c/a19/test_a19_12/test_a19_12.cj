/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_02_01_a19_12

  @Level:         1

  @Assertion:    13.1.2.1(19) Variable-length parameters must meet the CType
                 constraint but do not have to be of the same type.

  @Description:  Check call of foreign function with variable-length arguments
                 and arguments of different types.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:      

*/

import utils.assert.Assert

foreign func func_01(x: CString, ...): CString

main() {
    var str1 = unsafe{ LibC.mallocCString("%s %d : %f") }
    var str2 = unsafe{ LibC.mallocCString("%s %d : %d") }
    var str3 = unsafe{ LibC.mallocCString("%s %d : %d : %d") }
    var str4 = unsafe{ LibC.mallocCString("val=") }
    var str5 = unsafe{ LibC.mallocCString("qqq") }
    var Value : CString = unsafe { func_01(str1, str4, 1, 2.0) }
    var S = Value.toString()
    Assert.equals("val= 1 : 2.000000", S)

    Value = unsafe { func_01(str2, str4, 1, 2) }
    S = Value.toString()
    Assert.equals("val= 1 : 2", S)

    Value = unsafe { func_01(str3, str4, 1, 2, 3) }
    S = Value.toString()
    Assert.equals("val= 1 : 2 : 3", S)
    
    Value = unsafe { func_01(str5) }
    S = Value.toString()
    Assert.equals("qqq", S)
    unsafe{ LibC.free(str1) }
    unsafe{ LibC.free(str2) }
    unsafe{ LibC.free(str3) }
    unsafe{ LibC.free(str4) }
    unsafe{ LibC.free(str5) }
}
