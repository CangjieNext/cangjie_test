/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_01_12_a04_01

  @Level:         1

  @Assertion:    2.1.12(4) 2.The length of a VArray<T, $N> type 
                 is part of the type. The Nrepresents the length of the VArray
                 which must be an integer literal, denoted by 
                 the fixed syntax of $followed by a number.
  
  @Description:  Check length of a VArray

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Issue:       0006077

  @Comment:     Compiler emit error on VArray<..., $3>

*/


import utils.assert.Assert
main() {
    let arr1: VArray<Int64, $3> = VArray<Int64, $3> { i => i }
    Assert.equals(3, arr1.size)
    0
}