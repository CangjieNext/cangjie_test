/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            04_04_02_a08_03

  @Level:         1

  @Assertion:       4.4.2(8) An enum pattern is irrefutable if and only if the corresponding enum type has only one
                    parameterized constructor, and all other patterns contained in the enum pattern (if present) are
                    irrefutable patterns.

  @Description:     Check that an enum pattern consisting of refutable patterns (constant, refutable tuple, type,
                    refutable enum) is also refutable.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no

*/

import utils.assert.Assert

enum E { A(Bool) }
enum Tuple { B( (Bool, Bool) ) }
enum Enum { C(E) }

main() {
    match (A(false)) { // Refutation for the enum pattern consisting of a constant pattern.
        case A(true) => Assert.fail()
        case _ => Assert.isFalse(false)
    }
    match ( C(A(false)) ) { // Refutation for the enum pattern consisting of a refutable enum pattern.
        case C(A(true)) => Assert.fail()
        case _ => Assert.isFalse(false)
    }
    match (A(false)) { // Refutation for the enum pattern consisting of a type pattern.
        case A(_: Int64) => Assert.fail()
        case _ => Assert.isFalse(false)
    }
    match ( B((false, false)) ) { // Refutation for the enum pattern consisting of a refutable tuple pattern.
        case B( (_, true) ) => Assert.fail()
        case _ => Assert.isFalse(false)
    }
}
