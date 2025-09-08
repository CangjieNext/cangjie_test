









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
    public var a: Int64 
    
    public init(x: Int64, pteTets!: Int64 = 12) { 
        println("this is a test") 
        a = 1 + x + x 
    } 
} 

class B <: A { 
    public var b: Int64 
    
    public init(x: Int64, pteTets!: Int64 = 12) { 
        super(x) 
        println("this is a test") 
        b = x 
    } 
} 

func foo(x: A, pteTets!: Int64 = 12): A { 
    println("this is a test") 
    return x 
} 

func foo(x: A, y!: A = A(0), pteTets!: Int64 = 12): A { 
    println("this is a test") 
    return B(0) 
} 

func foo(x: A, y!: B = B(0), pteTets!: Int64 = 12): B { 
    println("this is a test") 
    return B(0) 
} 

func foo(x: B, pteTets!: Int64 = 12): A { 
    println("this is a test") 
    return A(1) 
} 

func foo(x: B, y!: A = A(0), pteTets!: Int64 = 12): A { 
    println("this is a test") 
    return B(1) 
} 

func foo(x: B, y!: B = B(0), pteTets!: Int64 = 12): B { 
    println("this is a test") 
    return B(1) 
} 

func goo(x: A, pteTets!: Int64 = 12): B { 
    println("this is a test") 
    return B(0) 
} 





// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
