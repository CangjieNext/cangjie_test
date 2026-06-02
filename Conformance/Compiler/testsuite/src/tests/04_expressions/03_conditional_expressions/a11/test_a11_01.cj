/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         04_03_a11_01

  @Level:         1

  @Assertion:    4.3(11) The value of the if-let expression is equal 
                 to the value of the expression in the branch to which it is executed.

  @Description:  Check value if-let expression

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Issue:        0006130
  
  @Comment:      Contradiction in spec was found. Need to use = instead <-

*/


import utils.assert.Assert


main(ina :Array<String>) {
    var x: Option<Int64> = Option<Int64>.Some(100)
    if (let Some(v) <- x) {
        Assert.equals(100, v)
    } else {
        Assert.fail() 
    }
    x = Option<Int64>.Some(101)
    if (let Some(v1) <- x) {
        Assert.equals(101, v1)
    } else {
        Assert.fail() 
    }
    0
}
