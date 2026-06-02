/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_a01_004

  @Level:         1

  @Assertion: 4(1): An expression can consist of one or more operands, acted on
              by zero or more operators.
  @Description: Checks that lambda and quote expressions are valid
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: Ignore

*/

import std.ast.* 
import utils.macros.*

enum Test { 
    A | B | C(Int64) 
}

main() {
    quote(11)
    @matchOrThrow[A](A)
    { a: Int64, b: Int64 => a * b }
    return
}
