/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_28_a53_02

  @Level:         1

  @Assertion: 4.28(53) Note: When ? is used together with ., (), {} or [], the evaluation order
              is not strictly according to
              their precedence and associativity described in the table, as it is a form of syntactic sugar. See the
              question mark operator for details.

  @Description: Check if '?.' follows pecedence rules, it would cause a compilation error.

  @Mode: compileonly

  @Negative: yes

*/

class C {
    var x: Int64 = 5
}

main() {
    var c: ?C = C()
    c?(.x)
    return
}

