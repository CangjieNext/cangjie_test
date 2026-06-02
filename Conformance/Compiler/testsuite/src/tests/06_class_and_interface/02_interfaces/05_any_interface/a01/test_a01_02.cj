/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_05_a01_02

  @Level:         1

  @Assertion: 6.2.5(1)
              The Any interface is a language built-in empty interface,
              which is by default inherited by all interface types and
              implemented by all non-interface types,
              so all types can be used as subtypes of the Any type.

  @Description: Check that Any is inherited by interfaces

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert
import std.ast.*
import std.collection.*

interface I1 {}
interface I2 {}
interface I3 <: I1 & I2 {}
interface I4 <: Any {}

class InheritanceChecker<T> where T <: Any {}

main() {
    // User-defined interfaces
    let tst1 = InheritanceChecker<I1>()
    Assert.isTrue(tst1 is InheritanceChecker<I1>)

    let tst2 = InheritanceChecker<I2>()
    Assert.isTrue(tst2 is InheritanceChecker<I2>)

    let tst3 = InheritanceChecker<I3>()
    Assert.isTrue(tst3 is InheritanceChecker<I3>)

    let tst4 = InheritanceChecker<I4>()
    Assert.isTrue(tst4 is InheritanceChecker<I4>)

    // Standard interfaces
    let tst5 = InheritanceChecker<ToString>()
    Assert.isTrue(tst5 is InheritanceChecker<ToString>)

    let tst7 = InheritanceChecker<Hasher>()
    Assert.isTrue(tst7 is InheritanceChecker<Hasher>)

    let tst8 = InheritanceChecker<Countable<Int64>>()
    Assert.isTrue(tst8 is InheritanceChecker<Countable<Int64>>)

    let tst9 = InheritanceChecker<Collection<Int64>>()
    Assert.isTrue(tst9 is InheritanceChecker<Collection<Int64>>)

    let tst10 = InheritanceChecker<Iterable<Int64>>()
    Assert.isTrue(tst10 is InheritanceChecker<Iterable<Int64>>)

    let tst11 = InheritanceChecker<Comparable<Int64>>()
    Assert.isTrue(tst11 is InheritanceChecker<Comparable<Int64>>)

    let tst12 = InheritanceChecker<Equatable<Int64>>()
    Assert.isTrue(tst12 is InheritanceChecker<Equatable<Int64>>)

    let tst13 = InheritanceChecker<Hashable>()
    Assert.isTrue(tst13 is InheritanceChecker<Hashable>)

    let tst14 = InheritanceChecker<Iterator<Int64>>()
    Assert.isTrue(tst14 is InheritanceChecker<Iterator<Int64>>)

    let tst15 = InheritanceChecker<Resource>()
    Assert.isTrue(tst15 is InheritanceChecker<Resource>)

    let tst16 = InheritanceChecker<CType>()
    Assert.isTrue(tst16 is InheritanceChecker<CType>)

    let tst17 = InheritanceChecker<ToBytes>()
    Assert.isTrue(tst17 is InheritanceChecker<ToBytes>)

    let tst18 = InheritanceChecker<ToTokens>()
    Assert.isTrue(tst18 is InheritanceChecker<ToTokens>)

    let tst19 = InheritanceChecker<Map<Int64, String>>()
    Assert.isTrue(tst19 is InheritanceChecker<Map<Int64, String>>)

    let tst20 = InheritanceChecker<Set<Int64>>()
    Assert.isTrue(tst20 is InheritanceChecker<Set<Int64>>)
}