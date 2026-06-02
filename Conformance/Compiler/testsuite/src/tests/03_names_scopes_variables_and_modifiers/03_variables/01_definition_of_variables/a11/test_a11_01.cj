/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_03_01_a11_01

  @Level:         1

  @Assertion:    3.3.1(11) The new variables introduced in the pattern after let (or var) are all let-modified 
                 (or var-modified) variables.

  @Description:  Check that variables introduced in var-modified patterns are var-modified.

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert

enum MyEnum {
    C(Int64)
}

main() {
    var myVar: String = "myString"
    Assert.equals("myString", myVar)
    myVar = "changeg string"
    Assert.equals("changeg string", myVar)
  
    var (ccc,ddd): (Bool, UInt8) = (true, 4)
    let (eee,fff): (Int64, UInt8) = (12, 4)
    Assert.equals(true, ccc)
    Assert.equals(4, ddd)

    ccc = false
    Assert.equals(false, ccc)
    var C(c) = C(16)
    Assert.equals(16, c)
    c++
    Assert.equals(17, c)
}