/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            04_04_02_a08_02

  @Level:         1

  @Assertion:       4.4.2(8) An enum pattern is irrefutable if and only if the corresponding enum type has only one
                    parameterized constructor, and all other patterns contained in the enum pattern (if present) are
                    irrefutable patterns.

  @Description:     Check that an enum pattern based on an enum that has one non-parameterized constructor or two
                    constructors can't be irrefutable.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no

  @Issue:           0006076,0006477

*/

import utils.assert.Assert

enum E1 { A }
enum E2 { B | C(Bool) }

main() {
    match (A) {
        case A => () // Should be refutable, but it's not? Can't prove refutation, issue 6477.
                    // If the enum pattern is refutable, there must exist an expression in match-expression condition,
                    // that our pattern can't match. But there is no such expressions.
    }
    match (B) {
        case C(_) => Assert.fail() // This is a refutation of the pattern С(_).
        case _ => Assert.isTrue(true)
    }
    match (C(false)) {
        case B => Assert.fail() // This is a refutation of the enum pattern B.
        case _ => Assert.isFalse(false)
    }
}
