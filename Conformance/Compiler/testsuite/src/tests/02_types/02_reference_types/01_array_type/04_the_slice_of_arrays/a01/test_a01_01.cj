/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         02_02_01_04_a01_01

  @Level:         1
  @Assertion:    2.2.1.4(1) When the expression of Range<Int64> type is used
                 for array index, it indicates that intercepting a slice from
                 the array.

  @Description:  Checks that array can be sliced using Range<Int64> as index

  @Mode:         run
  @Negative:     no
  @Structure:    single

*/
import utils.assert.*

main(): Int64 {
    let size = 20
    let a = Array<Int64>(size) { i => 1 << i }

    Assert.equals(2, a[1..3].size)
    Assert.equals(3, a[..3].size)
    Assert.equals(17, a[3..].size)

    return 0
}
