func foo(a:Int32) {}

func foo<T>(a: Int64, b: T): T 

{
    println(a)
    return b 
}

func bar<A,B>(a: A, a2: A, b: B, b2: B): B 
where A <: Comparable<A>, B <: Less<B>
{
    println(a>a2)
    println(b < b2)
    return b 
}

main() {
    bar(3,4,5.7,Float64(-1))
    ()
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
