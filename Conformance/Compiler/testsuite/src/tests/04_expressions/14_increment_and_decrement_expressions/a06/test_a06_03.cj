/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_14_a06_03

  @Level:         1

  @Assertion: 4.14(6) For the expression expr++ (or expr--), the following is specified:

              1. The type of expr must be one of integer types

  @Description: Check that ++ being applied to non-integer type (Float32) causes a compilation error.

  @Mode: compileonly

  @Negative: yes

*/

main() {
    var x: Float32 = 0.0
    x++
    return
}

