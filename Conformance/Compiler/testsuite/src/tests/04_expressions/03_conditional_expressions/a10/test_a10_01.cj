/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         04_03_a10_01

  @Level:         1

  @Assertion:    4.3(10) The if-letexpression first evaluates the expression
                 after <-(which can be of any type), and if the value of the 
                 expression matches the pattern after let, then the block after
                 it is executed, otherwise the if expression after else or the 
                 block after it (if it exists) is executed.

  @Description:  Check if-let expression

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Issue:        0006130
  
  @Comment:      There is a contradiction in the Spec.

*/

import utils.assert.Assert


main(ina :Array<String>) {
    let x: Option<Int32> = Option<Int32>.Some(100)
    if (let Some(v) <- x) {
        Assert.equals(100, v)
    } else {
        Assert.fail() 
    }
    0
}
