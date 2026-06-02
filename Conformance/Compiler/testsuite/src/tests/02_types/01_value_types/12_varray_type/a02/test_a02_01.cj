/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_01_12_a02_01

  @Level:         1

  @Assertion:    2.1.12(2) For VArray<T, $N> , it is explained as follows:
                 1. 1.The elements in VArray<T, $N> are ordered and
                 can be accessed by an index (starting from 0).
  
  @Description:  VArray of Int64. Array assignment.
                 Check elements order

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Issue:       0006077

  @Comment:     Compiler emit error on VArray<..., $3>

*/


import utils.assert.Assert


main() {
    let arr1: VArray<Int64, $3> = VArray<Int64, $3> { i => i }
    Assert.equals(0, arr1[0])
    var arr0: VArray<Int64, $3> = arr1;
    Assert.equals(0, arr0[0])
    Assert.equals(1, arr0[1])
    Assert.equals(2, arr0[2])
    0
}