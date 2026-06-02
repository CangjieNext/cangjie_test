/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_08_a01_03

  @Level:         1
  @Assertion:       2.1.8(1) The Range type is written as Range<T>, where T can only be
                    instantiated as types that implement the Comparable interface and the
                    AddInt64 interface.

  @Description:     Checks that T can be a type which implement Countable Comparable interfaces.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @Issue:           0006079

*/

import utils.assert.Assert

main() {
  let x1 = 0..10
  for (el in x1) {
    Assert.isTrue(el is Comparable<Int64>)
    Assert.isTrue(el is Countable<Int64>)
  }
  let x2 = 0u8..10u8
  for (el in x2) {
    Assert.isTrue(el is Comparable<UInt8>)
    Assert.isTrue(el is Countable<UInt8>)
  }
  return 0
}
