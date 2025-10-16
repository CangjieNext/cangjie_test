main(): Unit {}

    interface IA {}
    interface IB<T> {}
    interface IC<A,B> {}

    extend Int32 <: IA {}
    extend Int32 <: IB<Int32> {}

class CA <A,B>
 where A <: IA & IB<B>
 , B <: IC<A,A>
    {}
class CB <A>
 where A <: IB<Int32> & IB<A>
    {}
struct CC <A,B,C,D>
    where 
    D <: IB<Int32> & IA ,A <: StringBuilder
    , C <: IB<Int32> & IA
    , B <: ToString 
    {}

    enum CD <A,B>
    where A <: IB<Int32> &IA 
    {
        R1|R2(A)
    }
    // interface CE <A,B,C>
    // where 
    //  C <: IB<Int32> & A , A <: IB<IC<B,C>> & IA & IC<IA,IA> & StringBuilder
    // {}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
