/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_a04_001

  @Level:         1

  @Assertion:    2(4) There are two categories of types at the top: value types 
                 and reference types.

  @Description:  Checks that there is 'value type' using the 'Int32' type as an example.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:  

*/

import utils.assert.*

main() {
    var sourceVar: Int32 = 100;
    var targetVar = sourceVar;

//Test_case_1
    sourceVar = 101;
    Assert.equals(101, sourceVar, 
        reason:"Test_case_1: A variable of type 'Int32' has unexpected value after reassigning.");

//Test_case_2
    Assert.equals(100, targetVar, 
        reason:"""
Test_case_2: A variable, initialized with the value 
of another source variable of type 'Int32', 
has a value, different from value of initializing, 
after source variable has been reaasigned,
that should not happen for 'value type' Int32.
""");

    return 0;
}

