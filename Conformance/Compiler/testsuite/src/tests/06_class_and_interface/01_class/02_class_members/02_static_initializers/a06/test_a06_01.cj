
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        06_01_02_02_a06_01

  @Level:         1

  @Assertion:   6.1.2.2(6) - There can be at most one static initializer in a class or struct;
  @Description: Checks that classes and struct can have zero or one static initializer.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
  @Issue: 6136

*/

import utils.assert.Assert

class C0 { }

class C {
    static var x : Int64

    static init() {
        x = 1
    }
}

class G0<T> { }

class G<T> {
    static var x : Int64

    static init() {
        x = 1
    }
}

struct S0 { }

struct S {
    static var x : Int64

    static init() {
        x = 1
    }
}

abstract class A0 { }

abstract class A {
    static var x : Int64

    static init() {
        x = 1
    }
}

class B0 <: A0 { }

class B <: A { }

main() {
    Assert.isTrue(C0() is C0)
    Assert.isTrue(C() is C)
    Assert.isTrue(G0<Rune>() is G0<Rune>)
    Assert.isTrue(G<Bool>() is G<Bool>)
    Assert.isTrue(S0() is S0)
    Assert.isTrue(S() is S)
    Assert.isTrue(B0() is A0)
    Assert.isTrue(B() is A)
}
