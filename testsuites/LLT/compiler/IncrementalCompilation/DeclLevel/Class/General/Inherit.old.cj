main(): Unit {}
open class A {}
open class B {}
open class F<T> {}

interface IA {}
interface IB {}
interface IC<A> {}
interface ID<A> {}
interface IE<A,B,C> {}


class CA
{}
class CB<T>
{}
class CC<A,B>
{}
class CD<A,B,C>
{}
class CE<A,B,C>
{}
class CG <: A & IC<A>
{}
class CH <: F<Int32> & IB 
{}
class CI <: IA 
{}
class CJ<T> <: IB & IC<T> & IE<T,T,T>
{}

struct SA 
{}
struct SB<A,B> <: IC<A> & ID<B>
{}
struct SC<A,B,C> <: IC<A> & IE<A,B,C>
{}

enum EA
{R|K}
enum EB<T> <: IC<T>
{R|K}

interface IM <: IB & IA
{}
interface IN<A,B> <: IC<ID<B>> & IE<A,B,A>
{}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
