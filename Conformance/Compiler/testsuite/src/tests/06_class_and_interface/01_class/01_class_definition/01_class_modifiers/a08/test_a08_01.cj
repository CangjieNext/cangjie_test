/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_01_a08_01

  @Level:         1

  @Assertion: 6.1.1.1(8)
              An abstract class can always be inherited,
              so the modifier open is optional when defining abstract classes.
              Also, you can use sealed modifier.

  @Description: Check that abstract classes can be inherited without the inheritance modifier

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

abstract class AC {
    public func foo(): Unit
    public func bar(): Int32
}

abstract class AG<T> {
    func f1(x: Int32, y: Int32): Int32 {
        return x*y
    }
    public func f2(x: T): T
}

abstract public class APC {
    public func add(x: Int32, y: Int32): Bool
}

abstract public class APG<T> {
    public func add(op1: T, op2: T): T
    public func sub(op1: T, op2: T): T
    public func mul(op1: T, op2: T): T
    public func div(op1: T, op2: T): T
}

public abstract class PAC {
    let x:Int32 = 10

    public func f(): Int32
}

public abstract class PAG<T1, T2> {
    public func foo(x: T1): T2
    public func bar(x: T2): T1
    func foobar(x: T1, y: T2) {
        return 10
    }
}

// Non-abstract classes for runtime checks
class RC <: AC {
    public func foo(): Unit {}
    public func bar(): Int32 {
        return 1
    }
}

class RG <: AG<Float32> {
    public func f2(x: Float32) {
        return x / 2.0
    }
}

class RPC <: APC {
    public func add(x: Int32, y: Int32) {
        return x < y
    }
}

class RPG <: APG<Float64> {
    public func add(op1: Float64, op2: Float64) {
        return op1 + op2
    }
    public func sub(op1: Float64, op2: Float64) {
        return op1 - op2
    }
    public func mul(op1: Float64, op2: Float64) {
        return op1 * op2
    }
    public func div(op1: Float64, op2: Float64) {
        return op1 / op2
    }
}

class PRC <: PAC {
    public func f() {
        return x - 5
    }
}

class PRG <: PAG<Rune, Bool> {
    public func foo(x: Rune): Bool {
        return x != r'a'
    }
    public func bar(x: Bool): Rune {
        if (x == true) {
            return r't'
        } else {
            return r'f'
        }
    }
}


main() {
    var ac  = RC()
    var ag  = RG()
    var apc = RPC()
    var apg = RPG()
    var pac = PRC()
    var pag = PRG()

    Assert.isTrue(ac is AC)
    Assert.isTrue(ac is RC)
    Assert.isTrue(ag is AG<Float32>)
    Assert.isTrue(ag is RG)
    Assert.isTrue(apc is APC)
    Assert.isTrue(apc is RPC)
    Assert.isTrue(apg is APG<Float64>)
    Assert.isTrue(apg is RPG)
    Assert.isTrue(pac is PAC)
    Assert.isTrue(pac is PRC)
    Assert.isTrue(pag is PAG<Rune, Bool>)
    Assert.isTrue(pag is PRG)
}
