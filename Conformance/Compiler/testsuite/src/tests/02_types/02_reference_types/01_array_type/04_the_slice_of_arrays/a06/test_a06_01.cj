/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         02_02_01_04_a06_01

  @Level:         1
  @Assertion:    2.2.1.4(6) If the subscript is an empty range value,
                 then an empty array is returned.

  @Description:  Checks that empty array is created if empty range is used

  @Mode:         run
  @Negative:     no
  @Structure:    single

*/
import utils.assert.*

main(): Int64 {
    let size = 20
    let a = Array<Int64>(size) { i => 1 << i }

    let s = a[5..5]
    Assert.equals(0, s.size)

    return 0
}
