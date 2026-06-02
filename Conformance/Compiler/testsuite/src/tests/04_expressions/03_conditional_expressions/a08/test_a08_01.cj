/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         04_03_a08_01

  @Level:         1

  @Assertion:    4.3(8) For if expressions that contain let, we call them if-let expressions.
                 We can use if-letexpressions to do some simple deconstruction operations.

  @Description:  Check if-let expression

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Issue:        0006130
  
  @Comment:      There is a contradiction in spec was found. It's unclear should `=` or `<-` be used.

*/


import utils.assert.Assert


main(ina :Array<String>) {
    let x: Option<Int64> = Option<Int64>.Some(100)
    if (let Some(v) <- x) {
        Assert.equals(100, v)
    } else {
        Assert.fail() 
    }
}
