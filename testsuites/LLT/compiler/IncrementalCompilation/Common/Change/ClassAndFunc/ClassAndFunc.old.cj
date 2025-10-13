

main(): Int64 { 
    var x = A(1) 
    var y = B(1) 
    var b: B = foo(y) 
    if(b.b != 1) { 
        return 2 
    } 
    var d: B = goo(x) 
    if(d.b != 0) { 
        return 4 
    } 
    return 0 
} 

open class A { 
    public var a: Int32 
    public init(x: Int32) { a = x + 1 } 
} 

class B <: A { 
    public var b: Int32 
    public init(x: Int32) { 
        super(x) 
        b = x 
    } 
} 

func foo(x: A): A { return x } 
func foo(x: A, y!: A = A(0)): A { return B(0) } 
func foo(x: A, y!: B = B(0)): B { return B(0) } 

func foo(x: B): A { return A(1) } 
func foo(x: B, y!: A = A(0)): A { return B(1) } 
func foo(x: B, y!: B = B(0)): B { return B(1) } 

func goo(x: A): B { return B(0) } 



// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
