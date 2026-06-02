/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_13_03_a02_02

  @Level:         1

  @Assertion: 4.13.3(2) Index access expressions are used for types that support index access
              (including Array types and Tuple
              types) to access elements at their specific locations, as detailed in Chapter 2 for Array types and
              Tuple types.

  @Description: Check that index access expression usage for a type which does not support index acecss causes a
                compilation error.

  @Mode: compileonly

  @Negative: yes

*/

struct S {
    var x: Int64 = 0
}

main() {
    let s = S()
    s[0]
    return
}

