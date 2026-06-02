/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_08_a01_02

  @Level:         1
  @Assertion:       2.1.8(1) The Range type is written as Range<T>, where T can only be
                    instantiated as types that implement the Comparable interface and the
                    AddInt64 interface.

  @Description:     Checks that float type cannot be used for range.

  @Mode:            compileonly
  @Negative:        yes
  @Structure:       single
  @Issue:           0006079

*/

func range<T>(a: T, b: T): Range<T> {
  a..b
}

main() {
  let a = range(0.0, 1.1)
  return 0
}
