package inc


sealed public interface I { 
    func f0(): Bool {
        true
    } 
} 
public open class Class_yyy < T0 > <: I { 
    public init() { 
    } 
            
    public open override func f0(): Bool { 
        true
    } 
} 
public open class Class_xxx <: Class_yyy < Unit > & I { 
    public init() { 
    } 
    
    public open override func f0(): Bool { 
        true
    } 
}        
@Frozen
public func f <T0>(): Int64 {   
    let x = Class_xxx()
    var y: Class_yyy<Unit>= Class_yyy()  
    0
} 
            
            


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
