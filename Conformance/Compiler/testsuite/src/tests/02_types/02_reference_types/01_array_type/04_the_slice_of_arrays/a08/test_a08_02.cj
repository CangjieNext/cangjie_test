/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         02_02_01_04_a08_02

  @Level:         1
  @Assertion:    2.2.1.4(8) When using slicing for assignment, two different
                 uses are supported.
                 If the type of the expression on the right side of = is the
                 element type of the array, the value of this expression will
                 be used as an element to cover the elements of
                 the slice range.

  @Description:  Checks that "slice assignment" with element of the type other
                 than array element type on the right fails

  @Mode:         compileonly
  @Negative:     yes
  @Structure:    single

*/
import utils.assert.*

main(): Int64 {
    let size = 20
    let a = Array<Int64>(size) { i => 1 << i }

    a[3..4] = "asdf'"

    return 0
}
