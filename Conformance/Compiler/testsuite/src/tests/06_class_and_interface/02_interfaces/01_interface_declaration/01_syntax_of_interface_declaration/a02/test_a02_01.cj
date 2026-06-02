/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_01_01_a02_01

  @Level:         1

  @Assertion: 6.2.1.1(2)
              An interface declaration is compared of the following elements from left to right:
              an optional modifier, the interface keyword, an interface name, an optional <:
              together with the name of the super interface, and an interface bodies enclosed with {}.

  @Description: Check that interfaces defined with the listed elements are created correctly

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006308, 0006084

*/

import utils.assert.Assert

// No optional parts
interface I1 {}

// Modifiers
public interface I2 {}
interface I3 {}
sealed interface I4 {}
public interface I5 {}
sealed interface I6 {}

// Generics
interface I7<T> {}
interface I8<T1, T2> {}

// Generics with constrains
interface I9<T1, T2> {}

// Inheritance
interface I10 <: I1 {}
interface I11 <: I1 & I3 & I7<String> {}

// Modifiers and Generics
public interface I12<T> {}

// Modifiers and generics with constraints
public interface I13<T, U> {}

// Modifiers and inheritance
interface I14 <: I1 {}
public interface I15 <: I5 & I12<Rune> {}

// Inheritance and generics
interface I16<T> <: I7<T> {}
interface I17<T> <: I1 & I3 {}

// Inheritance and generics with constraints
interface I18<T1, T2> <: I1 {}
interface I19<U, V> <: I7<U> & I17<V> {}

// Everything
interface I20<U, V> <: I1 {}
public interface I21<T> <: I2 & I12<T> {}

class TypeChecker<T> {}

main() {
    let i1 = TypeChecker<I1>()
    Assert.isTrue(i1 is TypeChecker<I1>)

    let i2 = TypeChecker<I2>()
    Assert.isTrue(i2 is TypeChecker<I2>)

    let i3 = TypeChecker<I3>()
    Assert.isTrue(i3 is TypeChecker<I3>)

    let i4 = TypeChecker<I4>()
    Assert.isTrue(i4 is TypeChecker<I4>)

    let i5 = TypeChecker<I5>()
    Assert.isTrue(i5 is TypeChecker<I5>)

    let i6 = TypeChecker<I6>()
    Assert.isTrue(i6 is TypeChecker<I6>)

    let i7 = TypeChecker<I7<Rune>>()
    Assert.isTrue(i7 is TypeChecker<I7<Rune>>)

    let i8 = TypeChecker<I8<Int64, Int64>>()
    Assert.isTrue(i8 is TypeChecker<I8<Int64, Int64>>)

    let i9 = TypeChecker<I9<Nothing, Rune>>()
    Assert.isTrue(i9 is TypeChecker<I9<Nothing, Rune>>)

    let i10 = TypeChecker<I10>()
    Assert.isTrue(i10 is TypeChecker<I10>)

    let i11 = TypeChecker<I11>()
    Assert.isTrue(i11 is TypeChecker<I11>)

    let i12 = TypeChecker<I12<String>>()
    Assert.isTrue(i12 is TypeChecker<I12<String>>)

    let i13 = TypeChecker<I13<Bool,Int32>>()
    Assert.isTrue(i13 is TypeChecker<I13<Bool,Int32>>)

    let i14 = TypeChecker<I14>()
    Assert.isTrue(i14 is TypeChecker<I14>)

    let i15 = TypeChecker<I15>()
    Assert.isTrue(i15 is TypeChecker<I15>)

    let i16 = TypeChecker<I16<Unit>>()
    Assert.isTrue(i16 is TypeChecker<I16<Unit>>)

    let i17 = TypeChecker<I17<Rune>>()
    Assert.isTrue(i17 is TypeChecker<I17<Rune>>)

    let i18 = TypeChecker<I18<Object, Any>>()
    Assert.isTrue(i18 is TypeChecker<I18<Object, Any>>)

    let i19 = TypeChecker<I19<Object, Any>>()
    Assert.isTrue(i19 is TypeChecker<I19<Object, Any>>)

    let i20 = TypeChecker<I20<Unit, Unit>>()
    Assert.isTrue(i20 is TypeChecker<I20<Unit, Unit>>)

    let i21 = TypeChecker<I21<Bool>>()
    Assert.isTrue(i21 is TypeChecker<I21<Bool>>)
}
