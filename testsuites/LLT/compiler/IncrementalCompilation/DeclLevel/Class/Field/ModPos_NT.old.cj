internal import std.collection.*

main(): Unit {}

class A {
    public static 
    let a
    = 1
    static private
    var b
    = 2
    public
    let c
    = 3
}

struct B {
    public static 
    let a
    = 1
    private 
    var b
    = 2
}

class C<T> {
    private
    let a
    = 1
    let b
    = 1
    let c
    = (2,3)
    public static var 
    d
    = { => 3 }
    static let 
    e= 
    ArrayList<(Int32,Int32)>(10) { _ => (0,0) }
    let 
    f= 
    Option<Option<Int32>>.Some(Option<Int32>.Some(3))
//    static let
//    g
//    = C<T>()
}

struct D<T> {
    private
    let a
    = 1
    let b
    = 1
    let c
    = (2,3)
    public static var 
    d
    = { => 3 }
    static let 
    e= 
    ArrayList<(Int32,Int32)>(10) { _ => (0,0) }
    let 
    f= 
    Option<Option<Int32>>.Some(Some(3))
//    static let
//    g
//    = D<T>()
}

@C
struct E
{
    let a= 
    1;
    let b= 
    50
    var c=
    CPointer<Int8>()
    let d: CFunc<(CPointer<Int8>) -> Unit> = 
    { ptr => println("call from cj lambda") }
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
