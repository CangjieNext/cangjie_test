/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_05_01_a10_01

  @Level:         1

  @Assertion: 4.5.1(10) Iterable<T> and Iterator<T> are available in the standard library.
  @Description: Checks that Iterable<T> and Iterator<T> are available
  @Mode: run
  @Negative: no

*/

import utils.assert.Assert

main() {
    let range = 1..10
    let array = [r'a',r'b',r'c']

    Assert.isTrue(range is Iterable<Int64>)
    Assert.isTrue(range.iterator() is Iterator<Int64>)
    Assert.isTrue(array is Iterable<Rune>)
    Assert.isTrue(array.iterator() is Iterator<Rune>)
}
