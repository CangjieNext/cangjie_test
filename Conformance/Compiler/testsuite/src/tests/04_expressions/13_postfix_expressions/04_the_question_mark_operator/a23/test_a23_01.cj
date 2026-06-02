/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_13_04_a23_01

  @Level:         1

  @Assertion: 4.13.4(23) Similarly, the expressions a?.b = e1, a?[b] = e2 and a?.b.c?.d = e3 are equivalent
              to the following match expressions, respectively.

              // a?.b = e1 is equivalent to the following match expression. 
              match (a) {
                  case Some(v) => v.b = e1 
                  case None => ()
              }

              // a?[b] = e2 is equivalent to the following match expression. 
              match (a) {
                  case Some(v) => v[b] = e2 
                  case None => ()
              }

              // a?.b.c?.d = e3 is equivalent to the following match expression. 
              match (a) {
                  case Some(va) =>
                      match (va.b.c) {
                          case Some(vc) => vc.d = e3 
                          case None => ()
                      }
                  case None => ()
              }

  @Description: Check that 'a?.b = e1', 'a?[b] = e2' and 'a?.b.c?.d = e3' expressions are equivalent to the specified
                match expressions.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

class C {
    init() {
        d = 7
    }

    var d: Int64
}

class B {
    init() {
        c = C()
    }

    var c: ?C
}

class A {
    init() {
        b = 5
        x = B()
    }

    var b: Int64
    var x: B
}

main() {
    //
    // Case: 'a?.b = e1'
    //

    var a1 = Option<A>.Some(A())
    var a2 = Option<A>.Some(A())
    Assert.isTrue(a1?.b == 5)
    Assert.isTrue(a2?.b == 5)
    a1?.b = 9
    match (a2) {
        case Some(v) => v.b = 9
        case None => ()
    }
    Assert.isTrue(a1?.b == 9)
    Assert.isTrue(a2?.b == 9)

    var n1 = Option<A>.None
    var n2 = Option<A>.None
    Assert.isNone(n1?.b)
    Assert.isNone(n2?.b)
    n1?.b = 9
    match (n2) {
        case Some(v) => v.b = 9
        case None => ()
    }
    Assert.isNone(n1?.b)
    Assert.isNone(n2?.b)

    //
    // Case: 'a?[b] = e2'
    //

    var arr1: ?Array<Int64> = [1, 2, 3, 4, 5]
    var arr2: ?Array<Int64> = [1, 2, 3, 4, 5]
    Assert.isTrue(arr1?[2] == 3)
    Assert.isTrue(arr2?[2] == 3)
    arr1?[2] = 9
    match (arr2) {
        case Some(v) => v[2] = 9 
        case None => ()
    }
    Assert.isTrue(arr1?[2] == 9)
    Assert.isTrue(arr2?[2] == 9)

    var nrr1 = Option<Array<Int64>>.None
    var nrr2 = Option<Array<Int64>>.None
    Assert.isNone(nrr1?[2])
    Assert.isNone(nrr2?[2])
    nrr1?[2] = 9
    match (nrr2) {
        case Some(v) => v[2] = 9 
        case None => ()
    }
    Assert.isNone(nrr1?[2])
    Assert.isNone(nrr2?[2])

    //
    // Case: 'a?.b.c?.d = e3'
    //

    Assert.isTrue(a1?.x.c?.d == 7)
    Assert.isTrue(a2?.x.c?.d == 7)
    a1?.x.c?.d = 9
    match (a2) {
        case Some(va) =>
            match (va.x.c) {
                case Some(vc) => vc.d = 9
                case None => ()
            }
        case None => ()
    }
    Assert.isTrue(a1?.x.c?.d == 9)
    Assert.isTrue(a2?.x.c?.d == 9)

    a1?.x.c = Option<C>.None
    a2?.x.c = Option<C>.None

    Assert.isNone(a1?.x.c?.d)
    Assert.isNone(a2?.x.c?.d)
    a1?.x.c?.d = 9
    match (a2) {
        case Some(va) =>
            match (va.x.c) {
                case Some(vc) => vc.d = 9
                case None => ()
            }
        case None => ()
    }
    Assert.isNone(a1?.x.c?.d)
    Assert.isNone(a2?.x.c?.d)

    a1 = Option<A>.None
    a2 = Option<A>.None

    Assert.isNone(a1?.x.c?.d)
    Assert.isNone(a2?.x.c?.d)
    a1?.x.c?.d = 9
    match (a2) {
        case Some(va) =>
            match (va.x.c) {
                case Some(vc) => vc.d = 9
                case None => ()
            }
        case None => ()
    }
    Assert.isNone(a1?.x.c?.d)
    Assert.isNone(a2?.x.c?.d)

    return
}

