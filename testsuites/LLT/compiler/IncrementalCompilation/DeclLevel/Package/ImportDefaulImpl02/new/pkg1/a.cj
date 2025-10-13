package pkg1


public interface fatherInterface { 
    mut func foo2(a!: UInt64): UInt64 { 
        a 
    } 
} 
public interface MyInterface <: fatherInterface { 
    mut func foo2(a!: UInt64): UInt64 { 
        a + a 
    } 
} 

extend UInt32 <: MyInterface { } 


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
