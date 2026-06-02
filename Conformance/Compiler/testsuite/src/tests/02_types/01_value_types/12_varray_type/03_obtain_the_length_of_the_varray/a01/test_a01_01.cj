/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_01_12_03_a01_01

  @Level:         1

  @Assertion:    2.1.12.3(1) The number of elements in arr can be obtained by arr.size
  
  @Description:  Check VArray size function

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Issue:       0006077

  @Comment:     Compiler emit error on VArray<..., $..>

*/


import utils.assert.Assert


main() {
    let arr1: VArray<Int64, $4> = [13, 4, 5, 0]
    var arr0: VArray<Int64, $4> = arr1;
    Assert.equals(4, arr0.size)
    0
}