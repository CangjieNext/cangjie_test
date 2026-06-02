/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_02_a08_01

  @Level:         1

  @Assertion: 6.1.1.2(8)
              All classes except class Object have a super class.

  @Description: Check that user-created classes have a super class

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006084

*/

import utils.assert.Assert

public interface I {}
public open class S {}

// Case #1: Classes without explicit inheritance
// Calling super in a constructor proves that a class has a superclass
open class Open {
  var x: Int64 = 0
  init() {
    super()
    x = 1
  }
}

abstract class Abstract {
  var x: Int64 = 0
  init() {
    super()
    x = 1
  }
}

public class Public {
  var x: Int64 = 0
  init() {
    super()
    x = 1
  }
}

sealed abstract class Sealed {
  var x: Int64 = 0
  init() {
    super()
    x = 1
  }
}

class JustAClass {
  var x: Int64 = 0
  init() {
    super()
    x = 1 
  }
}

open class GOpen<T> {
  var x: Int64 = 0
  init() {
    super()
    x = 1
  }
}

abstract class GAbstract<T> {
  var x: Int64 = 0
  init() {
    super()
    x = 1
  }
}

public class GPublic<T> {
  var x: Int64 = 0
  init() {
    super()
    x = 1
  }
}

sealed abstract class GSealed<T> {
  var x: Int64 = 0
  init() {
    super()
    x = 1
  }
}

class GJustAClass<T> {
  var x: Int64 = 0
  init() {
    super()
    x = 1
  }
}

class Real <: Abstract {}
class GReal <: GAbstract<Bool> {}

func checkCase1() {
  var o = Open()
  var a = Real()
  var p = Public()
  var c = JustAClass()
  var go = GOpen<Bool>()
  var ga = GReal()
  var gp = GPublic<Int64>()
  var gc = GJustAClass<Any>()
  // Check that init() was executed, therefore super() was also called
  Assert.equals(1, o.x)
  Assert.equals(1, a.x)
  Assert.equals(1, p.x)
  Assert.equals(1, c.x)
  Assert.equals(1, go.x)
  Assert.equals(1, ga.x)
  Assert.equals(1, gp.x)
  Assert.equals(1, gc.x)
}

// Case #2: Classes without explicit inheritance but with interface implementations
open class IOpen <: I {
  var x: Int64 = 0
  init() {
    super()
    x = 1
  }
}

abstract class IAbstract <: I {
  var x: Int64 = 0
  init() {
    super()
    x = 1
  }
}

public class IPublic <: I {
  var x: Int64 = 0
  init() {
    super()
    x = 1
  }
}

sealed abstract class ISealed <: I {
  var x: Int64 = 0
  init() {
    super()
    x = 1
  }
}

class IJustAClass <: I {
  var x: Int64 = 0
  init() {
    super()
    x = 1
  }
}

open class IGOpen<T> <: I {
  var x: Int64 = 0
  init() {
    super()
    x = 1
  }
}

abstract class IGAbstract<T> <: I {
  var x: Int64 = 0
  init() {
    super()
    x = 1
  }
}

public class IGPublic<T> <: I {
  var x: Int64 = 0
  init() {
    super()
    x = 1
  }
}

sealed abstract class IGSealed<T> <: I {
  var x: Int64 = 0
  init() {
    super()
    x = 1
  }
}

class IGJustAClass<T> <: I {
  var x: Int64 = 0
  init() {
    super()
    x = 1
  }
}

class IReal <: IAbstract {}
class IGReal <: IGAbstract<Rune> {}

func checkCase2() {
  var io = IOpen()
  var ia = IReal()
  var ip = IPublic()
  var ic = IJustAClass()
  var igo = IGOpen<Bool>()
  var iga = IGReal()
  var igp = IGPublic<Int64>()
  var igc = IGJustAClass<Any>()
  // Check that init() was executed, therefore super() was also called
  Assert.equals(1, io.x)
  Assert.equals(1, ia.x)
  Assert.equals(1, ip.x)
  Assert.equals(1, ic.x)
  Assert.equals(1, igo.x)
  Assert.equals(1, iga.x)
  Assert.equals(1, igp.x)
  Assert.equals(1, igc.x)
}

// Case #3: Classes with explicit inheritance
open class SOpen <: S {
  var x: Int64 = 0
  init() {
    super()
    x = 1
  }
}

abstract class SAbstract <: S {
  var x: Int64 = 0
  init() {
    super()
    x = 1
  }
}

public class SPublic <: S {
  var x: Int64 = 0
  init() {
    super()
    x = 1
  }
}

sealed abstract class SSealed <: S {
  var x: Int64 = 0
  init() {
    super()
    x = 1
  }
}

class SJustAClass <: S {
  var x: Int64 = 0
  init() {
    super()
    x = 1
  }
}

open class SGOpen<T> <: S {
  var x: Int64 = 0
  init() {
    super()
    x = 1
  }
}

abstract class SGAbstract<T> <: S {
  var x: Int64 = 0
  init() {
    super()
    x = 1
  }
}

public class SGPublic<T> <: S {
  var x: Int64 = 0
  init() {
    super()
    x = 1
  }
}

sealed abstract class SGSealed<T> <: S {
  var x: Int64 = 0
  init() {
    super()
    x = 1
  }
}

class SGJustAClass<T> <: S {
  var x: Int64 = 0
  init() {
    super()
    x = 1
  }
}

class SReal <: SAbstract {}
class SGReal <: SGAbstract<Int32> {}

func checkCase3() {
  var so = SOpen()
  var sa = SReal()
  var sp = SPublic()
  var sc = SJustAClass()
  var sgo = SGOpen<Bool>()
  var sga = SGReal()
  var sgp = SGPublic<Int64>()
  var sgc = SGJustAClass<Any>()
  // Check that init() was executed, therefore super() was also called
  Assert.equals(1, so.x)
  Assert.equals(1, sa.x)
  Assert.equals(1, sp.x)
  Assert.equals(1, sc.x)
  Assert.equals(1, sgo.x)
  Assert.equals(1, sga.x)
  Assert.equals(1, sgp.x)
  Assert.equals(1, sgc.x)
}

// Case#4: Classes with explicit inheritance and with interface implementations
open class SIOpen <: I {
  var x: Int64 = 0
  init() {
    super()
    x = 1
  }
}

abstract class SIAbstract <: S & I {
  var x: Int64 = 0
  init() {
    super()
    x = 1
  }
}

public class SIPublic <: S & I {
  var x: Int64 = 0
  init() {
    super()
    x = 1
  }
}

sealed abstract class SISealed <: S & I {
  var x: Int64 = 0
  init() {
    super()
    x = 1
  }
}

class SIJustAClass <: S & I {
  var x: Int64 = 0
  init() {
    super()
    x = 1
  }
}

open class SIGOpen<T> <: S & I {
  var x: Int64 = 0
  init() {
    super()
    x = 1
  }
}

abstract class SIGAbstract<T> <: S & I {
  var x: Int64 = 0
  init() {
    super()
    x = 1
  }
}

public class SIGPublic<T> <: S & I {
  var x: Int64 = 0
  init() {
    super()
    x = 1
  }
}

sealed abstract class SIGSealed<T> <: S & I {
  var x: Int64 = 0
  init() {
    super()
    x = 1
  }
}

class SIGJustAClass<T> <: S & I {
  var x: Int64 = 0
  init() {
    super()
    x = 1
  }
}

class SIReal <: SIAbstract {}
class SIGReal <: SIGAbstract<Any> {}

func checkCase4() {
  var sio = SIOpen()
  var sia = SIReal()
  var sip = SIPublic()
  var sic = SIJustAClass()
  var sigo = SIGOpen<Bool>()
  var siga = SIGReal()
  var sigp = SIGPublic<Int64>()
  var sigc = SIGJustAClass<Any>()
  // Check that init() was executed, therefore super() was also called
  Assert.equals(1, sio.x)
  Assert.equals(1, sia.x)
  Assert.equals(1, sip.x)
  Assert.equals(1, sic.x)
  Assert.equals(1, sigo.x)
  Assert.equals(1, siga.x)
  Assert.equals(1, sigp.x)
  Assert.equals(1, sigc.x)
}

main() {
  checkCase1()
  checkCase2()
  checkCase3()
  checkCase4()
}
