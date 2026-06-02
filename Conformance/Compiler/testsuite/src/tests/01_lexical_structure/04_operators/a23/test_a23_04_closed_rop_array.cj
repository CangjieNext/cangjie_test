/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_04_a23_04

  @Level:         1

  @Assertion:    1.4(23) .. ..= Range operator
 
  @Description:  Using range operator for array slice

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:

*/

import utils.assert.Assert

main(ina :Array<String>) {
    let carr:Array<Int32>=[0,1,2,3,4,5,6,7,8]
    var arr :Array<Int32> = []
    arr = carr[5..=7:1]
    Assert.equals(5,arr[0])
    Assert.equals(6,arr[1])
    Assert.equals(7,arr[2])

    Assert.equals(3,arr.size)
    0
}