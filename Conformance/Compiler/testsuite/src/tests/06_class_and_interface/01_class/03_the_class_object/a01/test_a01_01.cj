/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_03_a01_01

  @Level:         1

  @Assertion: 6.1.3(1)
              The class Object is the superclass of all other classes (interfaces are not included),
              and the class Object does not contain any members, i.e. Object is an “empty” class

  @Description: Check that the class Object is a superclass of user-defined classes

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006084

*/

import utils.assert.Assert

// No explicit inheritance
class A {}

public class B {}

public open class C {}

sealed abstract class D {}

abstract class E {}

class F<T> {}

public class G<T> {}

open class H<T> {}

sealed abstract class I<T> {}

abstract class J<T> {}

// Explicit inheritance
class K <: C {}

public class L <: C {}

open class M <: C {}

sealed abstract class N <: C {}

abstract class O <: C {}

class P<T> <: C {}

public class Q<T> <: C {}

open class R<T> <: C {}

sealed abstract class S<T> <: C {}

abstract class T<U> <: C {}

main() {
    func f<T>() where T <: Object {
        return 1
    }

    // Instantiate 'f' with different classes,
    // due to the restriction only subclasses of Object
    // can be passed as type arguments
    Assert.equals(1, f<A>())
    Assert.equals(1, f<B>())
    Assert.equals(1, f<C>())
    Assert.equals(1, f<D>())
    Assert.equals(1, f<E>())
    Assert.equals(1, f<F<Unit>>())
    Assert.equals(1, f<G<Unit>>())
    Assert.equals(1, f<H<Unit>>())
    Assert.equals(1, f<I<Unit>>())
    Assert.equals(1, f<J<Unit>>())
    Assert.equals(1, f<K>())
    Assert.equals(1, f<L>())
    Assert.equals(1, f<M>())
    Assert.equals(1, f<N>())
    Assert.equals(1, f<O>())
    Assert.equals(1, f<P<Unit>>())
    Assert.equals(1, f<Q<Unit>>())
    Assert.equals(1, f<R<Unit>>())
    Assert.equals(1, f<S<Unit>>())
    Assert.equals(1, f<T<Unit>>())
}