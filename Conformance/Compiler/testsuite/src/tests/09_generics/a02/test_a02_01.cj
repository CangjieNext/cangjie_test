/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_a02_01

  @Level:         1

  @Assertion: 9(2) Type parameters can substituted by other types. Type parameters can be substituted to be other 
              types when this generic declaration is used.

  @Description: Checks generic type parameter substitution.

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

func custom_min<T>(x: T, y: T): T where T <: Comparable<T> {
    if (x < y) {
      return x
    }
    return y
}

main() {
    Assert.equals(Int32(3), custom_min<Int32>(3, 5))
    Assert.equals(Float32(3.0), custom_min<Float32>(3.0, 5.0))
}

