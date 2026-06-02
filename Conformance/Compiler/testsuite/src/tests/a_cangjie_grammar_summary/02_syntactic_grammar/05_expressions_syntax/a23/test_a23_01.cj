/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        A_02_05_a23_01

  @Level:         1
  @Assertion:   A.2.5(23) 
                quoteInterpolate
                    : DOLLAR LPAREN NL* expression NL* RPAREN
                    ;

  @Description: Check trivial quoteInterpolate expressions.
                Reference to other tests in additional_tests.txt.
  @Mode:        compileOnly
  @Negative:    no
  @Structure:   single
*/

import std.ast.*

main() {
    var v1 = 2
    var v2:Int64 = 2 
    var t:Tokens = quote($(v1 + v2))
    return 0
}
