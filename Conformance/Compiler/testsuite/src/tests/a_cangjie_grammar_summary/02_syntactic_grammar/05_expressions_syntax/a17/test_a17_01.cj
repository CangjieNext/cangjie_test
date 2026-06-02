/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        A_02_05_a17_01

  @Level:         1
  @Assertion:   A.2.5(17)
                synchronizedExpression
                    : SYNCHRONIZED LPAREN NL* identifier NL* RPAREN NL* block
                    ;

  @Description: Check trivial synchronized expressions.
                Reference to other tests in additional_tests.txt.
  @Mode:        compileOnly
  @Negative:    no
  @Structure:   single
*/

import std.sync.*

// synchronizedExpression
func sync(m: Mutex) {
    synchronized (m) {
        return 1
    }
}

main() {
    return 0
}
