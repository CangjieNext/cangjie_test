/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         02_02_01_04_a09_02

  @Level:         1
  @Assertion:    2.2.1.4(9) If the type of = right expression is the same as
                 the type of the array, the array will be copied to cover the
                 current slice range, which requires the size of the right
                 expression to be the same as the slice range, otherwise an
                 exception will be thrown at runtime.

  @Description:  Checks that "slice assignment" with array of elements of the
                 type same as array element type on the right throws
                 Exception if size doesn't match

  @Mode:         run
  @Negative:     no
  @Structure:    single

*/
import utils.assert.*

main(): Int64 {
    let size = 20
    let a = Array<Int64>(size) { i => 1 << i }

    Assert.throws(
        { => a[3..8] = [9, 9, 9, 9, 9, 9] },
        check: { e => e is IllegalArgumentException })

    return 0
}
