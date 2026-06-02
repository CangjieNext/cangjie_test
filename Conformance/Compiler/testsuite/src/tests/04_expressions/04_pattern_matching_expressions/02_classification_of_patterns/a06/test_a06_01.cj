/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            04_04_02_a06_01

  @Level:         1

  @Assertion:       4.4.2(6) A tuple pattern is irrefutable if and only if each pattern it contains is an irrefutable
                    pattern.

  @Description:     Check that a tuple pattern is irrefutable if each pattern it contains is an irrefutable pattern:
                    the wildcard pattern, the binding pattern and an irrefutable enum pattern.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no

*/

import utils.assert.Assert

enum E <: Equatable<E> { A(Bool)
    public operator func == (e: E) {
        match(this) {
            case A(x) => match (e) {
                            case A(y) => x == y
                        }
        }
    }
    public operator func != (e: E) { !(this == e) }
}

main() {
    let v0 = (false, A(false)) // Base
    let v1 = (false, A(true)) // Modified
    let v2 = (true, A(false)) // Other modified
    let v3 = (true, A(true)) // All possible combinations for type (Bool, E)

    // Check wildcard and binding pattern in tuple.
    match(v0) {
        case (_, x) => Assert.equals(A(false), x)
    }
    match(v1) {
        case (_, x) => Assert.equals(A(true), x)
    }
    match(v2) {
        case (_, x) => Assert.equals(A(false), x)
    }
    match(v3) {
        case (_, x) => Assert.equals(A(true), x)
    }
    // All possible variants are matched on the same pattern (_, x) (wildcard+binding) => it's irrefutable.

    // Check binding and wildcard pattern in tuple.
    match(v0) {
        case (x, _) => Assert.equals(false, x)
    }
    match(v1) {
        case (x, _) => Assert.equals(false, x)
    }
    match(v2) {
        case (x, _) => Assert.equals(true, x)
    }
    match(v3) {
        case (x, _) => Assert.equals(true, x)
    }
    // All possible variants are matched on the same pattern (x, _) (binding+wildcard) => it's irrefutable.

    // Check binding and enum pattern in tuple.
    match(v0) {
        case (x, A(y)) => Assert.equals(false, x)
                        Assert.equals(false, y)
    }
    match(v1) {
        case (x, A(y)) => Assert.equals(false, x)
                        Assert.equals(true, y)
    }
    match(v2) {
        case (x, A(y)) => Assert.equals(true, x)
                        Assert.equals(false, y)
    }
    match(v3) {
        case (x, A(y)) => Assert.equals(true, x)
                        Assert.equals(true, y)
    }
    // Nowhere pattern (x, A(y)) (binding+enum) was mismatched => it's irrefutable.

    // Check wildcard and enum pattern in tuple.
    match(v0) {
        case (_, A(x)) => Assert.equals(false, x)
    }
    match(v1) {
        case (_, A(x)) => Assert.equals(true, x)
    }
    match(v2) {
        case (_, A(x)) => Assert.equals(false, x)
    }
    match(v3) {
        case (_, A(x)) => Assert.equals(true, x)
    }
    // Nowhere pattern (_, A(x)) (wildcard+enum) was mismatched => it's irrefutable.

    // Check wildcard and wildcard pattern in tuple.
    match(v0) {
        case (_, _) => Assert.isTrue(true) // matched
    }
    match(v1) {
        case (_, _) => Assert.isTrue(true)
    }
    match(v2) {
        case (_, _) => Assert.isTrue(true)
    }
    match(v3) {
        case (_, _) => Assert.isTrue(true)
    }

    // Check binding and binding pattern in tuple.
    match(v0) {
        case (x, y) => Assert.equals(false, x)
                        Assert.equals(A(false), y)
    }
    match(v1) {
        case (x, y) => Assert.equals(false, x)
                        Assert.equals(A(true), y)
    }
    match(v2) {
        case (x, y) => Assert.equals(true, x)
                        Assert.equals(A(false), y)
    }
    match(v3) {
        case (x, y) => Assert.equals(true, x)
                        Assert.equals(A(true), y)
    }

    let v4 = (A(false), A(false))
    let v5 = (A(false), A(true))
    let v6 = (A(true), A(false))
    let v7 = (A(true), A(true))

    // Check enum and binding pattern in tuple.
    match(v4) {
        case (A(x), y) => Assert.equals(false, x)
                        Assert.equals(A(false), y)
    }
    match(v5) {
        case (A(x), y) => Assert.equals(false, x)
                        Assert.equals(A(true), y)
    }
    match(v6) {
        case (A(x), y) => Assert.equals(true, x)
                        Assert.equals(A(false), y)
    }
    match(v7) {
        case (A(x), y) => Assert.equals(true, x)
                        Assert.equals(A(true), y)
    }

    // Check enum and wildcard pattern in tuple.
    match(v4) {
        case (A(x), _) => Assert.equals(false, x)
    }
    match(v5) {
        case (A(x), _) => Assert.equals(false, x)
    }
    match(v6) {
        case (A(x), _) => Assert.equals(true, x)
    }
    match(v7) {
        case (A(x), _) => Assert.equals(true, x)
    }

    // Check enum and enum pattern in tuple.
    match(v4) {
        case (A(x), A(y)) => Assert.equals(false, x)
                        Assert.equals(false, y)
    }
    match(v5) {
        case (A(x), A(y)) => Assert.equals(false, x)
                        Assert.equals(true, y)
    }
    match(v6) {
        case (A(x), A(y)) => Assert.equals(true, x)
                        Assert.equals(false, y)
    }
    match(v7) {
        case (A(x), A(y)) => Assert.equals(true, x)
                        Assert.equals(true, y)
    }
}
