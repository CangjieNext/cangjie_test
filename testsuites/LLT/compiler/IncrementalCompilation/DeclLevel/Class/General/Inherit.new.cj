main(): Unit {}
open class A {}
open class B {}
open class F<T> {}

interface IA {}
interface IB {}
interface IC<A> {}
interface ID<A> {}
interface IE<A,B,C> {}


class CA <: B 
{}
class CB<T> <: F<T>
{}
class CC<A,B> <: F<A>
{}
class CD<A,B,C> <: F<A> & IA & ID<B>
{}
class CE<A,B,C> <: IE<A,C,B>
{}
class CG <: A
{}
class CH <: F<UInt32> & IB 
{}
class CI <: IC<IB> & IA 
{}
class CJ<T> <: IB & IE<T,T,T> & IC<T>
{}

struct SA <: IC<Int32>
{}
struct SB<A,B> <: IC<Int64> & ID<B>
{}
struct SC<A,B,C> <: IC<A> & IC<B> & IE<A,B,C>
{}

enum EA <: IC<EA>
{R|K}
enum EB<T> <: IC<T> & IC<IC<T>>
{R|K}

interface IM <: IA
{}
interface IN<A,B> <: IE<A,B,A>
{}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
