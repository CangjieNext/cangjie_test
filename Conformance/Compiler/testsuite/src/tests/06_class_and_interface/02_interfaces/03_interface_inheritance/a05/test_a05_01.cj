/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_03_a05_01

  @Level:         1

  @Assertion: 6.2.3(5)
              When inheriting a generic interface, it cannot be directly inherited
              multiple times with the same type arguments.

  @Description: Check that an interface can inherit one generic interface several times
                if the inheritance is indirect or the type parameters are different

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

interface I1<T> {}
interface I2 <: I1<Int32> {}
interface I <: I1<Int32> & I2 {}

interface J1<T> {}
interface J2 <: J1<Bool> {}
interface J3 <: J1<Bool> {}
interface J4 <: J1<Bool> {}
interface J5 <: J1<Bool> {}
interface J <: J1<Bool> & J2 & J3 & J4 & J5 {}

interface K1<T> {}
interface K2 <: K1<Rune> {}
interface K3 <: K2 {}
interface K4 <: K3 {}
interface K5 <: K4 {}
interface K <: K1<Rune> & K2 & K3 & K4 & K5 {}

interface L1<T> {}
interface L2 <: L1<Unit> {}
interface L<T> <: L1<Unit> & L2 {}

interface M1<T> {}
interface M2 <: M1<Float16> {}
interface M3 <: M1<Float16> {}
interface M4 <: M1<Float16> {}
interface M5 <: M1<Float16> {}
interface M<T> <: M1<Float16> & M2 & M3 & M4 & M5 {}

interface N1<T> {}
interface N2 <: N1<Any> {}
interface N3 <: N2 {}
interface N4 <: N3 {}
interface N5 <: N4 {}
interface N<T> <: N1<Any> & N2 & N3 & N4 & N5 {}

interface O1<T> {}
interface O <: O1<Bool> & O1<String> & O1<Any> & O1<Unit> {}

interface P1<T> {}
interface P<T> <: P1<Int32> & P1<Int64> {}

interface Q1<T1, T2> {}
interface Q <: Q1<Rune, String> & Q1<String, Rune> & Q1<Rune, Rune> & Q1<String, String> {}

interface R1<T1, T2> {}
interface R <: R1<Rune, String> & R1<Rune, Bool> & R1<Rune, Int32> & R1<Rune, Unit> {}

interface S1<T> {}
interface S<T> <: S1<T> & S1<Int64> {}

class IImpl <: I {}
class JImpl <: J {}
class KImpl <: K {}
class LImpl <: L<Bool> {}
class MImpl <: M<String> {}
class NImpl <: N<Unit> {}
class OImpl <: O {}
class PImpl <: P<Float32> {}
class QImpl <: Q {}
class RImpl <: R {}
class SImpl <: S<UInt64> {}

main() {
    let i = IImpl()
    Assert.isTrue(i is I1<Int32>)
    Assert.isTrue(i is I2)

    let j = JImpl()
    Assert.isTrue(j is J1<Bool>)
    Assert.isTrue(j is J2)
    Assert.isTrue(j is J3)
    Assert.isTrue(j is J4)
    Assert.isTrue(j is J5)

    let k = KImpl()
    Assert.isTrue(k is K1<Rune>)
    Assert.isTrue(k is K2)
    Assert.isTrue(k is K3)
    Assert.isTrue(k is K4)
    Assert.isTrue(k is K5)

    let l = LImpl()
    Assert.isTrue(l is L1<Unit>)
    Assert.isTrue(l is L2)

    let m = MImpl()
    Assert.isTrue(m is M1<Float16>)
    Assert.isTrue(m is M2)
    Assert.isTrue(m is M3)
    Assert.isTrue(m is M4)
    Assert.isTrue(m is M5)

    let n = NImpl()
    Assert.isTrue(n is N1<Any>)
    Assert.isTrue(n is N2)
    Assert.isTrue(n is N3)
    Assert.isTrue(n is N4)
    Assert.isTrue(n is N5)

    let o = OImpl()
    Assert.isTrue(o is O1<Bool>)
    Assert.isTrue(o is O1<String>)
    Assert.isTrue(o is O1<Any>)
    Assert.isTrue(o is O1<Unit>)

    let p = PImpl()
    Assert.isTrue(p is P1<Int32>)
    Assert.isTrue(p is P1<Int64>)

    let q = QImpl()
    Assert.isTrue(q is Q1<Rune, String>)
    Assert.isTrue(q is Q1<String, Rune>)
    Assert.isTrue(q is Q1<String, String>)
    Assert.isTrue(q is Q1<Rune, Rune>)

    let r = RImpl()
    Assert.isTrue(r is R1<Rune, String>)
    Assert.isTrue(r is R1<Rune, Bool>)
    Assert.isTrue(r is R1<Rune, Int32>)
    Assert.isTrue(r is R1<Rune, Unit>)

    let s = SImpl()
    Assert.isTrue(s is S1<Int64>)
    Assert.isTrue(s is S1<UInt64>)
}