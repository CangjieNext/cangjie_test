main(): Unit {}

interface IA<T> {}
interface IM {}
interface IB<T> {}

class CA<A,B>
where A <: IB<A> & IB<B>
{}
class CB<A,B>
where A <: IB<B>
{}
open class CC<A,B,C>
where A <: IA<A>, C <: IA<C>
{}
struct SA<A,B,C>

{}
struct SB<A>

{}
enum EA<A,B>
where B <: IA<B> & IA<A>
{R}
enum SC<A,B>
where B <: IB<B>
{R}
public interface IC<A>

{}
interface ID<A,B>

{}
extend<A> SB<A> <: IA<A>
{}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
