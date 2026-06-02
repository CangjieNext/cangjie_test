/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_11_01_a15_01

  @Level:         1
  @Assertion:       2.1.11.1(15) enums can implement interfaces (for interfaces, see chapter 6).

  @Description:     Checks that it is possible to define enums implementing interfaces

  @Mode:            run
  @Negative:        no
  @Structure:       single

  @Comment:

*/
import utils.assert.Assert

interface I1 {}
interface I2<T> {}
interface I3<U> {}
interface I4<V> <: I2<V> & I3<Int32> {}
enum W<Z> <: I4<Z> & I1 {
  Woosh(Z)
}
enum E <: ToString {
    E1 | E1(E) | E1(E, E)
    public func toString() {"some E"}
}

main() {
    let a = E1
    var b = E1(a)
    var c = E1(b,a)
    print("${c}")
    Assert.isTrue(b is E)
    Assert.isTrue(b is ToString)

    var w = Woosh(c)
    Assert.isTrue(w is W<E>)
    Assert.isTrue(w is I1)
    Assert.isTrue(w is I2<E>)
    Assert.isTrue(w is I3<Int32>)
    Assert.isTrue(w is I4<E>)
    Assert.isFalse(w is W<ToString>)
}
