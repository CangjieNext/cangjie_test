/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_03_a12_02

  @Level:         1

  @Assertion:   4.3(12) The pattern after let supports constant pattern, 
                wildcard pattern, variable binding pattern, Tuple pattern, and enum pattern.

  @Description: Checks case with let wildcard pattern.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Issue:        0006130
  
  @Comment:      Contradiction in spec was found. Need to use = instead <-

*/


import utils.assert.Assert


main(ina :Array<String>) {
    let x:Int64 = 1
    if (let _ <- x) {
    } else {
        Assert.fail() 
    }
    0
}
