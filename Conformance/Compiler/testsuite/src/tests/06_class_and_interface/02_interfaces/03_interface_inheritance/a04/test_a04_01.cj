/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_03_a04_01

  @Level:         1

  @Assertion: 6.2.3(4)
              When inheriting a non-generic interface, it cannot be directly inherited multiple times.

  @Description: Check that an interface can indirectly inherit one interface multiple times

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

interface I1 {}
interface I2 <: I1 {}
interface I <: I1 & I2 {}

interface J1 {}
interface J2 <: J1 {}
interface J3 <: J1 {}
interface J4 <: J1 {}
interface J5 <: J1 {}
interface J <: J1 & J2 & J3 & J4 & J5 {}

interface K1 {}
interface K2 <: K1 {}
interface K3 <: K2 {}
interface K4 <: K3 {}
interface K5 <: K4 {}
interface K <: K1 & K2 & K3 & K4 & K5 {}

interface L1 {}
interface L2 <: L1 {}
interface L<T> <: L1 & L2 {}

interface M1 {}
interface M2 <: M1 {}
interface M3 <: M1 {}
interface M4 <: M1 {}
interface M5 <: M1 {}
interface M<T> <: M1 & M2 & M3 & M4 & M5 {}

interface N1 {}
interface N2 <: N1 {}
interface N3 <: N2 {}
interface N4 <: N3 {}
interface N5 <: N4 {}
interface N<T> <: N1 & N2 & N3 & N4 & N5 {}

class IImpl <: I {}
class JImpl <: J {}
class KImpl <: K {}
class LImpl <: L<Bool> {}
class MImpl <: M<String> {}
class NImpl <: N<Unit> {}

main() {
    let i = IImpl()
    Assert.isTrue(i is I1)
    Assert.isTrue(i is I2)

    let j = JImpl()
    Assert.isTrue(j is J1)
    Assert.isTrue(j is J2)
    Assert.isTrue(j is J3)
    Assert.isTrue(j is J4)
    Assert.isTrue(j is J5)

    let k = KImpl()
    Assert.isTrue(k is K1)
    Assert.isTrue(k is K2)
    Assert.isTrue(k is K3)
    Assert.isTrue(k is K4)
    Assert.isTrue(k is K5)

    let l = LImpl()
    Assert.isTrue(l is L1)
    Assert.isTrue(l is L2)

    let m = MImpl()
    Assert.isTrue(m is M1)
    Assert.isTrue(m is M2)
    Assert.isTrue(m is M3)
    Assert.isTrue(m is M4)
    Assert.isTrue(m is M5)

    let n = NImpl()
    Assert.isTrue(n is N1)
    Assert.isTrue(n is N2)
    Assert.isTrue(n is N3)
    Assert.isTrue(n is N4)
    Assert.isTrue(n is N5)
}