
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_21_a07_01

  @Level:         1

  @Assertion:   4.21(7) The expression e1 ?? e2 is the syntactic sugar of the following match expression:
                // when e1 is Option<T>
                match (e1) {
                    case Some(v) => v
                    case None => e2
                }
  @Description: Checks that the results of ?? operator and the given match statement are identical for various types.
  @Mode: run
  @Negative: no
  @Structure: single

*/

import utils.assert.Assert

class C { 
    var x = 0
    C(y : Int64) {
        x = y
    }
}

func getMatches<T>(x : T, y : T) {
    let some = match (Some(x)) {
        case Some(v) => v
        case None => throw(Exception("Should not be evaluated"))
    }
    let none = match (Option<T>.None) {
        case Some(v) => v
        case None => y
    }
    Assert.isTrue(some is T)
    Assert.isTrue(none is T)
    return (some, none)
}

func checkMatches<T>(x : T, y : T) where T <: Equatable<T> {
    let pair = getMatches(x, y)
    Assert.equals(pair[0], Option<T>.Some(x) ?? throw(Exception("Should not be evaluated")))
    Assert.equals(pair[1], Option<T>.None ?? y)
}

main() {
    checkMatches(1i8, 0i8)
    checkMatches(1i16, 0i16)
    checkMatches(1i32, 0i32)
    checkMatches(1i64, 0i64)
    checkMatches(1u8, 0u8)
    checkMatches(1u16, 0u16)
    checkMatches(1u32, 0u32)
    checkMatches(1u64, 0u64)
    checkMatches(1.0f16, 0.0f16)
    checkMatches(1.0f32, 0.0f32)
    checkMatches(1.0f64, 0.0f64)
    checkMatches("1", "0")
    checkMatches(r'1', r'0')
    checkMatches(true, false)
    let tupleMatches = getMatches((1, 2), (2, 1))
    let tupleSome = Some((1, 2)) ?? (2, 1)
    let tupleNone = Option<(Int64, Int64)>.None ?? (2, 1)
    Assert.equals(tupleSome[0], tupleMatches[0][0])
    Assert.equals(tupleSome[1], tupleMatches[0][1])
    Assert.equals(tupleNone[0], tupleMatches[1][0])
    Assert.equals(tupleNone[1], tupleMatches[1][1])
    let objMatches = getMatches(C(1), C(2))
    Assert.equals(C(1).x, objMatches[0].x)
    Assert.equals(C(2).x, objMatches[1].x)
}
