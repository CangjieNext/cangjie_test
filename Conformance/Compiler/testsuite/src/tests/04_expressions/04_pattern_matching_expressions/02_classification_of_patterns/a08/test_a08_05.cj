/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            04_04_02_a08_05

  @Level:         1

  @Assertion:       4.4.2(8) An enum pattern is irrefutable if and only if the corresponding enum type has only one
                    parameterized constructor, and all other patterns contained in the enum pattern (if present) are
                    irrefutable patterns.

  @Description:     Check that the enum pattern that
                    1) based on an enum with a two-parameterized constructor,
                    2) consists of refutable patterns (constant, refutable tuple, type, refutable enum)
                    is also refutable.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no

  @Issue:           0006076

*/

import utils.assert.Assert

enum E { A(Bool, Bool) }
enum Tuple { B( (Bool, Bool), Bool ) }
enum Enum { C(E, Bool) }

main() {
    // A constant pattern inside an enum pattern.
    match (A(false, false)) {
        case A(_, true) => Assert.fail()
        case _ => Assert.isFalse(false)
    }
    // A tuple pattern inside an enum pattern.
    match ( B((false, false), false) ) {
        case B( (_, x: E), _) => Assert.fail() // Enum pattern of 1) a refutable tuple pattern of wildcard+type pattern
                                            // and 2) the wildcard pattern.
        case _ => Assert.isFalse(false)
    }
    // A type pattern inside an enum pattern.
    match ( A(false, false) ) {
        case A(x, y: E) => Assert.fail()
        case _ => Assert.isFalse(false)
    }
    // An enum pattern inside an enum pattern.
    match ( C(A(false, true), false) ) {
        case C(A(true, false), x) => Assert.fail() // Enum pattern of 1) a refutable enum pattern with two constant
                                                // pattern inside and 2) the binding pattern.
        case _ => Assert.isFalse(false)
    }
}
