/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_02_a05_01

  @Level:         1

  @Assertion: 6.1.1.2(5)
              A super class can be a generic class.

  @Description: Check that a generic class can be inherited

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006084

*/

import utils.assert.Assert

open class Open<T, U> {}
class FromOpen <: Open<Float32, Float32> {}
class GenericFromOpen<A, B , C> <: Open<A, Bool> {}

abstract class Abstract<T> {}
class FromAbstract <: Abstract<Rune> {}
class GenericFromAbstract<T> <: Abstract<T> {}

sealed abstract class Sealed<T> {}
class FromSealed <: Sealed<Array<Bool>> {}
class GenericFromSealed<U, V> <: Sealed<Rune> {}

main() {
  var fo = FromOpen()
  Assert.isTrue(fo is Open<Float32, Float32>)
  Assert.isTrue(fo is FromOpen)

  var gfo = GenericFromOpen<Int32, Unit, Unit>()
  Assert.isTrue(gfo is Open<Int32, Bool>)
  Assert.isTrue(gfo is GenericFromOpen<Int32, Unit, Unit>)

  var fa = FromAbstract()
  Assert.isTrue(fa is Abstract<Rune>)
  Assert.isTrue(fa is FromAbstract)

  var gfa = GenericFromAbstract<Bool>()
  Assert.isTrue(gfa is Abstract<Bool>)
  Assert.isTrue(gfa is GenericFromAbstract<Bool>)

  var fs = FromSealed()
  Assert.isTrue(fs is Sealed<Array<Bool>>)
  Assert.isTrue(fs is FromSealed)

  var gfs = GenericFromSealed<Object, Object>()
  Assert.isTrue(gfs is Sealed<Rune>)
  Assert.isTrue(gfs is GenericFromSealed<Object, Object>)
}
