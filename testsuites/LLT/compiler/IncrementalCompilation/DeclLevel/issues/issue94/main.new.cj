class A { 
    public static var a: Int32 = 0O5 
} 

extend A { } 

extend A { 
    public static func me(pteTets!: Int64 = 12): Int64 { 
        println("this is a test") 
        
        func me(pteTets!: Int64 = 12) { 
            
            func me(a!: Int32 = 0O2, pteTets!: Int64 = 12) { 
                return a 
            } 
            return me() 
        } 
        return Int64(me()) 
    } 
} 

main(): Int64 { 
    return A.me() - 0O2 
} 

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
