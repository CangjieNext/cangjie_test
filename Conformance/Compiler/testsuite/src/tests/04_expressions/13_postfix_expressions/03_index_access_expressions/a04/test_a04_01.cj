/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_13_03_a04_01

  @Level:         1

  @Assertion: 4.13.3(4) For the index access expression e[a] (assuming that e is of type T),
              we have the following rules.
              2. When T is not a tuple type, e[a] is mutable if T overloads the set form of the operator [] (see
                 Operators that can be Overloaded), otherwise e[a] is immutable.

  @Description: Check that 'e[a]' is mutable when 'e' is an array.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

main() {
    let a = [1, 2, 3, 4, 5]
    a[2] = 1709
    Assert.equals(1709, a[2])
}

