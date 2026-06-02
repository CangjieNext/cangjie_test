/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_13_03_a02_01

  @Level:         1

  @Assertion: 4.13.3(2) Index access expressions are used for types that support index access
              (including Array types and Tuple
              types) to access elements at their specific locations, as detailed in Chapter 2 for Array types and
              Tuple types.

  @Description: Check index access expression usage for accessing elements by their indices in arrays and tuples.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

main() {
    // Case: index access expression for arrays.
    let a = [1, 2, 3, 4, 5]
    let ax = a[2]
    Assert.equals(3, ax)
    let ay = a[..=3]
    Assert.isTrue(ay == [1, 2, 3, 4])

    // Case: index access expression for tuples.
    let t = (1, 2, 3, 4, 5)
    let tx = t[2]
    Assert.equals(3, tx)
}

