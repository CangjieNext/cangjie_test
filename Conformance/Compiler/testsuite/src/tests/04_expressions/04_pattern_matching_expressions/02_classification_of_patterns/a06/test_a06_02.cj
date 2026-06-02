/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            04_04_02_a06_02

  @Level:         1

  @Assertion:       4.4.2(6) A tuple pattern is irrefutable if and only if each pattern it contains is an irrefutable
                    pattern.

  @Description:     Check that a tuple pattern is irrefutable if it consists of an irrefutable tuple pattern and one of
                    the other irrefutable patterns: the wildcard pattern, the binding pattern or an irrefutable enum
                    pattern.

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
    match( ((false, false), false) ) {
        case ((_, _), _) => Assert.isTrue(true)
    }
    match( ((false, false), true) ) {
        case ((_, _), _) => Assert.isTrue(true)
    }
    match( ((false, true), false) ) {
        case ((_, _), _) => Assert.isTrue(true)
    }
    match( ((false, true), true) ) {
        case ((_, _), _) => Assert.isTrue(true)
    }
    match( ((true, false), false) ) {
        case ((_, _), _) => Assert.isTrue(true)
    }
    match( ((true, false), true) ) {
        case ((_, _), _) => Assert.isTrue(true)
    }
    match( ((true, true), false) ) {
        case ((_, _), _) => Assert.isTrue(true)
    }
    match( ((true, true), true) ) {
        case ((_, _), _) => Assert.isTrue(true)
    }
    // Pattern ((_, _), _) matches all possible variants of this type => the tuple pattern is irrefutable.

    match( (false, (false, false)) ) {
        case (x, (_, y)) => Assert.isFalse(x)
                            Assert.isFalse(y)
    }
    match( (false, (false, true)) ) {
        case (x, (_, y)) => Assert.isFalse(x)
                            Assert.isTrue(y)
    }
    match( (false, (true, false)) ) {
        case (x, (_, y)) => Assert.isFalse(x)
                            Assert.isFalse(y)
    }
    match( (false, (true, true)) ) {
        case (x, (_, y)) => Assert.isFalse(x)
                            Assert.isTrue(y)
    }
    match( (true, (false, false)) ) {
        case (x, (_, y)) => Assert.isTrue(x)
                            Assert.isFalse(y)
    }
    match( (true, (false, true)) ) {
        case (x, (_, y)) => Assert.isTrue(x)
                            Assert.isTrue(y)
    }
    match( (true, (true, false)) ) {
        case (x, (_, y)) => Assert.isTrue(x)
                            Assert.isFalse(y)
    }
    match( (true, (true, true)) ) {
        case (x, (_, y)) => Assert.isTrue(x)
                            Assert.isTrue(y)
    }

    match( ((false, false), A(false)) ) {
        case ((x, _), A(y)) => Assert.isFalse(x)
                            Assert.isFalse(y)
        case (_, _) => Assert.fail() // Unreachable code, but the compiler won't compile without it.
    }
    match( ((false, false), A(true)) ) {
        case ((x, _), A(y)) => Assert.isFalse(x)
                            Assert.isTrue(y)
        case (_, _) => Assert.fail() // Unreachable code, but the compiler won't compile without it.
    }
    match( ((false, true), A(false)) ) {
        case ((x, _), A(y)) => Assert.isFalse(x)
                            Assert.isFalse(y)
        case (_, _) => Assert.fail() // Unreachable code, but the compiler won't compile without it.
    }
    match( ((false, true), A(true)) ) {
        case ((x, _), A(y)) => Assert.isFalse(x)
                            Assert.isTrue(y)
        case (_, _) => Assert.fail() // Unreachable code, but the compiler won't compile without it.
    }
    match( ((true, false), A(false)) ) {
        case ((x, _), A(y)) => Assert.isTrue(x)
                            Assert.isFalse(y)
        case (_, _) => Assert.fail() // Unreachable code, but the compiler won't compile without it.
    }
    match( ((true, false), A(true)) ) {
        case ((x, _), A(y)) => Assert.isTrue(x)
                            Assert.isTrue(y)
        case (_, _) => Assert.fail() // Unreachable code, but the compiler won't compile without it.
    }
    match( ((true, true), A(false)) ) {
        case ((x, _), A(y)) => Assert.isTrue(x)
                            Assert.isFalse(y)
        case (_, _) => Assert.fail() // Unreachable code, but the compiler won't compile without it.
    }
    match( ((true, true), A(true)) ) {
        case ((x, _), A(y)) => Assert.isTrue(x)
                            Assert.isTrue(y)
        case (_, _) => Assert.fail() // Unreachable code, but the compiler won't compile without it.
    }
}
