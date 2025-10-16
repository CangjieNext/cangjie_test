package pkg1

public open class C0<T0> { 
    public init() {
    } 
    public mut prop p0: Int8 { 
        get() { 
            44
        }
        set(Value) { 
            () 
        } 
    }
}

public open class C2 <: C0<UInt16> {} 

public func f1<T2>(): Bool { 
    C0<UInt16>().p0 
    true
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
