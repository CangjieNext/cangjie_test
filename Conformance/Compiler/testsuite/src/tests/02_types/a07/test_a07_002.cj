/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_a07_002

  @Level:         1

  @Assertion:    2(7) The difference between a value type and a reference type is that 
                 the content of a value-type variable is the value of the variable, 
                 whereas the content of a reference type variable is a reference which 
                 refers to a value.

  @Description:  Checks that variable, initialized with the value of another source variable of type 'Array',
                 has the same value for index=2 as the corresponding 
                 value of the source variable when source  variable has been modified, 
                 what is correct for 'reference type';

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:  

*/

import utils.assert.*

main() {
    var sourceArray: Array<Int64> = [10, 11, 12, 13];
    var targetArray = sourceArray;
    sourceArray[2] = 99;

    Assert.notEquals(12, targetArray[2], 
        reason:"""
A variable, initialized by the value 
of another source variable of type 'Array<Int64>', 
has the same value for index=2 as the corresponding 
value of the source variable before source 
variable has been modified.
It is not correct for 'reference type': Array.
""");

    return 0;
}
