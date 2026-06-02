/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         02_02_01_03_a01_01

  @Level:         1
  @Assertion:    2.2.1.3(1) The number of elements in arr can be got by arr.size.

  @Description:  Checks that array size can accessed via arr.size

  @Mode:         run
  @Negative:     no
  @Structure:    single

*/
import utils.assert.*

main(): Int64 {
    let size = 15
    let a1 = Array<Int64>(size) { i => 1 << i }
    Assert.equals(size, a1.size)

    let a2 = [[1, 2, 3], [4]]
    Assert.equals(2, a2.size)
    Assert.equals(3, a2[0].size)
    Assert.equals(1, a2[1].size)

    return 0
}
