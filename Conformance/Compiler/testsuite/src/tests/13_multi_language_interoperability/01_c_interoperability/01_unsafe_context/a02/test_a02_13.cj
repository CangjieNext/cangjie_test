/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_01_a02_13

  @Level:         1

  @Assertion:    13.1.1(2) An unsafe context is introduced by including an unsafe
                 keyword. unsafe keyword can be used in the following situations:
                 1. qualify a block. The type of an unsafe expression is the same
                 as the type of the block.

                     unsafeExpression
                     : 'unsafe' '{' expressionOrDeclarations '}'
                     ;


  @Description:  Check if value of type Float32 pass through unsafe construct.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:      

*/

import utils.assert.Assert

main() {
    var Value : Float32 = unsafe { var V : Float32 = 1.75; V };
    Assert.approxEquals(1.75, Value);
}