main(): Unit {}
open class A {}
open class B {}
open class F<T> {}

interface IA {
    func foo(): Int64
}
interface IB {}
interface IC<A> {
    func foo(): Int64
}
interface ID<A> {}
interface IE<A,B,C> {
    func foo(): Int64
}

struct SB<A,B>
{}
enum EB<T>
{R|K}

extend<A,B> SB<A,B> <: IE<A,B,IE<A,B,Int32>>
{
    public func foo(): Int64 {0}
}
extend<T> EB<T> <: IA
{
    public func foo(): Int64 {0}
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
