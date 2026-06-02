/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     13_01_03_06_a02_01

  @Level:         1

  @Assertion:    13.1.3.6(2)  The function pointer type defined in the following
                 code in C can be mapped to CFunc<() -> Unit> in Cangjie.
                    // Function pointer in C. 
                    typedef void (*FuncPtr) (); 

  @Description:  Check call of foreign function.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:      

*/

import utils.assert.Assert

foreign func func_01(): CFunc<()->Unit>
foreign func func_02():Int32

main() {
    let Ptr = unsafe{ func_01() }
    let Cnt1 = unsafe{ func_02() }
    Assert.equals(0, Cnt1)
    let Val = unsafe{ Ptr() }
    let Cnt2 = unsafe{ func_02() }
    Assert.equals(1, Cnt2)
}