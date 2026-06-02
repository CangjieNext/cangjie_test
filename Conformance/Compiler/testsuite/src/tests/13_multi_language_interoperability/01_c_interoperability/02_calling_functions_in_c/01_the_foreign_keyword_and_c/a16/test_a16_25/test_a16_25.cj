/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_02_01_a16_25

  @Level:         1

  @Assertion:    13.1.2.1(16) Only types with CType constraint can be used as
                 parameters type and return type in foreign function. See the
                 following section “type mapping” for the definition of CType
                 constraint.

  @Description:  Check if argument of type Int32 is allowed in foreign function.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:      Other types valid for use in foreign functions are tested in the
                 tests for 13.1.3 Type mapping.

*/

import utils.assert.Assert

foreign func func_01(x: Int32): Int32

main() {
    var Arg : Int32 = 777;
    var Value : Int32 = unsafe { func_01(Arg) }
    Assert.equals(877, Value)
    Assert.equals(777, Arg)
}