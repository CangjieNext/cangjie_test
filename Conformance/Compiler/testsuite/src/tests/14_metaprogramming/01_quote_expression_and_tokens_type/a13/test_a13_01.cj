/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:        14_01_a13_01

  @Level:         1

  @Assertion:   14.1(13) The quoted expression can contain a macro invocation expression. For example:
                quote(@SayHi("say hi")) // a quoted, un-expanded macro -- macro expansion happens later

  @Description: Positive check example
  
  @Mode:        run

  @Negative:    no

*/

import std.ast.*

main(): Unit {
    quote(@SayHi("say hi")) // a quoted, un-expanded macro -- macro expansion happens later
}
