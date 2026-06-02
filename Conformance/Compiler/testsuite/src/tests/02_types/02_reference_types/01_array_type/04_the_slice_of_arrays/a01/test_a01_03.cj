/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         02_02_01_04_a01_03

  @Level:         1
  @Assertion:    2.2.1.4(1) When the expression of Range<Int64> type is used
                 for array index, it indicates that intercepting a slice from
                 the array.

  @Description:  Checks that range should fit array bounds for slice to work

  @Mode:         run
  @Negative:     no
  @Structure:    single

*/
import utils.assert.*

main(): Int64 {
    let size = 20
    let a = Array<Int64>(size) { i => 1 << i }

    Assert.throws(
        { => a[-3..] },
        check: { e => e is IndexOutOfBoundsException })

    Assert.throws(
        { => a[..1000] },
        check: { e => e is IndexOutOfBoundsException })

    return 0
}
