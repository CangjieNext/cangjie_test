/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_02_02_a03_01

  @Level:         1

  @Assertion:    13.1.2.2(3)  The CFunc in Cangjie refers to a function that can
                 be called by C code. There are three forms:
                 ...
                 3. Lambda expression of the CFunc type

  @Description:  CFunc that references lambda function.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:      

*/

import utils.assert.Assert

main() {
    var CB: CFunc<(Int32)->Int32> = { x => 100 + x }
    var Arg : Int32 = 777;
    var Value : Int32 = unsafe { CB(Arg) }
    Assert.equals(877, Value)
}