/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_01_a03_02

  @Level:         1

  @Assertion:    13.1.1(3) 2. qualify a function definition

                 unsafeFunction
                 : 'unsafe' functionDefinition
                 ;

  @Description:  Check that unsafe function cannot be called outside unsafe block.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

  @Comment:      

*/

import utils.assert.Assert

unsafe func func_01(x: Float64): Float64 { return x + 1.0f64; }

main() {
    var Value : Float64 = func_01(2.0f64);
    Assert.approxEquals(3.0f64, Value);
}