main(): Unit {}

class A 
{}
class B<T>
{}
class C<A,B>
{}
class D<A,B>
{}
class E<A,B>
{}
class F<A,B>
{}
class G<A,B>
{}
class H<A,B>
{}

struct SA
{}
struct SB 
{}
struct SC<A>
{}
struct SD<A>
{}
struct SE<A,B>
{}
struct SG<A,B>
{}
struct SH<A,B>
{}
struct SI<A,B>
{}
struct SJ<A,B>
{}

interface IA
{}
interface IB 
{}
interface IC<A>
{}
interface ID<A>
{}
interface IE<A,B>
{}
interface IG<A,B>
{}
interface IH<A,B>
{}
interface II<A,B>
{}
interface IJ<A,B>
{}

enum EA
{R|U(Int32)}
enum EB
{R|U(Int32)}
enum EC<A>
{R|U(Int32)}
enum ED<A>
{R|U(Int32)}
enum EE<A,B>
{R|U(Int32)}
enum EG<A,B>
{R|U(Int32)}
enum EH<A,B>
{R|U(Int32)}
enum EI<A,B>
{R|U(Int32)}
enum EJ<A,B>
{R|U(Int32)}

extend EA <: IA
{}
extend<A,B> EE<A,B> <: IE<A,B>
{}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
