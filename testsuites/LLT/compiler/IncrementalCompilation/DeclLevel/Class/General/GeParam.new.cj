main(): Unit {}

class A<A>
{}
class B<T,R>
{}
class C<A,B,C>
{}
class D<A>
{}
class E<B>
{}
class F<B,A>
{}
class G<A,C>
{}
class H
{}

struct SA<A>
{}
struct SB<A,B,C>
{}
struct SC<A,B>
{}
struct SD<B,A>
{}
struct SE<A>
{}
struct SG<A,C,B>
{}
struct SH<C,A,B>
{}
struct SI<B,A>
{}
struct SJ
{}

interface IA<A>
{}
interface IB<A,B,C>
{}
interface IC<A,B>
{}
interface ID<B,A>
{}
interface IE<A>
{}
interface IG<A,C,B>
{}
interface IH<C,A,B>
{}
interface II<B,A>
{}
interface IJ
{}

enum EA<A>
{R|U(Int32)}
enum EB<A,B,C>
{R|U(Int32)}
enum EC<A,B>
{R|U(Int32)}
enum ED<B,A>
{R|U(Int32)}
enum EE<A>
{R|U(Int32)}
enum EG<A,C,B>
{R|U(Int32)}
enum EH<C,A,B>
{R|U(Int32)}
enum EI<B,A>
{R|U(Int32)}
enum EJ
{R|U(Int32)}

extend<A> EA<A> <: IA<A>
{}
extend<B> EE<B> <: IE<B>
{}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
