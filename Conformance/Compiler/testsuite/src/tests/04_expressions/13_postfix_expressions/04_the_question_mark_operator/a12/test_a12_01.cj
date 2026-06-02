/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_13_04_a12_01

  @Level:         1

  @Assertion: 4.13.4(12) In fact, the expressions a?.b, c?(d) and e?[f] are equivalent
              to the following match expressions, respectively.

              // a?.b is equivalent to the following match expression.
              match (a) {
                  case Some(v) => Some(v.b)
                  case None => None
              }

              // a?(b) is equivalent to the following match expression.
              match (a) {
                  case Some(v) => Some(v(b))
                  case None => None
              }

              // a?[b] is equivalent to the following match expression.
              match (a) {
                  case Some(v) => Some(v[b])
                  case None => None
              }

  @Description: Check equivalent expressions for 'a?.b', 'a?(b)' and a?[b].

  @Mode: run

  @Negative: no

  @Issue: 0006387

*/

import utils.assert.Assert

struct S {
    var xi: Int64 = 1812
    var xf: Float64 = 10.0
    var xs: String = "hi"
}

func id<T>(t: T) {
    return t
}

func equals<T>(x: Option<T>, y: Option<T>) where T <: Comparable<T> {
    match (x) {
        case Some(p) =>
            match (y) {
                case Some(q) => p == q
                case None => false
            }
        case None =>
            match (y) {
                case Some(q) => false
                case None => true
            }
    }
}

func patternMatchCall<T>(x: Option<(T) -> T>, y: T) {
    match (x) {
        case Some(v) => Some(v(y))
        case None => Option<T>.None
    }
}

func patternMatchIndexAccess<T>(x: Option<Array<T>>, y: Int64) {
    match (x) {
        case Some(v) => Option<T>.Some(v[y])
        case None => Option<T>.None
    }
}


main() {
    //
    // Case: 'a?.b'
    //
    var s: ?S = Option<S>.Some(S())

    let pmsxi = match (s) {
        case Some(t) => Some(t.xi)
        case None => Option<Int64>.None
    }
    Assert.isTrue(equals(s?.xi, pmsxi))

    let pmsxf = match (s) {
        case Some(t) => Some(t.xf)
        case None => Option<Float64>.None
    }
    Assert.isTrue(equals(s?.xf, pmsxf))

    let pmsxs = match (s) {
        case Some(t) => Some(t.xs)
        case None => Option<String>.None
    }
    Assert.isTrue(equals(s?.xs, pmsxs))

    var n: ?S = Option<S>.None

    let pmnxi = match (n) {
        case Some(t) => Some(t.xi)
        case None => Option<Int64>.None
    }
    Assert.isTrue(equals(n?.xi, pmnxi))

    let pmnxf = match (n) {
        case Some(t) => Some(t.xf)
        case None => Option<Float64>.None
    }
    Assert.isTrue(equals(n?.xf, pmnxf))

    let pmnxs = match (n) {
        case Some(t) => Some(t.xs)
        case None => Option<String>.None
    }
    Assert.isTrue(equals(n?.xs, pmnxs))

    //
    // Case: 'c?(d)'
    //
    let fi: ?((Int64) -> Int64) = id<Int64>
    let ff: ?((Float64) -> Float64) = id<Float64>
    let fs: ?((String) -> String) = id<String>
    Assert.isTrue(equals(fi?(1709), patternMatchCall(fi, 1709)))
    Assert.isTrue(equals(ff?(10.0), patternMatchCall(ff, 10.0)))
    Assert.isTrue(equals(fs?("hi"), patternMatchCall(fs, "hi")))

    let gi = Option<(Int64) -> Int64>.None
    let gf = Option<(Float64) -> Float64>.None
    let gs = Option<(String) -> String>.None
    Assert.isTrue(equals(gi?(1709), patternMatchCall(gi, 1709)))
    Assert.isTrue(equals(gf?(10.0), patternMatchCall(gf, 10.0)))
    Assert.isTrue(equals(gs?("hi"), patternMatchCall(gs, "hi")))

    //
    // Case: type of 'e?[f]'
    //
    var ai: ?Array<Int64> = [1, 2, 3, 4, 5]
    var af: ?Array<Float64> = [1.0, 2.0, 3.0, 4.0, 5.0]
    var aw: ?Array<String> = ["a", "b", "c", "d", "e"]
    Assert.isTrue(equals(ai?[1], patternMatchIndexAccess(ai, 1)))
    Assert.isTrue(equals(af?[1], patternMatchIndexAccess(af, 1)))
    Assert.isTrue(equals(aw?[1], patternMatchIndexAccess(aw, 1)))

    var bi = Option<Array<Int64>>.None
    var bf = Option<Array<Float64>>.None
    var bw = Option<Array<String>>.None
    Assert.isTrue(equals(bi?[1], patternMatchIndexAccess(bi, 1)))
    Assert.isTrue(equals(bf?[1], patternMatchIndexAccess(bf, 1)))
    Assert.isTrue(equals(bw?[1], patternMatchIndexAccess(bw, 1)))
}

