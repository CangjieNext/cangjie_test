interface I { 
} 

class A <: I {}

class C { 
    
    static func foo(a: I) { 
        a 
    } 
    
} 

main(): Int64 { 
    if(C.foo(A()) is A && C.foo(A()) is I) { 
        return 0 
    } 
    return 2 
} 



// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
