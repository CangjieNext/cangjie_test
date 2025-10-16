package inc

import std.collection.*
import std.collection

public class A  {
         static public
    let a   : Int64 
    = 1
     private static
    var b: Int64 
    = 2
                public
    let c   : Int64 
=     3
 }

public struct B  {
        public static  let
        a: Int64 
    = 1
        private 
    var b   : Int64 
=     2
}

public class C     <T> {
        private
    let a   : Int64 
    = 1
    let b   : Int32
    = 1
    let c   : (Int64, Int32)
    = (2,3)
     static public var 
    d   : (Int32) -> Unit =
      { _ => 3 }
        static let 
    e   : collection.ArrayList<(Int32, Int32)> = 
    ArrayList<(Int32,Int32)>(10) { _ => (0,0) }
    let 
    f   : ??Int32 = 
    Option<Option<Int32>>.Some(Option<Int32>.Some(3))
    //     static let
    // g   : C<T>
    // = C<T>()
}

public struct D    <T> {
    private
    let a   : Int64 
    = 1
    let b   : Int32
    = 1
    let c   : (Int64, Int32)
    = (2,3)
        public static var 
    d   : (Int32) -> Unit 
    = { _ => 3 }
        static let 
    e   : collection.ArrayList<(Int32, Int32)> = 
    ArrayList<(Int32,Int32)>(10) { _ => (0,0) }
let 
    f   : ??Int32 = 
    Option<Option<Int32>>.Some(Some(3))
// static let
//     g   : D<T>
//     = D<T>()
}

        @C public struct
       E
{
    let a   : Int64 = 
    1;
let     b   : Int32 = 
    50
    var c   : CPointer<Int8> =
    CPointer<Int8>()
    let d   : CFunc<(CPointer<Int8>) -> Unit> = 
    { ptr => println("call from cj lambda") }
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
