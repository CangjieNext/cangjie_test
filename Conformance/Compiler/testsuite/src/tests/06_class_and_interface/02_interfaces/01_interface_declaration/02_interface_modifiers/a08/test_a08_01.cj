/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_01_02_a08_01

  @Level:         1

  @Assertion: 6.2.1.2(8)
              Sub-interfaces that inherit a sealed interface or sub-classes
              that implement the sealed interface may still modified by sealed, or not.

  @Description: Check that sub-interfaces and sub-classes of sealed interfaces
                may have the 'sealed' modifier or may omit it

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006084, 0006347

*/

import utils.assert.Assert

sealed interface I1 {}

sealed interface I2<T> {}

sealed interface I3 {}

sealed interface I4<T> {}

// Implementation by sealed classes
sealed abstract class SC1 <: I1 {}
sealed abstract class SC2 <: I2<Unit> {}
sealed abstract class SC3 <: I3 {}
sealed abstract class SC4 <: I4<Unit> {}
sealed abstract class SC5<T> <: I1 {}
sealed abstract class SC6<T> <: I2<T> {}
sealed abstract class SC7<T> <: I3 {}
sealed abstract class SC8<T> <: I4<T> {}

// Implementation by non-sealed classes
class C1 <: I1 {}
class C2 <: I2<Unit> {}
class C3 <: I3 {}
class C4 <: I4<Unit> {}
class C5<T> <: I1 {}
class C6<T> <: I2<T> {}
class C7<T> <: I3 {}
class C8<T> <: I4<T> {}

// Inheritance by sealed interfaces
sealed interface SJ1 <: I1 {}
sealed interface SJ2 <: I2<Unit> {}
sealed interface SJ3 <: I3 {}
sealed interface SJ4 <: I4<Unit> {}
sealed interface SJ5<T> <: I1 {}
sealed interface SJ6<T> <: I2<T> {}
sealed interface SJ7<T> <: I3 {}
sealed interface SJ8<T> <: I4<T> {}

// Inheritance by non-sealed interfaces
interface J1 <: I1 {}
interface J2 <: I2<Unit> {}
interface J3 <: I3 {}
interface J4 <: I4<Unit> {}
interface J5<T> <: I1 {}
interface J6<T> <: I2<T> {}
interface J7<T> <: I3 {}
interface J8<T> <: I4<T> {}

class T1 <: SJ1 {}
class T2 <: SJ2 {}
class T3 <: SJ3 {}
class T4 <: SJ4 {}
class T5 <: SJ5<Rune> {}
class T6 <: SJ6<Rune> {}
class T7 <: SJ7<Rune> {}
class T8 <: SJ8<Rune> {}
class T9 <: J1 {}
class T10 <: J2 {}
class T11 <: J3 {}
class T12 <: J4 {}
class T13 <: J5<Rune> {}
class T14 <: J6<Rune> {}
class T15 <: J7<Rune> {}
class T16 <: J8<Rune> {}

main() {
    let t9 = C1()
    Assert.isTrue(t9 is I1)
    let t10 = C2()
    Assert.isTrue(t10 is I2<Unit>)
    let t11 = C3()
    Assert.isTrue(t11 is I3)
    let t12 = C4()
    Assert.isTrue(t12 is I4<Unit>)

    let t13 = C5<Bool>()
    Assert.isTrue(t13 is I1)
    let t14 = C6<Bool>()
    Assert.isTrue(t14 is I2<Bool>)
    let t15 = C7<Bool>()
    Assert.isTrue(t15 is I3)
    let t16 = C8<Bool>()
    Assert.isTrue(t16 is I4<Bool>)

    let t17 = T1()
    Assert.isTrue(t17 is I1)
    let t18 = T2()
    Assert.isTrue(t18 is I2<Unit>)
    let t19 = T3()
    Assert.isTrue(t19 is I3)
    let t20 = T4()
    Assert.isTrue(t20 is I4<Unit>)

    let t21 = T5()
    Assert.isTrue(t21 is I1)
    let t22 = T6()
    Assert.isTrue(t22 is I2<Rune>)
    let t23 = T7()
    Assert.isTrue(t23 is I3)
    let t24 = T8()
    Assert.isTrue(t24 is I4<Rune>)

    let t25 = T9()
    Assert.isTrue(t25 is I1)
    let t26 = T10()
    Assert.isTrue(t26 is I2<Unit>)
    let t27 = T11()
    Assert.isTrue(t27 is I3)
    let t28 = T12()
    Assert.isTrue(t28 is I4<Unit>)

    let t29 = T13()
    Assert.isTrue(t29 is I1)
    let t30 = T14()
    Assert.isTrue(t30 is I2<Rune>)
    let t31 = T15()
    Assert.isTrue(t31 is I3)
    let t32 = T16()
    Assert.isTrue(t32 is I4<Rune>)
}
