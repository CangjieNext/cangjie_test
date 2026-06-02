/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_13_04_a16_01

  @Level:         1

  @Assertion: 4.13.4(16) The expression a?.b.c?.d is equivalent to the following match expression.

              // a?.b.c?.d is equivalent to the following match expression. 
              match (a) {
                  case Some(va) =>
                      let x = va.b.c 
                      match (x) {
                          case Some(vc) => Some(vc.d) 
                          case None => None
                      }
                  case None => None
              }

  @Description: Check that value of 'a?.b.c?.d' is equivalent to the match expression provided.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

struct C {
    var d = 5
}

struct B {
    var c = Option<C>.Some(C())
}

struct A {
    var b = B()
}

struct NB {
    var c = Option<C>.None
}

struct NA {
    var b = NB()
}

func equals<T>(x: Option<T>, y: Option<T>) where T <: Comparable<T> {
    match (x) {
        case Some(vx) =>
            match (y) {
                case Some(vy) => vx == vy
                case None => false
            }
        case None =>
            match (y) {
                case Some(vy) => false
                case None => true
            }
    }
}

func patternMatchingExpression(a: Option<A>) {
    match (a) {
        case Some(va) =>
            let x = va.b.c 
            match (x) {
                case Some(vc) => Some(vc.d) 
                case None => Option<Int64>.None
            }
        case None => Option<Int64>.None
    }
}

func patternMatchingExpression(a: Option<NA>) {
    match (a) {
        case Some(va) =>
            let x = va.b.c 
            match (x) {
                case Some(vc) => Some(vc.d) 
                case None => Option<Int64>.None
            }
        case None => Option<Int64>.None
    }
}

main() {
    let a = Option<A>.Some(A())
    Assert.equals(a?.b.c?.d, patternMatchingExpression(a))

    let n = Option<A>.None
    Assert.equals(n?.b.c?.d, patternMatchingExpression(n))

    let na = Option<NA>.Some(NA())
    Assert.equals(na?.b.c?.d, patternMatchingExpression(na))
}

