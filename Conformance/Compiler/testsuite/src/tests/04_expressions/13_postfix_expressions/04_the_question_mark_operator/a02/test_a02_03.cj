/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_13_04_a02_03

  @Level:         1

  @Assertion: 4.13.4(2) The ? must be used with the postfix operators, including ., () and [](appearing before postfix
              operators), to make Option types support for these postfix operators, e.g., a?.b, a?(b), a?[b]. 

  @Description: Check that question mark operator usage on non-postfix operator (+) causes a compilation error.

  @Mode: compileonly

  @Negative: yes

*/

struct S {
    var x: Int64 = 3
}

main() {
    var s: ?S = S()
    s?+
    return
}

