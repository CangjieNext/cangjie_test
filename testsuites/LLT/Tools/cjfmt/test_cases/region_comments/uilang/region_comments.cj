// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// REGION: 2:16
class A {

     let p = 1 // abc
    let g =   2 //abc

    // f
    func foo(/*o*/a: /*g*/  Int /*f*/  /*h*/,    b: Int64)     : Float32 {
         1   + 1
    }

    /*c*/
    func bar(   c: Int, b    : Int64):   Float64 { // d
        let c = 5   + 3 // g
    } // l
}

class B {
     let p = 1
    let g =   2

    func foo(a:  Int,    b: Int64)     : Float32 {
         1   + 1
    }

    func bar(   c: Int, b    : Int64):   Float64 {
        let c = 5   + 3 
    }
}