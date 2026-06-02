/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_01_a02r_06_runtime_unsafe_expression

  @Level:         1

  @Assertion:    13.1.1(2) An unsafe context is introduced by including an unsafe
                 keyword. unsafe keyword can be used in the following situations:
                 1. qualify a block. The type of an unsafe expression is the same
                 as the type of the block.

                     unsafeExpression
                     : 'unsafe' '{' expressionOrDeclarations '}'
                     ;


  @Description:  Check if value of type UInt16 can be put to and get from a C function.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:      

*/

import utils.assert.Assert

foreign func func_01(x: UInt16): UInt16

main() {
    var Value : UInt16 = unsafe { func_01(65000u16); };
    Assert.equals(64999u16, Value);
}