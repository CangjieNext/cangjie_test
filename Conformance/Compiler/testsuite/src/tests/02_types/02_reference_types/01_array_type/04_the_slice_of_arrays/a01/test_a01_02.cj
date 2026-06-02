/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         02_02_01_04_a01_02

  @Level:         1
  @Assertion:    2.2.1.4(1) When the expression of Range<Int64> type is used
                 for array index, it indicates that intercepting a slice from
                 the array.

  @Description:  Checks that array can't be sliced using Range<Int32> as index

  @Mode:         compileonly
  @Negative:     yes
  @Structure:    single

*/

main(): Int64 {
    let size = 20
    let a = Array<Int64>(size) { i => 1 << i }

    let r: Range<Int32> = 1i32..3i32
    let s = a[r]

    return 0
}
