/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            04_04_02_a08_01

  @Level:         1

  @Assertion:       4.4.2(8) An enum pattern is irrefutable if and only if the corresponding enum type has only one
                    parameterized constructor, and all other patterns contained in the enum pattern (if present) are
                    irrefutable patterns.

  @Description:     Check that an enum pattern is irrefutable when it has only one parametrized constructor and uses
                    irrefutable patterns as enumPatternParameters (wildcard, binding, irrefutable tuple, irrefutable
                    enum).

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no

*/

import utils.assert.Assert

enum E { A(Bool) }
enum Tuple { B((Bool, Bool)) }
enum Enum { C(E) }

main() {
    // Wildcard
    match (A(false)) {
        case A(_) => Assert.isFalse(false) // all matched => pattern is irrefutable
    }
    match (A(true)) {
        case A(_) => Assert.isTrue(true) // all matched => pattern is irrefutable
    }
    // All posibilities (A(false) and A(true)) have been matched on the pattern A(_) => it's irrefutable pattern
    // Binding
    match (A(false)) {
        case A(x) => Assert.isFalse(x)
    }
    match (A(true)) {
        case A(x) => Assert.isTrue(x)
    }
    // Tuple of wildcards
    match ( B((false, false)) ) {
        case B((_, _)) => Assert.isFalse(false)
    }
    match ( B((false, true)) ) {
        case B((_, _)) => Assert.isFalse(false)
    }
    match ( B((true, false)) ) {
        case B((_, _)) => Assert.isTrue(true)
    }
    match ( B((true, true)) ) {
        case B((_, _)) => Assert.isTrue(true)
    }
    // Tuple of bindings
    match ( B((false, false)) ) {
        case B((x, y)) => Assert.isFalse(x)
                        Assert.isFalse(y)
    }
    match ( B((false, true)) ) {
        case B((x, y)) => Assert.isFalse(false)
                        Assert.isTrue(y)
    }
    match ( B((true, false)) ) {
        case B((x, y)) => Assert.isTrue(true)
                        Assert.isFalse(y)
    }
    match ( B((true, true)) ) {
        case B((x, y)) => Assert.isTrue(true)
                        Assert.isTrue(y)
    }
    // Enum+wildcard
    match ( C(A(false)) ) {
        case C(A(_)) => Assert.isFalse(false)
    }
    match ( C(A(true)) ) {
        case C(A(_)) => Assert.isTrue(true)
    }
    // Enum+binding
    match ( C(A(false)) ) {
        case C(A(x)) => Assert.isFalse(x)
    }
    match ( C(A(true)) ) {
        case C(A(x)) => Assert.isTrue(x)
    }
}
