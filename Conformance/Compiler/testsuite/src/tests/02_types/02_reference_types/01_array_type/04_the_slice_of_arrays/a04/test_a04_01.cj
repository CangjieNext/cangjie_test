/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         02_02_01_04_a04_01

  @Level:         1
  @Assertion:    2.2.1.4(4) When using start..end as an Array subscript,
                 the value of start is set to 0 if start is omitted, and
                 the value of end is set to the length of Array if end
                 is omitted.

  @Description:  Checks that the value of start is set to 0 if start is
                 omitted, and the value of end is set to the length of Array
                 if end is omitted

  @Mode:         run
  @Negative:     no
  @Structure:    single

*/
import utils.assert.*

main(): Int64 {
    let size = 20
    let a = Array<Int64>(size) { i => 1 << i }

    let s1 = a[5..]
    Assert.equals(15, s1.size)
    Assert.equals(1 << 19, s1[14])

    let s2 = a[..5]
    Assert.equals(5, s2.size)
    Assert.equals(1, s2[0])

    return 0
}
