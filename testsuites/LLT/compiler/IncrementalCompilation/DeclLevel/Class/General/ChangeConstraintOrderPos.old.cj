main(): Unit {}

interface IA {}
interface IB<T> {}
interface IC<A,B> {}

extend Int32 <: IA {}
extend Int32 <: IB<Int32> {}

class CA<A,B>
 where A <:  IB<B> & IA
 , B <: IC<A,A>
{}
class CB<A>
where A <: IB<A> & IB<Int32>
{}
struct CC<A,B,C,D>
where A <: StringBuilder
, B <: ToString 
, C <: IA & IB<Int32>
, D <: IB<Int32> & IA 
{}

enum CD<A,B>
where A <: IA & IB<Int32>
{
    R1|R2(A)
}
// interface CE<A,B,C>
// where A <: IA & IB<IC<B,C>> & IC<IA,IA> & StringBuilder
// , C <: IB<Int32> & A 
// {}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
