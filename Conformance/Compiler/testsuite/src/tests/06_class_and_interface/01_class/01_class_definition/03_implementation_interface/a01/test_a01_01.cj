/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_03_a01_01

  @Level:         1

  @Assertion: 6.1.1.3(1)
              A class can implement one or more interfaces.

  @Description: Check that a class can implement one or more interfaces

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

interface I {}

class A1 <: I {}

interface I1 {}
interface I2 {}

class A2 <: I1 & I2 {}

interface In1 {}
interface In2 {}
interface In3 {}

class A3 <: In1 & In2 & In3 {}

interface If1 {}
interface If2 {}
interface If3 {}
interface If4 {}

class A4 <: If1 & If2 & If3 & If4 {}

interface G<T> {}

class A5 <: G<Bool> {}

interface G1<U, V> {}
interface G2<T> {}

class A6 <: G1<Rune, Rune> & G2<Unit> {}

interface Gi1<T>  {}
interface Gi2<T>  {}
interface Gi3<T>  {}
interface Gi4<T>  {}
interface Gi5<T>  {}
interface Gi6<T>  {}
interface Gi7<T>  {}
interface Gi8<T>  {}
interface Gi9<T>  {}
interface Gi10<T> {}

class A7 <: Gi1<Int32> & Gi2<Int32> & Gi3<Int32> & Gi4<Int32> & Gi5<Int32> 
            & Gi6<Int32> & Gi7<Int32> & Gi8<Int32> & Gi9<Int32> & Gi10<Int32> {}

interface Gg<T> {}

class A8<T> <: Gg<T> {}

interface Gg1<T> {}
interface Gg2<U> {}

class A9<T1, T2> <: Gg1<T1> & Gg2<T2> {}

interface _g1<T> {}
interface _g2<T> {}
interface _g3<T> {}
interface _g4<T> {}
interface _g5<T> {}

class A10<T> <: _g1<T> & _g2<T> & _g3<T> & _g4<T> & _g5<T> {}

main() {
  var a1 = A1()
  Assert.isTrue(a1 is A1)
  Assert.isTrue(a1 is I)

  var a2 = A2()
  Assert.isTrue(a2 is A2)
  Assert.isTrue(a2 is I1)
  Assert.isTrue(a2 is I2)

  var a3 = A3()
  Assert.isTrue(a3 is A3)
  Assert.isTrue(a3 is In1)
  Assert.isTrue(a3 is In2)
  Assert.isTrue(a3 is In3)

  var a4 = A4()
  Assert.isTrue(a4 is A4)
  Assert.isTrue(a4 is If1)
  Assert.isTrue(a4 is If2)
  Assert.isTrue(a4 is If3)
  Assert.isTrue(a4 is If4)

  var a5 = A5()
  Assert.isTrue(a5 is A5)
  Assert.isTrue(a5 is G<Bool>)

  var a6 = A6()
  Assert.isTrue(a6 is A6)
  Assert.isTrue(a6 is G1<Rune, Rune>)
  Assert.isTrue(a6 is G2<Unit>)

  var a7 = A7()
  Assert.isTrue(a7 is A7)
  Assert.isTrue(a7 is Gi1<Int32>)
  Assert.isTrue(a7 is Gi2<Int32>)
  Assert.isTrue(a7 is Gi3<Int32>)
  Assert.isTrue(a7 is Gi4<Int32>)
  Assert.isTrue(a7 is Gi5<Int32>)
  Assert.isTrue(a7 is Gi6<Int32>)
  Assert.isTrue(a7 is Gi7<Int32>)
  Assert.isTrue(a7 is Gi8<Int32>)
  Assert.isTrue(a7 is Gi9<Int32>)
  Assert.isTrue(a7 is Gi10<Int32>)

  var a8 = A8<Rune>()
  Assert.isTrue(a8 is A8<Rune>)
  Assert.isTrue(a8 is Gg<Rune>)

  var a9 = A9<Float32, Int32>()
  Assert.isTrue(a9 is A9<Float32, Int32>)
  Assert.isTrue(a9 is Gg1<Float32>)
  Assert.isTrue(a9 is Gg2<Int32>)

  var a10 = A10<Unit>()
  Assert.isTrue(a10 is A10<Unit>)
  Assert.isTrue(a10 is _g1<Unit>)
  Assert.isTrue(a10 is _g2<Unit>)
  Assert.isTrue(a10 is _g3<Unit>)
  Assert.isTrue(a10 is _g4<Unit>)
  Assert.isTrue(a10 is _g5<Unit>)
}
