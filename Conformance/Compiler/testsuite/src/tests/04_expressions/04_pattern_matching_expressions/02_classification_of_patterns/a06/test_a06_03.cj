/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            04_04_02_a06_03

  @Level:         1

  @Assertion:       4.4.2(6) A tuple pattern is irrefutable if and only if each pattern it contains is an irrefutable
                    pattern.

  @Description:     Check that a tuple pattern isn't irrefutable if one of its part is a refutable pattern: a constant
                    pattern, a type pattern, non-irrefutable tuple pattern, non-irrefutable enum pattern, and other
                    part is an irrefutable pattern: the wildcard pattern, a binding pattern, an irrefutable tuple
                    pattern, an irrefutable enum pattern.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no

*/

import utils.assert.Assert

enum Refutable <: Equatable<Refutable> { A(Bool) | B
    public operator func == (e: Refutable) {
        match(this) {
            case A(x) => match (e) {
                            case A(y) => x == y
                            case B => false
                        }
            case B => match (e) {
                        case B => true
                        case _ => false
                    }
        }
    }
    public operator func != (e: Refutable) { !(this == e) }
}

enum Irrefutable <: Equatable<Irrefutable> { C(Bool)
    public operator func == (e: Irrefutable) {
        match(this) {
            case C(x) => match (e) {
                            case C(y) => x == y
                        }
        }
    }
    public operator func != (e: Irrefutable) { !(this == e) }
}

main() {
    // const(refutable)+wildcard(irrefutable)=refutable
    match((false, false)) {
        case (true, x) => Assert.fail() // Not matched => isn't irrefutable
        case _ => Assert.isTrue(true)
    }
    // binding(irrefutable)+type(refutable)=refutable
    match((false, true)) {
        case (x, _: Int64) => Assert.fail() // Not matched => isn't irrefutable
        case _ => Assert.isTrue(true)
    }
    // tuple(refutable: const+binding)+tuple(irrefutable)=refutable
    match( ((false, false), (0, 1)) ) {
        case ((true, x), (_, _)) => Assert.fail() // Not matched => isn't irrefutable
        case _ => Assert.isTrue(true)
    }
    // enum(irrefutable)+enum(refutable)=refutable
    match((C(false), B)) {
        case (C(_), A(x)) => Assert.fail() // Not matched => isn't irrefutable
        case _ => Assert.isTrue(true)
    }
}
