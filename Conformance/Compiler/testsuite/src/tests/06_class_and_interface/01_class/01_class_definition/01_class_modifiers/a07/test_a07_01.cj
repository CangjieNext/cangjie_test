/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_01_a07_01

  @Level:         1

  @Assertion: 6.1.1.1(7)
              abstract: This class is an abstract class.
              Unlike a common class, an abstract class can define common functions and declare abstract functions.
              Only the class modified by this modifier is an abstract class.
              If a function has no body, we call it an abstract function

  @Description: Check that abstract classes can contain common and abstract functions

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

abstract class AS {
  public func foo(x: Int32): Rune
  public func bar(): Int32

  func foobar() {
    return 1
  }

  let v: Int32 = 1
}

abstract class AG<T> {
  public func abst(x: T): Unit
}

public abstract class PAS {
  public func a(): Unit
  public func b(): Unit
  func c() {}

  static var x = 1
}

public abstract class PAG<U, V> {
  static func s(): Int32 {
    return 5
  }

  public func non_s(): Unit

  init(uu: U, vv: V) {
    u = uu
    v = vv
  }

  var u: U
  var v: V
}

abstract public class APS {
  public func FuNc() : Unit
}

abstract public class APG<T> {
  public func f(x: Int32, y: Int32, z: Int32): Int32
  static func s_ident(t:T) {
    return t
  }
  func ident(t: T) {
    return t
  }

  var x = ""
}

// Non-abstract classes for runtime checks
class RS <: AS {
  public func foo(x: Int32) {
    return r'a'
  }
  public func bar() {
    return v + 1
  }
}

class RG <: AG<Object> {
  public func abst(x: Object) {}
}

class PRS <: PAS {
  public func a(): Unit {
    x++
  }
  public func b(): Unit {
    x--
  }
}

public class PRG <: PAG<Int32, Float32> {
  public func non_s() {}

  init() {
    super(1, 1.0)
  }
}

public class RPS <: APS {
  public func FuNc() {}
}

class RPG <: APG<Bool> {
  public func f(x: Int32, y: Int32, z: Int32) {
    return x*y + z
  }
}


main() {
  let as_ = RS()
  let ag  = RG()
  let pas = PRS()
  let pag = PRG()
  let aps = RPS()
  let apg = RPG()

  Assert.isTrue(as_ is AS)
  Assert.isTrue(ag  is AG<Object>)
  Assert.isTrue(pas is PAS)
  Assert.isTrue(pag is PAG<Int32, Float32>)
  Assert.isTrue(aps is APS)
  Assert.isTrue(apg is APG<Bool>)
}
