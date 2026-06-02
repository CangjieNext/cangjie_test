main(): Unit {}

interface IA<T> {}
interface IM {}
interface IB<T> {}

class CA<A,B>
where A <: IB<A> & IB<B>, B <: IB<A> & IB<B>
{}
class CB<A,B>

{}
open class CC<A,B,C>
where A <: IA<A>, B <: IA<C>
{}
struct SA<A,B,C>
where C <: IM
{}
struct SB<A>
where A <: IA<A> & IA<A>
{}
enum EA<A,B>
where B <: IA<A>,  A <: IA<B>
{R}
enum SC<A,B>
where A <: IB<B>
{R}
public interface IC<A>
where A <: IC<A> & IC<A>
{}
interface ID<A,B>
where B <: IM
{}
extend<A> SB<A> <: IA<A>
{}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
