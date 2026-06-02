/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_03_a03_01

  @Level:         1

  @Assertion: 6.1.1.3(3)
              Multiple interfaces are separated by &.

  @Description: Check that a class can implement several interfaces separated by the '&' symbol

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

interface OrdinaryInterface1 {}
interface OrdinaryInterface2 {}
interface OrdinaryInterface3 {}
interface OrdinaryInterface4 {}

interface GenericInterface1<T> {}
interface GenericInterface2<U, V> {}
interface GenericInterface3<X, Y, Z> {}

public interface InterfaceWithMods1 {}
interface InterfaceWithMods2 {}
public interface InterfaceWithMods3 {}

class OnlySimpleInterfaces <: OrdinaryInterface1 & OrdinaryInterface2 & OrdinaryInterface3 & OrdinaryInterface4 {}

class OnlyGenerics <: GenericInterface1<Rune> & GenericInterface2<Rune, Rune> & GenericInterface3<Rune, Rune, Rune> {}

class OnlyMods <: InterfaceWithMods1 & InterfaceWithMods2 & InterfaceWithMods3 {}

class IWantEverything <: OrdinaryInterface1 & OrdinaryInterface2 & OrdinaryInterface3 & OrdinaryInterface4 &
                         GenericInterface1<Int8> & GenericInterface2<Int16, Int16> & GenericInterface3<Int32, Int32, Int32> &
                         InterfaceWithMods1 & InterfaceWithMods2 & InterfaceWithMods3 {}

class GenericWithSimpleInterfaces<T> <: OrdinaryInterface1 & OrdinaryInterface2 & OrdinaryInterface3 & OrdinaryInterface4 {}

class GenericWithGenerics<T> <: GenericInterface1<T> & GenericInterface1<Bool> & GenericInterface1<Rune> & 
                                GenericInterface1<Float32> & GenericInterface1<String> & GenericInterface1<Any> {}

class GenericWithMods<U, V> <: InterfaceWithMods1 & InterfaceWithMods2 & InterfaceWithMods3 {}

class RandomMix<T1, T2, T3> <: GenericInterface2<T1, T2> & OrdinaryInterface3 & OrdinaryInterface1 & InterfaceWithMods3 &
                               InterfaceWithMods1 & GenericInterface1<Rune> {}

main() {
  var c1 = OnlySimpleInterfaces()
  Assert.isTrue(c1 is OnlySimpleInterfaces)
  Assert.isTrue(c1 is OrdinaryInterface1)
  Assert.isTrue(c1 is OrdinaryInterface2)
  Assert.isTrue(c1 is OrdinaryInterface3)
  Assert.isTrue(c1 is OrdinaryInterface4)

  var c2 = OnlyGenerics()
  Assert.isTrue(c2 is OnlyGenerics)
  Assert.isTrue(c2 is GenericInterface1<Rune>)
  Assert.isTrue(c2 is GenericInterface2<Rune, Rune>)
  Assert.isTrue(c2 is GenericInterface3<Rune, Rune, Rune>)

  var c3 = OnlyMods()
  Assert.isTrue(c3 is OnlyMods)
  Assert.isTrue(c3 is InterfaceWithMods1)
  Assert.isTrue(c3 is InterfaceWithMods2)
  Assert.isTrue(c3 is InterfaceWithMods3)

  var c4 = IWantEverything()
  Assert.isTrue(c4 is IWantEverything)
  Assert.isTrue(c4 is OrdinaryInterface1)
  Assert.isTrue(c4 is OrdinaryInterface2)
  Assert.isTrue(c4 is OrdinaryInterface3)
  Assert.isTrue(c4 is OrdinaryInterface4)
  Assert.isTrue(c4 is GenericInterface1<Int8>)
  Assert.isTrue(c4 is GenericInterface2<Int16, Int16>)
  Assert.isTrue(c4 is GenericInterface3<Int32, Int32, Int32>)
  Assert.isTrue(c4 is InterfaceWithMods1)
  Assert.isTrue(c4 is InterfaceWithMods2)
  Assert.isTrue(c4 is InterfaceWithMods3)

  var c5 = GenericWithSimpleInterfaces<String>()
  Assert.isTrue(c5 is GenericWithSimpleInterfaces<String>)
  Assert.isTrue(c5 is OrdinaryInterface1)
  Assert.isTrue(c5 is OrdinaryInterface2)
  Assert.isTrue(c5 is OrdinaryInterface3)
  Assert.isTrue(c5 is OrdinaryInterface4)

  var c6 = GenericWithGenerics<Unit>()
  Assert.isTrue(c6 is GenericWithGenerics<Unit>)
  Assert.isTrue(c6 is GenericInterface1<Unit>)
  Assert.isTrue(c6 is GenericInterface1<Bool>)
  Assert.isTrue(c6 is GenericInterface1<Rune>)
  Assert.isTrue(c6 is GenericInterface1<Float32>)
  Assert.isTrue(c6 is GenericInterface1<String>)
  Assert.isTrue(c6 is GenericInterface1<Any>)

  var c7 = GenericWithMods<Object, Object>()
  Assert.isTrue(c7 is GenericWithMods<Object, Object>)
  Assert.isTrue(c7 is InterfaceWithMods1)
  Assert.isTrue(c7 is InterfaceWithMods2)
  Assert.isTrue(c7 is InterfaceWithMods3)

  var c8 = RandomMix<String, String, String>()
  Assert.isTrue(c8 is RandomMix<String, String, String>)
  Assert.isTrue(c8 is GenericInterface2<String, String>)
  Assert.isTrue(c8 is OrdinaryInterface3)
  Assert.isTrue(c8 is OrdinaryInterface1)
  Assert.isTrue(c8 is InterfaceWithMods3)
  Assert.isTrue(c8 is InterfaceWithMods1)
  Assert.isTrue(c8 is GenericInterface1<Rune>)
}
