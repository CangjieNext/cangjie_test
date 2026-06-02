// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

interface I1 {}
interface I2<T> {}
interface I3<U> {}
public interface I4<V, X> <: I2<V, X> & I3<Int32, X> where T <: I & J, I4 <: T & J {
  func f1(): Unit
  func f2(): Unit {
    return
  }
  static func f3(): Item
  func f4(): Unit {
    return ()
  }
}

struct B<X, Y> <: C<X, Y> & D<X, Y> where X <: T & J, Y <: I {
  B(
    x: Int64, // primary constructor, it's name is the same as the struct
    y: X,
    v!: Int64 = 1, // regular parameter
    private var z!: Y // member variable parameter
  ) {}
  //ABC
}

class A<X, Y> <: C<X, Y> & D<X, Y> where X <: T & J, Y <: I {
  A(
    x: Int64,
    y: X,
    v!: Int64 = 1,
    private var z!: Y
  ) {}
}

enum E<X, Y> <: C<X, Y> & D<X, Y> where T <: I & J, I4 <: T & J {
  A | B(E2)
}

extend<T, V> Foo<T, V> <: Eq<Foo<T, V>> & Boo<T, V> where T <: Eq<T, V> & G, V <: X & D {
  func equals(other: Foo<T>) {
    item.equals(other.item)
  }
}