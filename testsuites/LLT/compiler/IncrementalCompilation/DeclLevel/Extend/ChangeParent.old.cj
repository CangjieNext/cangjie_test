interface I1 {}
interface I2<T> {}
interface I3<T,U> {}
interface I4 {}

class A1 {}
open class A2<T> {}
open class A3 <: A2<A3> {}
class A4<T> <: A2<T> {}

struct B1 {}
struct B2<T> <: I3<Int32,T> {}
struct B3<T> {}


extend A1 <: I1 {}
extend<T> A2<T> <: I2<A2<T>> {}
extend A3 <: I4 {}
extend<T> A4<T> <: I3<T, A4<T>> {}
extend B1 <: I1 {}
extend<U> B2<U> <: I3<U, B2<Int32>> {}
extend<T> B3<T> <: I3<T, T> {}

func u1() {
    let a = B2<Int32>()
}

func u2() {
    let a = A4<I2<I1>>()
}

main() {}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
