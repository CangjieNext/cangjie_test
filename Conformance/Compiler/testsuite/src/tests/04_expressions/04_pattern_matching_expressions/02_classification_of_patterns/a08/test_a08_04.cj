/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            04_04_02_a08_04

  @Level:         1

  @Assertion:       4.4.2(8) An enum pattern is irrefutable if and only if the corresponding enum type has only one
                    parameterized constructor, and all other patterns contained in the enum pattern (if present) are
                    irrefutable patterns.

  @Description:     Check that an enum pattern with a two-parameterized constructor is irrefutable if the conditions
                    are met.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no

*/

import utils.assert.Assert

enum E { A(Bool, Bool) }
enum Tuple { B((Bool, Bool), Bool) }
enum Enum { C(E, Bool) }

main() {
    // Wildcard
    match (A(false, false)) {
        case A(_, _) => Assert.isFalse(false)
    }
    match (A(false, true)) {
        case A(_, _) => Assert.isFalse(false)
    }
    match (A(true, false)) {
        case A(_, _) => Assert.isTrue(true)
    }
    match (A(true, true)) {
        case A(_, _) => Assert.isTrue(true)
    }
    // All posibilities (A(false, false), A(false, true), A(true, false) and A(true, false)) have been matched on the
    // pattern A(_, _) => it's irrefutable pattern

    // Binding
    match (A(false, false)) {
        case A(x, y) => Assert.isFalse(x)
                        Assert.isFalse(y)
    }
    match (A(false, true)) {
        case A(x, y) => Assert.isFalse(x)
                        Assert.isTrue(y)
    }
    match (A(true, false)) {
        case A(x, y) => Assert.isTrue(x)
                        Assert.isFalse(y)
    }
    match (A(true, true)) {
        case A(x, y) => Assert.isTrue(x)
                        Assert.isTrue(y)
    }

    // Tuple
    match ( B((false, false), false) ) {
        case B((_, _), _) => Assert.isFalse(false)
    }
    match ( B((false, true), false) ) {
        case B((_, _), _) => Assert.isFalse(false)
    }
    match ( B((true, false), false) ) {
        case B((_, _), _) => Assert.isTrue(true)
    }
    match ( B((true, true), false) ) {
        case B((_, _), _) => Assert.isTrue(true)
    }
    // Enum
    match ( C(A(false, false), false) ) {
        case C(A(_, _), _) => Assert.isFalse(false)
    }
    match ( C(A(false, true), false) ) {
        case C(A(_, _), _) => Assert.isFalse(false)
    }
    match ( C(A(true, false), false) ) {
        case C(A(_, _), _) => Assert.isTrue(true)
    }
    match ( C(A(true, true), false) ) {
        case C(A(_, _), _) => Assert.isTrue(true)
    }
}
